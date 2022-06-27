package ploy.edu.dao;

import java.lang.ProcessBuilder.Redirect.Type;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import ploy.edu.entities.User;
import ploy.edu.utils.JpaUtils;

public class UserDao extends AbstractEntityDao<User> {

	private EntityManager em;
	
	public UserDao() {
		super(User.class);
		this.em = JpaUtils.getEntityManager();
	}
	
	public List<User> findAll(){
		this.em.clear();		
		String jpql = "SELECT u FROM User u";
		TypedQuery<User> query = this.em.createQuery(jpql, User.class);
		return query.getResultList();
	}
	
	public User findByEmail(String email) {
			String jpql = "SELECT u FROM User u where u.email = :email";
			
			TypedQuery<User> query = this.em.createQuery(jpql,User.class);
			query.setParameter("email", email);
			
			return query.getSingleResult();		
	}
}
