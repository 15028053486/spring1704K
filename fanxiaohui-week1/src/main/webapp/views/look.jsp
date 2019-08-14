<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	
</script>
<title>详情页面</title>
</head>
<body>
	编号：<input name="zid" value="${list.zid }" readonly="readonly"><br>
	植物名称：<input name="zname" value="${list.zname }" readonly="readonly"><br>
	描述：<input name="zms" value="${list.zms }" readonly="readonly"><br>
	类别：<input name="gname" value="${list.gname }" readonly="readonly"><br>
</body>
</html>