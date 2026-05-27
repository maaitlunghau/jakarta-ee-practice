package com.fpt.bean;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

// cần khai báo để biết class này chính là entity
@Entity
@Table(name = "brands")
@NoArgsConstructor
@AllArgsConstructor
@Data

public class BrandBean {
    @Id

    // nên để private cho toàn bộ field
    // @GeneratedValue: Annotation mô tả giá trị tự động tăng

    // 1. Properties
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer brandId; // ko nên dùng int
    private String name, contact, website;

    // 2. Constructor
    // 2.1. Default Constructor

    // 2.2. Parameterized Constructor

    // 3. Getters & Setters

    public Integer getBrandId() {
        return brandId;
    }

    public void setBrandId(Integer brandId) {
        this.brandId = brandId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getWebsite() {
        return website;
    }

    public void setWebsite(String website) {
        this.website = website;
    }

    // 4. CRUD (thay vì nằm ở Dal, thì nó nằm ở đây luôn)
    // 4.1. findAll() method

    // 4.2. create() method

    // 4.3. update() method

    // 4.4. delete() method
}
