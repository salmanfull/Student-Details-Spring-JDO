package com.full;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class SearchController {
	 private StudentDao dao;
	     
	    public SearchController(){
	    }
	    
	    @Autowired
		public void setDao(StudentDao dao) {
			this.dao = dao;
		}
	    
	    @RequestMapping("/fetchstudent")
		public String getStudent(){
			return "fetchPage";
		}
	    
	    @RequestMapping(value = "/search", method = RequestMethod.POST)
	    public @ResponseBody Student search(@RequestParam("sid") String sid, HttpServletResponse resp) throws IOException{
	    	if(!dao.doesStudentExist(sid)){
	    		resp.getWriter().print("null");
	    		return null;
	    	}
	    	return dao.getStudent(sid);
	    }
}
