package com.full;

import javax.jdo.PersistenceManager;

import org.springframework.beans.factory.annotation.Autowired;


public class StudentDao {
	public boolean doesStudentExist(String sid){
		PersistenceManager pm = PMF.get().getPersistenceManager();
		Student student = null;
		
		try {
			student = pm.getObjectById(Student.class, sid);
		}
		catch(Exception e){
			return false;
		}
		finally {
			pm.close();
		}
		return true;
	}
	
	public void addStudent(Student student){
		PersistenceManager pm = PMF.get().getPersistenceManager();
		try {
            pm.makePersistent(student);
        } finally {
            pm.close();
        }
	}
	
	public Student getStudent(String sid){
		PersistenceManager pm = PMF.get().getPersistenceManager();
		Student student = null;
		try {
			student = pm.getObjectById(Student.class, sid);
        } finally {
            pm.close();
        }
		return student;
	}
}
