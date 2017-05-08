package com.full;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AddController {
    private StudentDao dao;
    
    
    public AddController(){
    }
    
    @Autowired
	public void setDao(StudentDao dao) {
		this.dao = dao;
	}

	@RequestMapping("/addstudent")
	public String addStudent(){
		return "addStudentdetails";
	}
    
    @RequestMapping(value="/addsuccess", consumes="application/json", method=RequestMethod.POST)
	public @ResponseBody boolean addStudentToDB(@RequestBody Student student){
		String sid = student.getId();
    	if(dao.doesStudentExist(sid)){
			return false;
		}
    	else{
    		dao.addStudent(student);
    		return true;
    	}
	}
    
}
