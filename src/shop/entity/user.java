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

import org.hibernate.annotations.NotFound;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "[User]")
public class user {
@Id
@Column(name="Username")
public String username;
@Column(name="Fullname")
public String fullname;
@Column(name="Password")
public String password;
@Column(name="Gender")
public Integer gender;
@Temporal(TemporalType.DATE)
@DateTimeFormat(pattern = "MM/dd/yyyy")
@Column(name="Birthday")
private Date birthday;
@Column(name="Email")
public String email;
@Column(name="phone")
public int phone;
@Column(name="Address")
public String address;
@OneToMany(fetch = FetchType.EAGER, mappedBy = "User")
Collection<order> Order;
public void setOrder(Collection<order> order) {
	Order = order;
}
public Collection<order> getOrder() {
	return Order;
}
public String getUsername() {
	return username;
}
public void setUsername(String username) {
	this.username = username;
}
public String getPassword() {
	return password;
}
public void setFullname(String fullname) {
	this.fullname = fullname;
}
public String getFullname() {
	return fullname;
}
public void setPassword(String password) {
	this.password = password;
}
public Integer getGender() {
	return gender;
}
public void setGender(Integer gender) {
	this.gender = gender;
}
public Date getBirthday() {
	return birthday;
}
public void setBirthday(Date birthday) {
	this.birthday = birthday;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public int getPhone() {
	return phone;
}
public void setPhone(int phone) {
	this.phone = phone;
}
public String getAddress() {
	return address;
}
public void setAddress(String address) {
	this.address = address;
}

public user(String username, String fullname, String password, Integer gender, Date birthday, String email, int phone,
		String address, Collection<order> order) {
	super();
	this.username = username;
	this.fullname = fullname;
	this.password = password;
	this.gender = gender;
	this.birthday = birthday;
	this.email = email;
	this.phone = phone;
	this.address = address;
	Order = order;
}
public user() {
	super();
	// TODO Auto-generated constructor stub
}

}
