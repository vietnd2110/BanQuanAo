package ploy.edu.entities;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.*;


@Entity
@Table(name="orders")
@NamedQuery(name="Order.findAll", query="SELECT o FROM Order o")
public class Order implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@ManyToOne
	@JoinColumn(name = "user_id")
	private User userOder;
	
	@Temporal(TemporalType.DATE)
	private Date date;

	@Column(name="status")
	private int status;
	
//	@Column(name = "total")
//	private double total;
	
	@OneToMany(mappedBy = "order")
	private List<OrderDetail> orderDetails;

	public Order() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public int getStatus() {
		return this.status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public User getUserOder() {
		return userOder;
	}

	public void setUserOder(User userOder) {
		this.userOder = userOder;
	}

	public List<OrderDetail> getOrderDetails() {
		return orderDetails;
	}

	public void setOrderDetails(List<OrderDetail> orderDetails) {
		this.orderDetails = orderDetails;
	}

//	public double getTotal() {
//		return total;
//	}
//
//	public void setTotal(double total) {
//		this.total = total;
//	}
	
	

	

}