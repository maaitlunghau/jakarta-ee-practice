<%--
  Created by IntelliJ IDEA.
  User: maaitlunghau
  Date: 27/5/26
  Time: 21:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login Page</title>
</head>
<body>
  <form action="j_security_check" method="post">
    <table>
      <tr>
        <td align="right"></td>
        <td>
          <h1>Login</h1>
        </td>
      </tr>
      <tr>
        <td align="right">Username: </td>
        <td>
          <input type="text" name="j_username" placeholder="Enter your username" autofocus>
        </td>
      </tr>
      <tr>
        <td align="right">Password: </td>
        <td>
          <input type="password" name="j_password" placeholder="Enter your password">
        </td>
      </tr>
      <tr>
        <td align="right"></td>
        <td>
          <input type="submit" value="Login">
        </td>
      </tr>
    </table>
  </form>
</body>
</html>
