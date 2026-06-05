package com.fpt.assignment_1.dal;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class PhoneDal {
    private static final EntityManagerFactory emf = Persistence.createEntityManagerFactory("assignment_1_PU");

    public static EntityManager getEM() {
        return emf.createEntityManager();
    }
}
