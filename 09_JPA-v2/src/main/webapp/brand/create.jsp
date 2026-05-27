<%--
  Created by IntelliJ IDEA.
  User: maaitlunghau
  Date: 27/5/26
  Time: 20:14
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Tạo mới thương hiệu</title>
  <style>
    .err {
      color: red;
      font-style: italic;
    }
  </style>
</head>
<body>
  <form action="${ pageContext.request.contextPath }">
    <input type="hidden" name="action" value="process-create">

    <table>
      <tr>
        <td></td>
        <td>
          Create new Brand
        </td>
        <td></td>
      </tr>
      <tr>
        <td align="right">Brand Name:</td>
        <td>
          <input type="text" name="txtName" placeholder="Enter brand name" autofocus>
        </td>
        <td>
          <c:if test="${ not empty errors.name }">
            <span class="err">
              ${errors.name}
            </span>
          </c:if>
        </td>
      </tr>
      <tr>
        <td align="right">Head Office: </td>
        <td>
          <input type="text" name="txtContact" placeholder="Enter head office">
        </td>
        <td>
          <c:if test="${ not empty errors.contact }">
            <span class="err">
                ${errors.contact}
            </span>
          </c:if>
        </td>
      </tr>
      <tr>
        <td align="right">Website: </td>
        <td>
          <input type="text" name="txtWeb" placeholder="Enter website">
        </td>
        <td>
          <c:if test="${ not empty errors.web }">
            <span class="err">
                ${errors.web}
            </span>
          </c:if>
        </td>
      </tr>
      <tr>
        <td align="right"></td>
        <td>
          <input type="submit" value="Create">
        </td>
        <td>

        </td>
      </tr>
    </table>
  </form>
</body>
</html>
