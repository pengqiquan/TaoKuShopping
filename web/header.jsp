<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%--
该scrip在包含
 <script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
 <script src="js/bootstrap.min.js" type="text/javascript"></script>
才javascrip才有效
--%>

<script type="text/javascript">
   $(function () {

       //这里的代码是在整个页面加载完成后执行。
       //文档就绪事件
       //发一个异步的ajax的post
       $.post("category",function (data) {
           $.each(data,function (index,cate){
               //去查找分类的列表
               $("#categorylist").append("<li class='active'><a href='ProductCategory?cid="+cate.cid+"'>"+cate.cname+"<span class='sr-only'>(current)</span></a></li>")
           });
       },"json");

   });

</script>

<!--
描述：菜单栏
-->
<div class="container-fluid">
    <div class="col-md-4">
        <img src="img/logo3.png" />
    </div>
    <div class="col-md-3" style="padding-top:20px">
        <c:choose>
             <c:when test="${not empty user}">
                <ol class="list-inline">
                    <li><a href="#">欢迎你${user.username}</a></li>
                    <li><a href="/logout">注销用户</a></li>
                    <li><a href="cart.jsp">购物车</a></li>
                </ol>
             </c:when>
            <c:otherwise>
                <ol class="list-inline">
                    <li><a href="login.jsp">登录</a></li>
                    <li><a href="regist.jsp">注册</a></li>
                    <li><a href="cart.htm">购物车</a></li>
                </ol>
            </c:otherwise>
        </c:choose>
    </div>
</div>
<!--
描述：导航条
-->
<div class="container-fluid">
    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">首页</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav" id="categorylist">
<%--                    <li class="active"><a href="#">手机数码<span class="sr-only">(current)</span></a></li>
                    <li><a href="#">电脑办公</a></li>
                    <li><a href="#">电脑办公</a></li>
                    <li><a href="#">电脑办公</a></li>--%>
                </ul>
                <form class="navbar-form navbar-right" role="search">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Search">
                    </div>
                    <button type="submit" class="btn btn-default">Submit</button>
                </form>

            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>
</div>

