<%-- 
    Document   : 500
    Created on : 30 Jul 2025, 11.12.30
    Author     : rafli
--%>

<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>500 - Internal Server Error</title>
    <style>
        body {
            margin: 0;
            font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #2c3e50, #4ca1af);
            color: white;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
            text-align: center;
        }
        .error-box {
            background: rgba(0, 0, 0, 0.3);
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.4);
        }
        h1 {
            font-size: 72px;
            margin: 0;
        }
        p {
            font-size: 20px;
            margin-top: 10px;
        }
        a {
            margin-top: 20px;
            display: inline-block;
            background: #ffffff22;
            padding: 10px 20px;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            transition: background 0.3s ease;
        }
        a:hover {
            background: #ffffff44;
        }
    </style>
</head>
<body>
    <div class="error-box">
        <h1>500</h1>
        <p>Oops! Internal Server Error.</p>
        <p>Something went wrong on our side. Please try again later.</p>
        <a href="<%= request.getContextPath() %>/">Back</a>
    </div>
</body>
</html>
