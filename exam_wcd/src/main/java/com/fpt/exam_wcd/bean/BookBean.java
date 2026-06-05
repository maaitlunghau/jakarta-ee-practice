package com.fpt.exam_wcd.bean;

import com.fpt.exam_wcd.util.DBConnection;
import com.fpt.exam_wcd.entity.Book;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookBean {

    // use JDBC API to view data in database
    public List<Book> findAll() {
        List<Book> list = new ArrayList<>();
        String sql = "SELECT * FROM tbBook";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            
            while (rs.next()) {
                list.add(new Book(
                    rs.getInt("id"),
                    rs.getString("title"),
                    rs.getString("author"),
                    rs.getInt("edition"),
                    rs.getString("photo")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // use JDBC API to store data in database
    public boolean createBook(Book newBook) {
        String sql = "INSERT INTO tbBook (title, author, edition, photo) VALUES (?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, newBook.getTitle());
            ps.setString(2, newBook.getAuthor());
            ps.setInt(3, newBook.getEdition());
            ps.setString(4, newBook.getPhoto());
            
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
