<%@ page import="io.github.muhammadredin.jamkrindoform.Student" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="io.github.muhammadredin.jamkrindoform.Department" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Departments Table</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100%;
            height: 100%;
        }
        table {
            width: 50%;
            border-collapse: collapse;
        }

        th, td {
            border: 1px solid #000;
            padding: 8px;
            text-align: center;
        }

        th {
            background-color: #0077cc;
            color: white;
        }

        /* Hover effect to show it's clickable */
        .student-id {
            cursor: pointer; /* Make the cursor a hand to indicate it's clickable */
            transition: background-color 0.3s, transform 0.2s;
        }

        .student-id:hover {
            background-color: #f0f0f0; /* Light background on hover */
            transform: scale(1.05); /* Slightly enlarge the element */
        }

        /* Click effect */
        .student-id.clicked {
            background-color: #d0d0d0; /* Change background color when clicked */
            transform: scale(1); /* Reset scale when clicked */
        }

        .student-modal {
            width: 300px;  /* Adjust width */
            height: 100px; /* Adjust height */
            background-color: #0077cc;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            z-index: 1000;
            border-radius: 10px;
            padding: 20px;
            color: white;
            display: none; /* Hide modal by default */
            text-align: center;
        }

        .modal-content {
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            height: 100%;
        }

        #student-name {
            font-size: 1.5em;
            margin-bottom: 20px; /* Space between name and button */
        }

        .close-button {
            background-color: #f44336;
            color: white;
            border: none;
            padding: 10px;
            cursor: pointer;
            font-size: 1.2em;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .close-button:hover {
            background-color: #d32f2f;
        }

    </style>
</head>
<body>
<table>
    <tr>
        <th>Department</th>
        <th>Student ID</th>
        <th>Marks</th>
        <th>Pass %</th>
    </tr>

    <%
        List<Department> departments = (ArrayList<Department>) request.getAttribute("departments");
        for (Department department : departments) {
            // Get the size of the students list for row span
            int studentsCount = department.getStudents().size();
    %>

    <%-- Iterate through the students of the department --%>
    <%
        for (int i = 0; i < studentsCount; i++) {
            Student student = department.getStudents().get(i);

            // Open a new row for the first student in each department
            if (i == 0) {
    %>
    <tr>
        <td rowspan="<%= studentsCount %>"><%= department.getName() %></td>
        <%
            }
        %>

        <!-- Add student ID to td as a data attribute for later use -->
        <td data-id="<%= student.getId() %>" data-name="<%= student.getName() %>" class="student-id">
            <%= student.getId() %>
        </td>

        <td><%= student.getMarks() %></td>

        <%-- Display Pass Percentage for the first student in the department --%>
        <%
            if (i == 0) {
        %>
        <td rowspan="<%= studentsCount %>"><%= department.getPassPercentage() %></td>
        <%
            }
        %>

        <%-- Close the row for all students except the first one --%>
        <%
            if (i != 0) {
        %>
    </tr>
    <%
        }
    %>
    <%
        }
    %>

    <%
        }
    %>
</table>

<!-- Modal HTML -->
<div id="studentModal" class="student-modal">
    <div class="modal-content">
        <h2 id="student-name"></h2>
        <button id="modal-close" class="close-button">Close</button>
    </div>
</div>

<!-- jQuery and Script to handle modal -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function() {
        // When a student ID is clicked
        $('.student-id').click(function() {
            // Add a clicked class for visual feedback
            $(this).addClass('clicked');

            // Remove the clicked class after a brief moment to reset the effect
            setTimeout(() => {
                $(this).removeClass('clicked');
            }, 200); // Duration in milliseconds (200ms for quick feedback)

            // Get the student name from the clicked element's data-name attribute
            var studentName = $(this).data('name');  // Get the student's name

            // Set student name in the modal
            $('#student-name').text(studentName);

            // Show the modal
            $('#studentModal').fadeIn();
        });

        // Close the modal
        $('#modal-close').click(function() {
            $('#studentModal').fadeOut();
        });
    });
</script>


</body>
</html>
