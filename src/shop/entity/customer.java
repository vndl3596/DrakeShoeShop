package shop.entity;

import java.util.Collection;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="Customer")
public class customer {
 @Id
 @GeneratedValue
 @Column(name="Id")
 private Integer id;
 @Column(name ="Name")
 private String name;
 @Column(name="Phone")
 private Integer phone;
 @Column(name="Email")
 private String email;
 @Column(name="Address")
 private String address;
 @Column(name="Code")
 private String code;
 @OneToMany(fetch = FetchType.EAGER, mappedBy = "Customer")
 Collection<order> Orders;
 public String getCode() {
	return code;
}
 public void setCode(String code) {
	this.code = code;
}
public Integer getId() {
	return id;
}
public void setId(Integer id) {
	this.id = id;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public Integer getPhone() {
	return phone;
}
public void setPhone(Integer phone) {
	this.phone = phone;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getAddress() {
	return address;
}
public void setAddress(String address) {
	this.address = address;
}
public Collection<order> getOrders() {
	return Orders;
}
public void setOrders(Collection<order> orders) {
	Orders = orders;
}

public customer(Integer id, String name, Integer phone, String email, String address, String code,
		Collection<order> orders) {
	super();
	this.id = id;
	this.name = name;
	this.phone = phone;
	this.email = email;
	this.address = address;
	this.code = code;
	Orders = orders;
}
public customer() {
	super();
	// TODO Auto-generated constructor stub
}
	
}
