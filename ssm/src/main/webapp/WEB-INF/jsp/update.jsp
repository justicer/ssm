<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%-- <% 
String path = request.getContextPath(); 
// 获得本项目的地址(例如: http://localhost:8080/MyApp/)赋值给basePath变量 
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
// 将 "项目路径basePath" 放入pageContext中，待以后用EL表达式读出。 
pageContext.setAttribute("basePath",basePath); 
%>  --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${PATH }/resources/css/bootstrap.min.css" type="text/css" />
<link rel="stylesheet" href="${PATH }/resources/css/font-awesome.min.css" type="text/css" />
<link rel="stylesheet" href="${PATH }/resources/css/main.css" type="text/css" />
<script type="text/javascript" src="${PATH }/resources/js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="${PATH }/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${PATH }/resources/js/docs.min.js"></script>
<title>Insert title here</title>
<style>
	.tree li {
        list-style-type: none;
		cursor:pointer;
	}
	table tbody tr:nth-child(odd){background:#F4F4F4;}
	table tbody td:nth-child(even){color:#C00;}
	</style>
</head>
<body>

<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container-fluid">
        <div class="navbar-header">
          <div><a class="navbar-brand" style="font-size:32px;" href="#">小恒哥系统 - 用户维护</a></div>
        </div>
			<%@include file="/WEB-INF/jsp/header.jsp"%>
      </div>
    </nav>

    <div class="container-fluid" >
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
			<%@include file="/WEB-INF/jsp/menu.jsp"%>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<ol class="breadcrumb">
				  <li><a href="#">首页</a></li>
				  <li><a href="${PATH }/user/list">数据列表</a></li>
				  <li class="active">修改</li>
				</ol>
			<div class="panel panel-default">
              <div class="panel-heading">表单数据<div style="float:right;cursor:pointer;" data-toggle="modal" data-target="#myModal"><i class="glyphicon glyphicon-question-sign"></i></div></div>
			  <div class="panel-body">
				<form role="form">
				  <div class="form-group">
					<label for="exampleInputPassword1">登陆账号</label>
					<input type="text" class="form-control" id="user_name"  placeholder="请输入登陆账号"  value=${user.user_name }>
				  </div>
				  <div class="form-group">
					<label for="exampleInputPassword1">密码</label>
					<input type="text" class="form-control" id=psd placeholder="请输入用户密码"   value=${user.password }>
				  </div>
				  <div class="form-group">
					<label for="exampleInputEmail1">联系电话</label>
					<input type="email" class="form-control" id="phone" placeholder="请输入联系电话"   value=${user.phone }>
				  </div>
				  <div class="form-group">
					<label for="exampleInputEmail1">邮箱地址</label>
					<input type="email" class="form-control" id="email" placeholder="请输入邮箱地址"   value=${user.email }>
					<p class="help-block label label-warning">请输入合法的邮箱地址, 格式为： xxxx@xxxx.com</p>
				  </div>
				  <div class="form-group">
					<label for="exampleInputEmail1">现住地址</label>
					<input type="email" class="form-control" id="address" placeholder="请输入现住地址"   value=${user.address }>
				  </div>
				  <div>
					  <span id="error" style="color:red;" ></span>
			   	  </div>
				  <button type="button" class="btn btn-success" id="update"><i class="glyphicon glyphicon-plus"></i>修改</button>
				  <button type="button" class="btn btn-danger"><i class="glyphicon glyphicon-refresh"></i> 重置</button>
				</form>
			  </div>
			</div>
        </div>
      </div>
    </div>
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
		<div class="modal-content">
		  <div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
			<h4 class="modal-title" id="myModalLabel">帮助</h4>
		  </div>
		  <div class="modal-body">
			<div class="bs-callout bs-callout-info">
				<h4>测试标题1</h4>
				<p>测试内容1，测试内容1，测试内容1，测试内容1，测试内容1，测试内容1</p>
			  </div>
			<div class="bs-callout bs-callout-info">
				<h4>测试标题2</h4>
				<p>测试内容2，测试内容2，测试内容2，测试内容2，测试内容2，测试内容2</p>
			  </div>
		  </div>
		  -->
		</div>
	  </div>
	</div>


</body>
<script type="text/javascript">
            $(function () {
			    $(".list-group-item").click(function(){
				    if ( $(this).find("ul") ) {
						$(this).toggleClass("tree-closed");
						if ( $(this).hasClass("tree-closed") ) {
							$("ul", this).hide("fast");
						} else {
							$("ul", this).show("fast");
						}
					}
				});
            });
            
            $("#update").click(function(){
            	alert(123);
            	var user_id = ${user.user_id};
            	alert(user_id);
            	var user_name = $.trim($("#user_name").val());
            	var password = $.trim($("#psd").val());
            	var email =$.trim( $("#email").val());
            	var phone = $.trim($("#phone").val());
            	var address = $.trim($("#address").val());
            	if(user_name != "" && password != "" && email != "" && phone != "" && address != ""){
            		$.ajax({
                    	type:"POST",
                    	url:"${PATH }/user/update",
                    	data:{
                    		user_id:user_id,
                    		user_name:user_name,
                    		password:password,
                    		email:email,
                    		phone:phone,
                    		address:address
                    	},
                    	success:function(data){
                    		if(data.message == "ok"){
                    			window.location.href="${PATH }/user/list";
                    		}else{
                    			$("#error").html(data.message);
                    		}
                    	}
                    });
            	}else{
            		$("#error").html("信息不能为空！");
            	}
            	
            });
</script>
</html>