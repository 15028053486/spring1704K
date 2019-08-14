<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	function garden() {
		var url = "${pageContext.request.contextPath }/Gardens/findAll";
		$.post(url,function(list) {
			for ( var i in list) {
				var op = '<option value="'+list[i].gid+'">'+list[i].gname+'</option>';
				$("#se").append(op);
			}
		});
	}
</script>
<title>添加页面</title>
</head>
<body onload="garden()">
	<form action="${pageContext.request.contextPath }/zhi/add" method="post">
		植物名称：<input type="text" name="zname"><br>
		描述：<input type="text" name="zms" ><br>
		类别：<select id="se" name="gname"></select><br>
		<input type="submit" value="添加">
	</form>
</body>
</html>