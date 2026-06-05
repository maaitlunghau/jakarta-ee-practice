<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login Page</title>
    <style>
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; display: flex; justify-content: center; align-items: center; height: 100vh; background: #f0f2f5; margin: 0; }
        .login-card { background: white; padding: 2rem; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.1); width: 100%; max-width: 400px; }
        .login-card h2 { margin-top: 0; color: #1c1e21; text-align: center; }
        .form-group { margin-bottom: 1.5rem; }
        .form-group label { display: block; margin-bottom: 0.5rem; color: #4b4f56; }
        .form-group input { width: 100%; padding: 0.75rem; border: 1px solid #dddfe2; border-radius: 6px; box-sizing: border-box; }
        .login-btn { width: 100%; padding: 0.75rem; background-color: #1877f2; border: none; border-radius: 6px; color: white; font-weight: bold; font-size: 1rem; cursor: pointer; }
        .login-btn:hover { background-color: #166fe5; }
        .error-msg { color: #fa3e3e; text-align: center; margin-bottom: 1rem; font-size: 0.9rem; }
    </style>
</head>
<body>
    <div class="login-card">
        <h2>Admin Login</h2>
        <% if(request.getParameter("error") != null) { %>
            <div class="error-msg">Invalid username or password. Please try again.</div>
        <% } %>
        <form method="POST" action="j_security_check">
            <div class="form-group">
                <label for="j_username">Username</label>
                <input type="text" id="j_username" name="j_username" required>
            </div>
            <div class="form-group">
                <label for="j_password">Password</label>
                <input type="password" id="j_password" name="j_password" required>
            </div>
            <button type="submit" class="login-btn">Login</button>
        </form>
    </div>
</body>
</html>
