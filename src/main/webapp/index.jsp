<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Simple Login</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; }
        .success { color: green; font-weight: bold; margin-top: 15px; }
        .error { color: red; font-weight: bold; margin-top: 15px; }
    </style>
</head>
<body>

    <h2>Login Screen</h2>

    <%
        // 1. Define stored credentials in arrays
        String[] validUsers = {"admin", "alex", "user123"};
        String[] validPasses = {"password123", "secret", "pass123"};

        // 2. Capture form submissions
        String inputUser = request.getParameter("username");
        String inputPass = request.getParameter("password");
        
        boolean loginSuccess = false;
        boolean formSubmitted = (inputUser != null && inputPass != null);

        // 3. Verify against the arrays if form was submitted
        if (formSubmitted) {
            for (int i = 0; i < validUsers.length; i++) {
                if (validUsers[i].equals(inputUser) && validPasses[i].equals(inputPass)) {
                    loginSuccess = true;
                    break;
                }
            }
        }
    %>

    <!-- 4. The HTML Login Form (Submits to itself) -->
    <form action="index.jsp" method="POST">
        <label>Username:</label><br>
        <input type="text" name="username" required><br><br>
        
        <label>Password:</label><br>
        <input type="password" name="password" required><br><br>
        
        <button type="submit">Login</button>
    </form>

    <!-- 5. Display the status message directly on the page -->
    <% if (formSubmitted) { %>
        <% if (loginSuccess) { %>
            <p class="success">Login Successful!</p>
        <% } else { %>
            <p class="error">Invalid username or password.</p>
        <% } %>
    <% } %>

</body>
</html>
