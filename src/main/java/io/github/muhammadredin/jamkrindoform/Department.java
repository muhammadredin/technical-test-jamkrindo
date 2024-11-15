package io.github.muhammadredin.jamkrindoform;

import java.util.ArrayList;
import java.util.List;

public class Department {
    private String name;
    private List<Student> students = new ArrayList<>();
    private double passPercentage;

    public Department(String name) {
        this.name = name;
    }

    public void addStudent(Student student) {
        students.add(student);
    }

    public void calculatePassPercentage() {
        long passCount = students.stream().filter(student -> student.getMarks() >= 50).count();
        this.passPercentage = (students.size() > 0) ? ((double) passCount / students.size()) * 100 : 0;
    }

    public String getName() { return name; }
    public List<Student> getStudents() { return students; }
    public double getPassPercentage() { return passPercentage; }
}