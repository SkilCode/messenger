package com.abhi;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.abhi.model.Message;
import com.abhi.model.MessageDao;

@Controller				
public class MainController {
@Autowired
	MessageDao mdao;
@RequestMapping("/")
	ModelAndView home(Model m,HttpServletRequest req) {
	
	List<Message> msg = mdao.findAll();
	List<String> msgs = new ArrayList<String>(); 
	
	for(Message message : msg) {
		msgs.add( message.getMessage());
		
	}
	
	
		req.setAttribute("messages", msgs);
	return new ModelAndView("index.jsp");
}
@RequestMapping("save")
	void save(@RequestParam("message")  String msg, HttpServletResponse res) throws IOException{
		Message message = new Message();
		message.setMessage(msg);
		mdao.save(message);
		res.sendRedirect("/");
  }
@RequestMapping("delete")
	void delete(HttpServletResponse res) throws IOException {
	mdao.deleteAll();
	res.sendRedirect("/");
}

@RequestMapping("login")
	ModelAndView login(){
			ModelAndView mv = new ModelAndView("login.jsp");
				
			
			return mv;
}



}
