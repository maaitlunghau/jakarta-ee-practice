package com.fpt.dal;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class BrandDal {
    public static EntityManager getEM() {
        EntityManagerFactory emf;
        emf = Persistence.createEntityManagerFactory("BrandPU");

        return emf.createEntityManager();
    }
}
