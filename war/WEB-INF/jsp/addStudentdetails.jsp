<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<script src="${pageContext.request.contextPath}/resources/jquery-3.2.1.min.js"></script>
<script>
	  function addStudent(){
		  var formData = $("#myForm").serialize();
		  var data = formData.split("&");
		    var obj={};
		    for(var key in data)
		    {
		        obj[data[key].split("=")[0]] = data[key].split("=")[1];
		    }
		    var student = JSON.stringify(obj);
		  $.ajax({
			  type: "POST",
			  url: "addsuccess",
			  data: student,
			  success: function(status){
				  if(status){
					  $("#status").html("<h4>Student details added successfully</h4>");
					  $("#status").css("color","green");
				  }
				  else
					  {
					  $("#status").html("<h4>Student with the same id already exists</h4>");
					  $("#status").css("color","red");
					  }
				  
			  },
			  dataType: "json",
			  headers: { 
				  'Accept': 'application/json',
				  'Content-Type': 'application/json' 
			  }
			});
		  return false;
		     }  

</script>
</head>
<body>
	<h1>Add Student Details</h1>
	
	<form action="success" id="myForm" method="post" onsubmit="return addStudent()">
			Name : <input type="text" name="name" required><br>
			Student ID : <input type="number" name="id" required><br>
			Age : <input type="number" name="age" required><br>
			Dept : <input type="radio" name="dept" value="cse" checked>CSE
					<input type="radio" name="dept" value="ece" > ECE
  					<input type="radio" name="dept" value="mech"> MECH<br>
  					<input type=submit value="submit">
  			
	</form>
	<br>
	<span id="status"></span><br><br>
	<a href="fetchstudent">fetch Student details</a>
	
</body>
</html>