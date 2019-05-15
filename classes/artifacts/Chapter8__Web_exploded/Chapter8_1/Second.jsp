<%--
  Created by IntelliJ IDEA.
  User: YasanMa
  Date: 2019/5/9
  Time: 15:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>处理信息的中间层</title>
</head>
<body>
<c:choose>
    <c:when test="${ param.username eq 'abc' and param.userpass eq '123' }">
        <%
            String s=request.getParameter("username");
            request.getSession().setAttribute("form",s);
        %>
        <jsp:forward page="Third.jsp" />
    </c:when>
    <c:otherwise>
        <%
            request.setCharacterEncoding("utf-8");
            response.setContentType("text/html;charset=utf-8");
            String msg="用户名或密码错误！请重新输入！";
            String s=request.getParameter("username");
            request.getSession().setAttribute("msg",msg);
            request.setAttribute("form",s);
        %>
        <jsp:forward page="First.jsp"/>
    </c:otherwise>
</c:choose>

</body>
</html>
