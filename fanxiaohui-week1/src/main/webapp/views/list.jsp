<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/css/css.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	
	function tolook(zid) {
		location.href = "${pageContext.request.contextPath }/zhi/findById?zid="+zid;
	}
	function toadd() {
		location.href = "${pageContext.request.contextPath }/views/add.jsp";
	}
	function toupdate(zid) {
		location.href = "${pageContext.request.contextPath }/zhi/toupdate?zid="+zid;
	}
	function todel(zid) {
		$.ajax({
			type:"post",
			url:"${pageContext.request.contextPath }/zhi/del",
			data:{"zid":zid},
			success:function(ret) {
				if(ret){
					alert("删除成功");
					location.href = "${pageContext.request.contextPath }/zhi/findAll";
				}else{
					alert("删除失败");
					location.href = "${pageContext.request.contextPath }/zhi/findAll";
				}
			}
		});
	}
	function ckall() {
		var all = $("[name=all]").prop("checked");
		$("[name=ck]").prop("checked",all);
	}
	
	function dels() {
		var ids = "";
		$("[name=ck]:checked").each(function(){
			ids += ","+this.value;
		});
		ids = ids.substring(1);
		if(confirm("确定要删除编号为"+ids+"的数据吗？")){
			$.ajax({
				type:"post",
				url:"${pageContext.request.contextPath }/zhi/del",
				data:{"zid":ids},
				success:function(ret) {
					if(ret){
						alert("删除成功");
						location.href = "${pageContext.request.contextPath }/zhi/findAll";
					}else{
						alert("删除失败");
						location.href = "${pageContext.request.contextPath }/zhi/findAll";
					}
				}
			});
		}
	}
	
</script>

<title>展示页面</title>
</head>
<body>
	<center>
		<table border="1px">
			<tr align="center">
				<td><input type="button" value="添加" onclick="toadd()"></td>
				<td colspan="5">
				<form action="${pageContext.request.contextPath }/zhi/findAll" method="post">
					<input name="zname">
					<input type="submit" value="搜索">
				</form>
				</td>
			<tr>
			<tr align="center">
				<td><input type="checkbox" name="all" onclick="ckall()">全选</td>
				<td>序号 </td>
				<td>植物名称</td>
				<td>描述</td>
				<td>类别</td>
				<td>操作</td>
			<tr>
			<c:forEach items="${pi.list }" var="z">
			<tr align="center">
				<td><input type="checkbox" name="ck" value="${z.zid }"></td>
				<td>${z.zid }</td>
				<td>${z.zname }</td>
				<td>${z.zms }</td>
				<td>${z.gname }</td>
				<td>
					<input type="button" value="查看" onclick="tolook(${z.zid })">
					<input type="button" value="修改" onclick="toupdate(${z.zid })">
					<input type="button" value="删除" onclick="todel(${z.zid })">
				</td>
			</tr>
			</c:forEach>
			<tr>
				<td><input type="button" value="批量删除" onblur="dels()"></td>
				<td colspan="5" align="center">
					<a href="${pageContext.request.contextPath }/zhi/findAll?pageNum=${pi.firstPage}">首页</a>
					<a href="${pageContext.request.contextPath }/zhi/findAll?pageNum=${pi.prePage}">上一页</a>
					<a href="${pageContext.request.contextPath }/zhi/findAll?pageNum=${pi.nextPage}">下一页</a>
					<a href="${pageContext.request.contextPath }/zhi/findAll?pageNum=${pi.lastPage}">尾页</a>
					当前是第${pi.pageNum }页/共计${pi.pages }页
				</td>
			</tr>
		</table>
	</center>
</body>
</html>