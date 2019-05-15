<%--
  Created by IntelliJ IDEA.
  User: YasanMa
  Date: 2019/5/14
  Time: 8:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <script type="text/javascript">
        function createXMLHttpRequest(){
            try{
                return new XMLHttpRequest();
            }catch (e) {
                try{
                    return ActiveXObject("Msxm12.XMLHTTP");
                }catch(e){
                    try{
                        return ActiveXObject("Microsoft.XMLHTTP");
                    }catch(e){
                        throw e;
                    }
                }
            }
        }
        window.onload=function () {
            var userEle=document.getElementById("userEle");
            var passEle1=document.getElementById("passEle1");
            var passEle2=document.getElementById("passEle2");
            passEle2.onblur=function () {
                //1.得到异步对象
                var xmlHttp=createXMLHttpRequest();
                //2.打开链接
                xmlHttp.open("POST","<c:url value="/RegistServlet"/>",true);
                //3.设置请求头Content-type
                xmlHttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
                //4.发送请求，给出请求体
                xmlHttp.send ("username="+userEle.value+"&&password1="+passEle1.value+"&&password2="+passEle2.value);
                //5.给xmlhttp的onreadystatechange事件注册监听
                xmlHttp.onreadystatechange=function () {
                    if(xmlHttp.readyState==4&&xmlHttp.status==200){//双重判断
                        var text=xmlHttp.responseText;
                        if(text=="1"){
                            var span1=document.getElementById("errorSpan1");
                            span1.innerHTML="用户名不符合要求！需要以字母开头后跟字母或数字长度至少6位！";
                        }else if(text=="2") {
                            var span2 = document.getElementById("errorSpan2");
                            span2.innerHTML = "两次密码不一致！";
                        }else if(text=="3"){
                            var span2=document.getElementById("errorSpan2");
                            span2.innerHTML="密码需要全部由数字组成，且长度在6-10位";
                        }
                    }
                }

            }
        }
    </script>
    <title>注冊演示界面</title>
</head>
<body>
    <form>
        用 户 名：<input type="text" name="username" id="userEle"/><span id="errorSpan1" ></span><br>
        密    码：<input type="password" name="password1" id="passEle1"/><span id="errorSpan2"></span><br>
        确认密码：<input type="password" name="password2" id="passEle2"/><br>
        <input type="submit" value="注册"/>&nbsp;&nbsp;
        <input type="reset" value="重置"/>
    </form>
</body>
</html>
