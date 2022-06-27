package ploy.edu.utils;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class JpaUtils {
	
	public static EntityManagerFactory getFactory() {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory("Assiment");
		return factory;
	}
	
	public static EntityManager getEntityManager() {
		EntityManager em = JpaUtils.getFactory().createEntityManager();
		return em;
	}

}
