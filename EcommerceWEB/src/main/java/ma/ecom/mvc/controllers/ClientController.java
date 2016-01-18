package ma.ecom.mvc.controllers;

import java.util.Properties;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ma.ecommerce.entities.Client;
import ma.ecommerce.service.IService;



@Controller
@RequestMapping("/client")
public class ClientController {

	   @RequestMapping(value = "/add", method = RequestMethod.GET)
	    public String addProject(Model model) {
	     
		   model.addAttribute("clientAdd", new Client());
	        return "client_add";
	    }
	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String addClient(@ModelAttribute Client client) {
		IService clientService;

	//	Client cl = new Client("login1","nom","prenom","telephone","ville");
		System.out.println(client);
		
		try {
			Properties p = new Properties();
			p.put(Context.URL_PKG_PREFIXES, "org.jboss.ejb.client.naming");
			p.put("jboss.naming.client.ejb.context",true);
			Context context = new InitialContext(p);

			String appName = "";
			String moduleName = "EcommerceEJB";
			String beanName = "EC";
			//String interfaceFullName = IService.class.getName();
			String interfaceFullName = "ma.ecommerce.service.IService";

			String jndi = "ejb:" + appName + "/" + moduleName + "/" + beanName + "!" + interfaceFullName;
			clientService = (IService) context.lookup(jndi);
			clientService.createClient(client);
			System.out.println("Intercept Exception !");
		} catch (NamingException e) {

			e.printStackTrace();
		}

		return "redirect:/client/add";
	}
}
