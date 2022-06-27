package ploy.edu.dao;

import javax.persistence.EntityManager;

import ploy.edu.utils.JpaUtils;

public abstract class AbstractEntityDao<T> {
	
    private EntityManager em;
    private Class<T> enClass;
    
	public AbstractEntityDao(Class<T> enClass) {
		this.enClass = enClass;
		this.em = JpaUtils.getEntityManager();
	}
	
	public T create(T entity) {
		try {
			this.em.getTransaction().begin();
			this.em.persist(entity);
			this.em.getTransaction().commit();
			return entity;
		} catch (Exception e) {
			this.em.getTransaction().rollback();
			e.printStackTrace();
			throw e;
		}
	}
	
	public T update(T entity) {
		try {
			this.em.getTransaction().begin();
			this.em.merge(entity);
			this.em.getTransaction().commit();
			return entity;
		} catch (Exception e) {
			this.em.getTransaction().rollback();
			e.printStackTrace();
			throw e;
		}
	}
	
	public T delete(T entity) {
		try {
			this.em.getTransaction().begin();
			this.em.remove(entity);
			this.em.getTransaction().commit();
			return entity;
		} catch (Exception e) {
			this.em.getTransaction().rollback();
			e.printStackTrace();
			throw e;
		}
	}
	
	public T findById(Object id) {
		T entity = this.em.find(enClass, id);
		return entity;
	}
	
	
	
}
