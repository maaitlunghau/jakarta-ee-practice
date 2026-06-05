package com.fpt.exam_wcd.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "tbBook")
public class Book {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "title", length = 100)
    private String title;

    @Column(name = "author", length = 60)
    private String author;

    @Column(name = "edition")
    private int edition;

    @Column(name = "photo", length = 150)
    private String photo;

    public Book() {}

    public Book(int id, String title, String author, int edition, String photo) {
        this.id = id;
        this.title = title;
        this.author = author;
        this.edition = edition;
        this.photo = photo;
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }
    public String getAuthor() { return author; }
    public void setAuthor(String author) { this.author = author; }
    public int getEdition() { return edition; }
    public void setEdition(int edition) { this.edition = edition; }
    public String getPhoto() { return photo; }
    public void setPhoto(String photo) { this.photo = photo; }
}
