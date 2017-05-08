<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/resources/jquery-3.2.1.min.js"></script>
<script>
  function search(){
	  var sid = document.getElementById("sid").value;
	  $.ajax({
		  type: "POST",
		  url: "search?sid="+sid,
		  success: function(student){
			  if(student===null){
				  $("#result").html("<h4>No student exist with this id</h4>");
				  $("#result").css("color","red");
			  }
			  else
				  {
				  $("#result").css("color","black");
				  $("#result").html("");
				  $("#result").append("ID: " + student.id + "<br>");
				  $("#result").append(" Name: " + student.name + "<br>");
				  $("#result").append(" Age: " + student.age + "<br>");
				  $("#result").append("Dept.: " + student.dept + "<br>");
				  }
			  
		  },
		  dataType: "json"
	  });
	  return false;
  }
</script>
</head>
<body>
<h1>Fetch Student Details</h1>
<form action="studentdetails" method="post" onsubmit="return search()">
			SID : <input type="number" name="sid" id="sid" required><br><br>
			
  					<input type=submit value="submit">
  			
</form>
<br>
<span id="result"></span>
</body>
</html>