<%--
  Created by IntelliJ IDEA.
  User: lcb
  Date: 4/4/19
  Time: 5:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/upload.action" method="post"  id="uploadForm" enctype="multipart/form-data">
    　　<input id="file" type="file" name="file"/>
    　　<input type="submit" name="submit" id="submit" value="upload" />
</form>
</body>
</html>
