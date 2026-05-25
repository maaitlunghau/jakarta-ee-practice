
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"/>

        <title>Filter Page</title>
    </head>
    <body class="container">
        <h1>src01_Filter</h1>
        <form action="second_servlet" method="post">
            <div class="d-flex align-items-center gap-2">
                <input type="text"
                       name="txtName"
                       placeholder="Enter your Name"
                       class="form-control w-auto">

                <input type="submit"
                       value="Next"
                       class="btn btn-primary">
            </div>
            <div class="d-flex align-items-center gap-2 pt-1">
                <input type="button"
                       value="Back"
                       class="btn btn-secondary" onclick="window.location.href = '${pageContext.request.contextPath}'">
            </div>
        </form>
    </body>
</html>
