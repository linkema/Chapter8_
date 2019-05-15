<%--
  Created by IntelliJ IDEA.
  User: YasanMa
  Date: 2019/5/9
  Time: 15:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>提交网页</title>
</head>
<body>
<p style="color: red; font-size: 11pt; font-weight: 900;">
    ${msg }
</p>
    <form action="Second.jsp" method="post">
        username<input type="text" name="username" value="${form }"><br/>
        userpass<input type="text" name="userpass"><br/>
        <input type="submit" value="提交">&nbsp;<input type="reset" value="重置">
    </form>
</body>
</html>
