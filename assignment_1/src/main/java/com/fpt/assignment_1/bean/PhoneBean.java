package com.fpt.assignment_1.bean;

import com.fpt.assignment_1.dal.PhoneDal;
import jakarta.persistence.*;
import java.math.BigDecimal;

@Entity
@Table(name = "Phone")
public class PhoneBean {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "PhoneID")
    private Integer phoneId;

    @Column(name = "Name", length = 100)
    private String name;

    @Column(name = "Price", precision = 15, scale = 2)
    private BigDecimal price;

    @Column(name = "Image", length = 255)
    private String image;

    // Constructors (Manual implementation to fix compilation error)
    public PhoneBean() {
    }

    public PhoneBean(Integer phoneId, String name, BigDecimal price, String image) {
        this.phoneId = phoneId;
        this.name = name;
        this.price = price;
        this.image = image;
    }

    // Getters and Setters
    public Integer getPhoneId() { return phoneId; }
    public void setPhoneId(Integer phoneId) { this.phoneId = phoneId; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public BigDecimal getPrice() { return price; }
    public void setPrice(BigDecimal price) { this.price = price; }

    public String getImage() { return image; }
    public void setImage(String image) { this.image = image; }

    // Logic Create Phone using JPA API
    public boolean createPhone(PhoneBean phone) {
        EntityManager em = PhoneDal.getEM();
        try {
            em.getTransaction().begin();
            em.persist(phone);
            em.getTransaction().commit();
            return true;
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            e.printStackTrace();
            return false;
        } finally {
            em.close();
        }
    }
}
