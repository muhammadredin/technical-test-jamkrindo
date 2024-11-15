package io.github.muhammadredin.jamkrindoform;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "welcomeServlet", value = "/api/students")
public class WelcomeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<Department> departments = new ArrayList<>();

        // Department 1
        Department dep1 = new Department("dep1");
        dep1.addStudent(new Student("S1", "Budi", 35));
        dep1.addStudent(new Student("S2", "Agus", 70));
        dep1.addStudent(new Student("S3", "Imam", 60));
        dep1.addStudent(new Student("S4", "Dody", 90));
        departments.add(dep1);

        // Department 2
        Department dep2 = new Department("dep2");
        dep2.addStudent(new Student("S5", "Lily", 30));
        departments.add(dep2);

        // Department 3
        Department dep3 = new Department("dep3");
        dep3.addStudent(new Student("S6", "Bambang", 32));
        dep3.addStudent(new Student("S7", "Silvi", 70));
        dep3.addStudent(new Student("S8", "Gita", 20));
        departments.add(dep3);

        // Calculate Pass Percentage
        for (Department department : departments) {
            department.calculatePassPercentage();
        }

        request.setAttribute("departments", departments);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/welcome.jsp");
        dispatcher.forward(request, response);
    }
}