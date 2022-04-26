package anshop.controller;
///okieee
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import shop.entity.advertise;
import shop.entity.menu;
import shop.entity.product;
import shop.entity.productDetail;

@Transactional
@Controller
@RequestMapping("detail")
public class DeltailController {
	@Autowired
	SessionFactory factory;
	@ModelAttribute("menu")
	public List<menu> Nav(ModelMap model) {
		Session session = factory.getCurrentSession();
		String hql="FROM menu";
		Query query=session.createQuery(hql);
		List<menu> list = query.list();
		return list;
	}
	@Autowired
	MainController cc;
	@ModelAttribute("menu")
	public void user(ModelMap model) {
		model.addAttribute("username",cc.username);
	}
	@RequestMapping("/{id}")
	public String typePro(ModelMap model, HttpServletRequest  request, @PathVariable("id") String id){
		try {
			Session session = factory.getCurrentSession();
			String hql1 = "FROM product p WHERE p.id LIKE :id";
			String hql2 = "FROM productDetail p WHERE p.Product.id LIKE :id";
			Query query1 = session.createQuery(hql1);
			Query query2 = session.createQuery(hql2);
			query1.setParameter("id",id);
			query2.setParameter("id",id);
			List<product> list1 = query1.list();
			List<productDetail> list2 = query2.list();
			List<product> newList1 = new ArrayList<>();
			List<productDetail> newList2= new ArrayList<>();
			System.out.print(list1.toString());
			System.out.print(list2.toString());
			for (int i = 0; i < list1.size(); i++) {
				newList1.add(list1.get(i));
			}
			for (int i = 0; i < list2.size(); i++) {
				newList2.add(list2.get(i));
			}
			model.addAttribute("item", newList1);
			model.addAttribute("itemsize", newList2);
			model.addAttribute("cart",MainController.cartlist);
			model.addAttribute("dem",MainController.dem);
			model.addAttribute("user", MainController.userlogin);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "detail";
	}
	
}
