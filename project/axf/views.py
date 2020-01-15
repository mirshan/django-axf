from django.http import HttpResponseRedirect, HttpResponse
from django.shortcuts import render, redirect
from .models import Wheel, Nav, Mustbuy, Foodtypes, Goods, User,Cart,Order

# register用的，登录也用，就放到这里了
import time  # 用于生成token
import random  # 用于生成token
from django.conf import settings  # 用于处理图片


# Create your views here.
# 学习重定向
def index(request):
    # return HttpResponseRedirect('/home')    #另一种方式
    return redirect('/home/')


def home(request):
    wheelsList = Wheel.objects.all()
    navList = Nav.objects.all()
    mustbyList = Mustbuy.objects.all()

    return render(request, 'axf/home.html',
                  {'title': '主页', 'wheelsList': wheelsList, 'navList': navList, 'mustbyList': mustbyList})


# 超市
def market(request, categoryid, cid, sortid):  # categoryid是产品总分类，cid是产品细分的分类
    leftSilder = Foodtypes.objects.all()
    if cid == '0':
        productList = Goods.objects.filter(categoryid=categoryid)  # 获取一类产品列表
    else:
        productList = Goods.objects.filter(categoryid=categoryid, childcid=cid)

    # 排序
    if sortid == '1':
        productList = productList.order_by('-productnum')
    elif sortid == '2':
        productList = productList.order_by('price')
    elif sortid == '3':
        productList = productList.order_by('-price')

    group = leftSilder.get(typeid=categoryid)  # 为了拿全部分类:0#牛奶:1这些数据
    childList = []  # 定义一个数组
    childnames = group.childtypenames
    # 开始切数据
    arr1 = childnames.split('#')
    for str in arr1:
        arr2 = str.split(':')
        obj = {'childName': arr2[0], 'childId': arr2[1]}
        childList.append(obj)

    #准备拿token验证是否登录，如果登录，则显示加到购物车里的商品数量
    token=request.session.get('token')
    cartList=[]
    if token:
        user=User.objects.get(userToken=token)
        cartList=Cart.objects.filter(userAccount=user.userAccount)
        #取出数据列表，准备修改market.html模板，使其加载时就把数量加载上

        #给商品加一个num值，用于加载商品列表数量显示
        for p in productList:
            for c in cartList:
                if c.productid==p.productid:
                    p.num=c.productnum      #相等有num不相等用模板default:0，给商品新增加的属性
                    continue

    return render(request, 'axf/market.html',
                  {'title': '超市', 'leftSilder': leftSilder, 'productList': productList, 'childList': childList,
                   'categoryid': categoryid, 'cid': cid})










# 购物车
def cart(request):
    token=request.session.get('token')
    cartList=[]
    if token!=None:
        user=User.objects.get(userToken=token)
        cartList=Cart.objects.filter(userAccount=user.userAccount)

    return render(request, 'axf/cart.html', {'title': '购物车','cartList':cartList})



def changecart(request, flag):
    # 判断是否登录
    token = request.session.get('token')
    if token == None:
        # 没登录
        return JsonResponse({'data':-1,'status':'error'})   #-1表示未登录
    else:
        productid=request.POST.get('productid')
        #根据productid去goods表里取出产品价格等信息
        product=Goods.objects.get(productid=productid)     #如果用filter就不行，只能用get
        #get（）返回的是一个对象，filter（）返回的是由对象组成的列表，称为查询集

        user=User.objects.get(userToken=token)

        #0是加号
        if flag=='0':
            # 判断库存情况，如果达到库存返回error页面不做反应即可
            if product.storenums == 0:
                return JsonResponse({'data': -2, 'status': 'error'})

            carts=Cart.objects.filter(userAccount=user.userAccount)    #返回用户的添加的商品
            if carts.count()==0:

                #直接增加一个商品
                c=Cart.createcart(user.userAccount,productid,1,product.price,True,product.productimg,product.productlongname,False)   #新增数量直接写1即可
                c.save()
            else:
                try:
                    c=carts.get(productid=productid) #如果拿到商品，修改商品价格数量等信息
                    c.productnum+=1
                    c.productprice='%.2f' % (product.price * c.productnum)
                    c.save()


                except Cart.DoesNotExist as e:    #如果没拿到则直接增加
                    # 直接增加一个商品
                    c = Cart.createcart(user.userAccount, productid, 1, product.price, True, product.productimg,product.productlongname, False)  # 新增数量直接写1即可
                    c.save()
            #库存减1
            product.storenums-=1
            product.save()
            return JsonResponse({'data':c.productnum,'price':c.productprice,'status':'success'})


        elif flag=='1':
            carts = Cart.objects.filter(userAccount=user.userAccount)  # 返回用户的添加的商品
            if carts.count() == 0:
                return JsonResponse({'data': -2, 'status': 'error'})  #没有此账户点击的商品减无可减

            else:
                try:
                    c = carts.get(productid=productid)  # 如果拿到商品，修改商品价格数量等信息
                    c.productnum -= 1
                    c.productprice = '%.2f' % (product.price * c.productnum)
                    if c.productnum==0:
                        c.delete()
                    else:
                        c.save()


                except Cart.DoesNotExist as e:  # 如果没拿到则直接增加
                    #减无可减
                    return JsonResponse({'data': -2, 'status': 'error'})  # 商品数量变0后无法再减，不走try从这里返回status=error,页面不做响应
            # 库存减1
            product.storenums += 1
            product.save()
            return JsonResponse({'data': c.productnum, 'price':c.productprice,'status': 'success'})

        #2表示点击对勾时产生的效果，从购物车里清除商品
        elif flag=='2':
            carts=Cart.objects.filter(userAccount=user.userAccount)
            c=carts.get(productid=productid)
            c.isChose=not c.isChose
            c.save()
            str='O'
            if c.isChose==1:
                str='<span style="color: red;">√</span>'
            return JsonResponse({'data':str,'status':'success'})




        # elif flag=='3':
        #     pass
        return JsonResponse({'data':1,'status':'success'})



#订单
def saveorder(request):
    # 判断是否登录
    token = request.session.get('token')
    if token == None:
        # 没登录
        return JsonResponse({'data': -1, 'status': 'error'})  # -1表示未登录
    user=User.objects.get(userToken=token)
    carts=Cart.objects.filter(isChose=True)     #选择被选中的
    if carts.count()==0:
        return JsonResponse({'data': -1, 'status': 'error'})

    #生成订单
    oid=time.time()+random.randrange(1,100000)
    oid='%d '% oid
    o=Order.createorder(oid,user.userAccount,0)
    o.save()

    for item in carts:
        item.isDelete=True
        item.orderid=oid
        item.save()
    return JsonResponse({'status':'success'})



def order(request):
    # 判断是否登录
    token = request.session.get('token')
    if token == None:
        # 没登录
        return JsonResponse({'data': -1, 'status': 'error'})  # -1表示未登录
    user=User.objects.get(userToken=token)
    carts = Cart.obj2.filter(userAccount=user.userAccount).order_by('-orderid')  # 选择被选中的
    return render(request,'axf/order.html',{'productList':carts})









def mime(request):
    username = request.session.get('username', '登录')
    # username=request.session['username']
    token = request.session.get('token')
    userImg = request.session.get('userImg')

    return render(request, 'axf/mime.html', {'title': '我的', 'username': username, 'token': token, 'userImg': userImg})


def base(request):
    wheelsList = Wheel.objects.all()
    return render(request, 'axf/base.html', {'wheelsList': wheelsList})


def default(request):
    wheelsList = Wheel.objects.all()
    return render(request, 'axf/default.html', {'wheelsList': wheelsList})


from .forms.login import LoginForm


def login(request):
    if request.method == 'POST':
        f = LoginForm(request.POST)
        if f.is_valid():  # 信息格式没问题的话
            nameid = f.cleaned_data['username']  # username
            pswd = f.cleaned_data['passwd']  # passwd
            print(nameid, pswd)

            try:
                user = User.objects.get(userAccount=nameid)
                if user.userPasswd != pswd:
                    return redirect('/login/')
            except User.DoesNotExist as e:
                return redirect('/login/')

            # 登录成功
            token = time.time() + random.randrange(1, 1000000)  # 时间加随机数
            user.userToken = str(token)
            user.save()  # 把token存进去
            request.session['username'] = user.userName  # 创建session，状态保持
            request.session['token'] = user.userToken  # token验证账户
            request.session['userImg'] = user.userImg
            return redirect('/mime/')

        else:  # 验证有问题
            return render(request, 'axf/login.html', {'title': '登录', 'form': f, 'error': f.errors})

    else:
        f = LoginForm()  # 如果不是POST把表单传进来
        return render(request, 'axf/login.html', {'title': '登录', 'form': f})


import time  # 用于生成token
import random  # 用于生成token
from django.conf import settings  # 用于处理图片
import os


def register(request):
    if request.method == 'POST':  # 如果是POST请求，要获取所有提交的值
        userAccount = request.POST.get('userAccount')
        userPasswd = request.POST.get('userPass')
        userName = request.POST.get('userName')
        userPhone = request.POST.get('userPhone')
        userAddress = request.POST.get('userAddress')
        userRank = 0
        token = time.time() + random.randrange(1, 1000000)  # 时间加随机数
        userToken = str(token)

        f = request.FILES['userImg']  # 拿到文件描述符
        imgStr = str(int(time.time())) + str(       #也可以用'%d'%time.time()来变成字符串
            random.randrange(1000000, 19999999999)) + '.png'  # 网页绝对路径无法显示图片，只能分段生成，这里是图片的名字采用时间戳+随机数的方式生成，保证不会重名
        userImg = os.path.join(settings.MEDIA_ROOT, imgStr)  # 生成图片保存的路径
        imgStrSave = '/static/media/' + imgStr  # 这里是生成图片存储到数据库的名字

        # 保存图片
        with open(userImg, 'wb') as fp:
            for data in f.chunks():
                fp.write(data)
        user = User.createuser(userAccount, userPasswd, userName, userPhone, userAddress, imgStrSave, userRank,
                               userToken)
        user.save()  # 保存成功，重定向

        request.session['username'] = userName  # 创建session，状态保持
        request.session['token'] = userToken  # token验证账户
        request.session['userImg'] = imgStrSave

        return redirect('/mime/')

    else:
        return render(request, 'axf/register.html', {'title': '注册'})


from django.http import JsonResponse  # 如果取不到返回一段JSON数据，这里需要引用


# 验证离焦时是否账号已被注册
def checkuserid(request):
    userid = request.POST.get('userid')
    try:
        user = User.objects.get(userAccount=userid)  # 如果取到数据表示成功，不能再注册
        return JsonResponse({'data': '该用户已被注册', 'status': 'error'})  # 前面被data接收，后面被status接收
    except User.DoesNotExist as e:
        return JsonResponse({'data': '该用户可以注册', 'status': 'success'})  # 前面被data接收，后面被status接收,此时返回register的JS的AJAX里处理数据
    # 注意POST时如果403，就去settings.py中关闭csrf


# 退出登录
from django.contrib.auth import logout


def quit(request):
    logout(request)  # 清除了所有的session和cookies
    return redirect('/mime/')


def test(request):
    return render(request,'axf/test.html')