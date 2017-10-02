package com.teo.springdemo.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.teo.springdemo.entity.Customer;

@Repository
public class CustomerDAOImlp implements CustomerDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<Customer> getCustomers() {
		Session session=sessionFactory.getCurrentSession();
		
		Query<Customer> query = session.createQuery("from Customer order by lastName",
													Customer.class);
		
		List<Customer> customers=query.getResultList();
		
		return customers;
	}

	@Override
	public void saveCustomer(Customer theCustomer) {
		Session session= sessionFactory.getCurrentSession();
		
		session.saveOrUpdate(theCustomer);
		
	}

	@Override
	public Customer getCustomer(int theId) {
		Session session=sessionFactory.getCurrentSession();
		
		Customer customer= session.get(Customer.class, theId);
		return customer;
	}

	@Override
	public void deleteCustomer(int theId) {
		
		Session session= sessionFactory.getCurrentSession();
		
		Query theQuery= session.createQuery("delete from Customer where id=:theCustomerId");
		theQuery.setParameter("theCustomerId", theId);
		
		theQuery.executeUpdate();
		
	}

}
