package custom.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.Gson;

import custom.Model.CustomDto;
import custom.Service.CustomService;

@Controller
public class CustomController {

	
	@Autowired
	CustomService service;
	
/*	@RequestMapping(value="/customer/FAQ.do")
	public String service() throws Exception{
		return "customer/FAQ";
	}*/
	
	@RequestMapping(value="/customer/FAQ.do", method=RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public void customList(HttpServletResponse response) throws Exception{
		List<CustomDto> list = service.selectCustom();
		Gson json = new Gson();
		System.out.println(json.toJson(list));
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(json.toJson(list));
	}
}
