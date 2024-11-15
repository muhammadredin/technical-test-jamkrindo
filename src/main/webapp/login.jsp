<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Form</title>
    <link rel="stylesheet" href="styles.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        body {
            background-color: #f3f4f6;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            width: 100%;
            max-width: 28rem;
            background-color: #fff;
            padding: 2rem;
            border-radius: 0.5rem;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        h2 {
            font-size: 1.5rem;
            font-weight: 700;
            text-align: center;
            margin-bottom: 1.5rem;
        }

        label {
            display: block;
            font-size: 1rem;
            font-weight: 600;
            color: #4b5563;
        }

        input {
            margin-top: 0.25rem;
            display: block;
            width: 100%;
            padding: 0.625rem;
            border: 1px solid #d1d5db;
            border-radius: 0.375rem;
        }

        input:focus {
            outline: none;
            border-color: #3b82f6;
        }

        button {
            width: 100%;
            padding: 0.5rem 1rem;
            background-color: #2563eb;
            color: #fff;
            font-weight: 600;
            border-radius: 0.375rem;
            transition: background-color 0.2s ease-in-out;
        }

        button:hover {
            background-color: #1d4ed8;
        }

        .text-center {
            text-align: center;
        }

        .text-sm {
            font-size: 0.875rem;
        }

        .text-blue-600 {
            color: #2563eb;
        }

        .text-blue-600:hover {
            text-decoration: underline;
        }

        .text-red-500 {
            color: #ef4444;
        }

    </style>
</head>
<body>

<div class="container">
    <h2>Login</h2>
    <form action="<%= request.getContextPath() %>/api/login" method="POST" id="loginForm">
        <div class="mb-4">
            <label for="username">Username</label>
            <input type="text" id="username" name="username" required/>
            <span id="usernameError" class="text-red-500"></span>
        </div>

        <div class="mb-6">
            <label for="password">Password</label>
            <input type="password" id="password" name="password" required/>
            <span id="passwordError" class="text-red-500"></span>
        </div>

        <div class="flex items-center justify-between">
            <button type="submit">Login</button>
        </div>
    </form>
</div>

<script src="validation.js"></script>
</body>
</html>

