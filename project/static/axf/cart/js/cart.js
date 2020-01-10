$(document).ready(function () {


    var subShoppings=document.getElementsByClassName('subShopping1')
    var addShoppings=document.getElementsByClassName('addShopping1')
    //addShopping
    for (var i=0;i<addShoppings.length;i++){
        addShopping=addShoppings[i]
        addShopping.addEventListener('click',function () {   //添加点击事件
            pid=this.getAttribute('ga1')    //获取商品ID
            $.post('/changecart/0/',{'productid':pid},function (data) {   //AJAX请求，修改商品数量。定义0为添加
                if(data.status=='success'){
                    //添加成功，把中间的SPAN的innerHTML变成当前的数量
                    document.getElementById(pid).innerHTML=data.data
                    document.getElementById(pid+'price').innerHTML=data.price
                }

            })

        },false)
    }

    //subShopping
    for (var i=0;i<subShoppings.length;i++){
        subShopping=subShoppings[i]
        subShopping.addEventListener('click',function () {   //添加点击事件
            pid=this.getAttribute('ga1')    //获取商品ID
            $.post('/changecart/1/',{'productid':pid},function (data) {   //AJAX请求，修改商品数量。定义0为添加
                if(data.status=='success'){
                    //添加成功，把中间的SPAN的innerHTML变成当前的数量
                    document.getElementById(pid).innerHTML=data.data
                    document.getElementById(pid+'price').innerHTML=data.price
                    if(data.data==0){
                        // window.location.href='/cart/'    //AJAX 返回数据即数量为0的话则刷新页面，也可删除结点，下边是操作方法
                        var li=document.getElementById(pid+'lis')
                        li.parentNode.removeChild(li)

                    }
                }

            })

        },false)
    }
})