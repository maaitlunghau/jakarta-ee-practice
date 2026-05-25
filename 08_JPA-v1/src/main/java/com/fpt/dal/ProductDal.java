package com.fpt.dal;

import com.fpt.entity.Product;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.Query;

import java.util.List;

public class ProductDal {
    // 1. Entity Manager
    EntityManagerFactory emf = Persistence.createEntityManagerFactory("ProductPU");
    EntityManager em = emf.createEntityManager();

    // 2. CRUD
    // 2.1. findAll() method
    public List<Product> findAll() {
        Query query = em.createQuery("SELECT p FROM Product p");
        return query.getResultList();
    }

    // 2.2. create() method
    public void create(Product pro) {
        try {
            // start transaction
            em.getTransaction().begin();

            // handling
            em.persist(pro); // (*)

            // end transaction
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
        }
    }

    // 2.3. update() method
    public void update(Product pro) {
        try {
            // start transaction
            em.getTransaction().begin();

            // handling
            em.persist(em.merge(pro)); // difference compared to CREATE (*)

            // end transaction
            em.getTransaction().commit();

        } catch (Exception e) {
            em.getTransaction().rollback();
        }
    }

    // 2.4. delete() method
    public void delete(String code) {
        try {
            // start transaction
            em.getTransaction().begin();

            // handling
            em.remove(em.find(Product.class, code));

            // end transaction
            em.getTransaction().commit();

        } catch (Exception e) {
            em.getTransaction().rollback();
        }
    }

    // 3. Utilities
    // 3.1. findById() method
    public Product findByCode(String code) {
        return em.find(Product.class, code);
    }

    // 3.2. findByName() method
    public Product findByName(String name) {
        return em.find(Product.class, name);
    }
}
