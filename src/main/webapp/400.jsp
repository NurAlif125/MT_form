<%-- 
    Document   : 400
    Created on : 30 Jul 2025, 11.42.30
    Author     : rafli
--%>

<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>400 - Bad Request</title>
    <style>
        body {
            margin: 0;
            font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #c31432, #240b36);
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
        <h1>400</h1>
        <p>Bad Request</p>
        <p>Your request couldn't be understood by the server.</p>
        <a href="<%= request.getContextPath() %>/">Back</a>
    </div>
</body>
</html>