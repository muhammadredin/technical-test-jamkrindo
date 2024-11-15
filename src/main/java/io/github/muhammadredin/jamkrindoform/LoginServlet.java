package io.github.muhammadredin.jamkrindoform;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet( name="loginServlet", value="/api/login" )
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get form data
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        if (username.equals("admin") && password.equals("admin")) {
            response.sendRedirect(request.getContextPath() + "/index.jsp");
            return;
        }
        response.sendRedirect(request.getContextPath() + "/login.jsp");
    }
}
