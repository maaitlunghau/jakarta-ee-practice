

<%@page import="ex.maven.tld.MyTLD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/tlds/mytag" prefix="mt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"/>

        <title>TLD Page</title>
    </head>
    <body class="container">
        <h1>Tag Library Descriptor</h1>

        <%
            String name = "Phạm Đăng Vinh";
            int[] num = {1, 3, 5, 7, 9};
            pageContext.setAttribute("number", num);


        %>
        <h3>
            1.Display by Scriptlet: <%= MyTLD.doUpper(name)%>
            2. Display by EL: function in mytag:
            <h4>
                + function "chuhoa": ${mt:chuhoa("hello,Vinh")}
                <br>
                + function "chuthuong": ${mt:chuthuong("Hello,Vinh")}
                <br>
                + function "tong": ${mt:tong(number)}
            </h4>
        </h3>
    </body>
</html>
