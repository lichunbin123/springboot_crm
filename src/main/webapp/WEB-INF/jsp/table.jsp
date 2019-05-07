<%@ page language="java"
	contentType="application/msexcel; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	response.setHeader("Content-disposition", "attachment; filename=test.xls");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	border-collapse: collapse;
	width: 1000px;
	margin: 0 auto;
}

table, td, th {
	border: 1px solid black;
}

a {
	text-decoration: none;
	color: #333;
}

a:hover {
	color: #ff0000;
}
</style>
</head>
<body>
	<table style="table-layout: fixed">
		<!-- table-layout:fixed 防止table里的th td 设置宽度无效 -->
		<tr>
			<th>ID</th>
						<th>考生类型</th>
						<th>考生编号</th>
						<th>学院代码</th>
						<th>学院名称</th>
						<th>专业代码</th>
						<th>专业名称</th>
						<th>姓名</th>
						<th>政治理论</th>
						<th>外国语</th>
						<th>专业课一</th>
						<th>专业课二</th>
						<th>初试成绩</th>
						<th>笔试成绩</th>
						<th>面试成绩</th>
						<th>口语成绩</th>
						<th>复试成绩</th>
		</tr>
		<%
		%>
		<tr>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
	</table>
</body>
</html>
