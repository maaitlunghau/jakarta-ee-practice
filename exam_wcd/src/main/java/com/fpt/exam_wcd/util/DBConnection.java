package com.fpt.exam_wcd.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/exam_wcd?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=Asia/Ho_Chi_Minh";
        String user = "root";
        String pass = "112233"; // Theo cấu hình từ project trước
        return DriverManager.getConnection(url, user, pass);
    }
}
