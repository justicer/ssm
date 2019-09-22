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
<link rel="stylesheet" href="${PATH }/resources/css/sweetalert2.min.css" type="text/css" />
<script type="text/javascript" src="${PATH }/resources/js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="${PATH }/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${PATH }/resources/js/docs.min.js"></script>
<script type="text/javascript" src="${PATH }/resources/js/sweetalert2.min.js"></script>
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
			<div class="panel panel-default">
			  <div class="panel-heading">
				<h3 class="panel-title"><i class="glyphicon glyphicon-th"></i> 数据列表</h3>
			  </div>
			  <div class="panel-body">
<form class="form-inline" role="form" style="float:left;">
  <div class="form-group has-feedback">
    <div class="input-group">
      <div class="input-group-addon">查询条件</div>
      <input class="form-control has-success" id="queryContent" type="text" placeholder="请输入查询条件">
    </div>
  </div>
  <button type="button" class="btn btn-warning" id="query"><i class="glyphicon glyphicon-search"></i> 查询</button>
</form>
<button type="button" class="btn btn-danger" style="float:right;margin-left:10px;"><i class=" glyphicon glyphicon-remove"></i> 删除</button>
<button type="button" class="btn btn-primary" style="float:right;" onclick="window.location.href='add.html'"><i class="glyphicon glyphicon-plus"></i> 新增</button>
<br>
 <hr style="clear:both;">
          <div class="table-responsive">
            <table class="table  table-bordered">
              <thead>
                <tr >
                  <th width="30" style="text-align:center;">#</th>
				  <th width="30" style="text-align:center;"><input type="checkbox"></th>
                  <th style="text-align:center;">用户名</th>
                  <th style="text-align:center;">电话</th>
                  <th style="text-align:center;">邮箱</th>
                  <th style="text-align:center;">地址</th>
                  <th width="100" style="text-align:center;">操作</th>
                </tr>
              </thead>
              <tbody>
               <c:forEach items = "${list }" var="user">
							<tr>
								<td style="text-align:center;">${user.user_id }</td>
			 				    <td style="text-align:center;"><input type="checkbox"></td>
								<td style="text-align:center;">${user.user_name }</td>
								<td style="text-align:center;">${user.phone}</td>
								<td style="text-align:center;">${user.email}</td>
								<td style="text-align:center;">${user.address}</td>
								<td style="text-align:center;">
									<a onclick="del(${user.user_id})" style="cursor:pointer;margin-left:-35px;">删除</a> 
									<a style="margin-left:-2px;">|</a>
					            	<a onclick="edit(${user.user_id} )" style="cursor:pointer;position: absolute;">修改</a>
								</td>
							</tr>
						  </c:forEach>
              </tbody>
			  <tfoot>
			     <tr >
				     <td colspan="7" align="right">
						<ul class="pagination">
								<li id="firstPage"><a class="firstPage" href="${PATH }/user/list?page=1">首页</a></li>
								<li id="prev"><a class="prev" href="${PATH }/user/list?page=${pageInfo.pageNum-1 }">上一页</a></li>
								<c:forEach items="${pageInfo.navigatepageNums}" var="s">  
									<c:if test="${pageInfo.pageNum == s}">
										<li class="active"><a  href="${PATH }/user/list?page=${s}">${s}</a></li>  
									</c:if>
									<c:if test="${pageInfo.pageNum != s}">
										<li><a  href="${PATH }/user/list?page=${s}">${s}</a></li>  
									</c:if>
							    </c:forEach> 
								<li id="next"><a class="next" href="${PATH }/user/list?page=${pageInfo.pageNum+1 }">下一页</a></li>
								<li id="lastPage"><a class="lastPage" href="${PATH }/user/list?page=${pageInfo.pages }">尾页</a></li>
								<li><a>共${pageInfo.pages }页</a></li>
								<li ><a>第${pageInfo.pageNum}页</a></li>
							 </ul>
					 </td>
				 </tr>

			  </tfoot>
            </table>
          </div>
			  </div>
			</div>
        </div>
      </div>
    </div>


</body>
<script type="text/javascript">
            $(function () {
            	
            	var firstPage = ${pageInfo.firstPage};
            	var pageNum = ${pageInfo.pageNum};
            	var lastPage = ${pageInfo.lastPage};
            	
            	if(firstPage == pageNum){
            		//去除li标签的点击事件
            		$("#firstPage").addClass("disabled");
            		$("#prev").addClass("disabled");
            		//让li标签的恢复点击事件
            		$("#next").removeClass("disabled");
            		$("#lastPage").removeClass("disabled");
            		
            		//去除a标签的点击事件
            		$('.firstPage').removeAttr('href');
            		$('.prev').removeAttr('href');
            	}
            	
            	if(lastPage == pageNum){
            		//让li标签的恢复点击事件
            		$("#firstPage").removeClass("disabled");
            		$("#prev").removeClass("disabled");
            		//去除li标签的点击事件
            		$("#next").addClass("disabled");
            		$("#lastPage").addClass("disabled");
            		
            		//去除a标签的点击事件
            		$(".next").removeAttr("href");
            		$(".lastPage").removeAttr("href");
            	}
            	
            	
            	
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
            
            $("tbody .btn-success").click(function(){
                window.location.href = "assignRole.html";
            });
            $("tbody .btn-primary").click(function(){
                window.location.href = "edit.html";
            });
            
            //查询用户
            $("#query").click(function(){
            	
            	var queryContent = $("#queryContent").val();
            	alert(queryContent);
            	 $.ajax({
                 	type:"POST",
                 	url:"${PATH }/user/likQueryUser",
                 	data:{
                 		queryContent:queryContent
                 	},
                 	success:function(data){
                 		/* if(data.message == "ok"){
                 		}else{
                 			//$("#error").html(data.message);
                 		} */
                 	}
                 });
            });
            
            function del(id){
            	swal({
          		  title: '警告！',
          		  text: "你确定要删除用户吗？",
          		  type: 'warning',
          		  showCancelButton: true,
          		  confirmButtonColor: '#3085d6',
          		  cancelButtonColor: '#d33',
          		  confirmButtonText: 'Yes, delete it!'
          		}).then(function(isConfirm) {
          		  if (isConfirm) {
	          			$.ajax({
		                 	type:"POST",
		                 	url:"${PATH }/user/delete",
		                 	data:{
		                 		id:id
		                 	},
		                 	success:function(data){
		                 		window.location.href="${PATH }/user/list"
		                 	}
	                 });
          		  }
          		});
            }
            
            function edit(id){
             		window.location.href="${PATH }/user/ToUpdate?id="+id;
            }
</script>
</html>