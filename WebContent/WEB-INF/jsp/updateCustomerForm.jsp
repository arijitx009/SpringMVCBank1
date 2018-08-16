<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="alfa" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<script type="text/javascript">

function checkDate(obj){
	 var ageDif = Date.now()-(new Date(obj.value)).getTime();
	 var ageDate = new Date(ageDif);
	 if(Math.abs(ageDate.getUTCFullYear()-1970) < 18 )
		 {
		   alert("Minimum age Should be 18 .");
		   obj.value = 0;
		 }
		
	 }


</script>




<link rel="stylesheet" type="text/css" href="mystyle.css">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action="update.app" method="get">
		<h1 align="center">Update Customer Details</h1>
		<br>

		<table align="center" cellspacing="8">
			
			<tr>
				<td>Customer ID</td>
				<td><input type="text" name="custID" readonly="readonly" value="${sessionScope.CustID}"></td>
			</tr>

			<tr>
				<td>First Name</td>
				<td><input type="text" name="fname"></td>
			</tr>

			<tr>
				<td>Last Name</td>
				<td><input type="text" name="lname"></td>
			</tr>

			<tr>
				<td>Account Number</td>
				<td><input type="number" name="accountNumber" readonly="readonly"></td>
			</tr>	
			
			<tr>
				<td>Email</td>
				<td><input type="email" name="email"></td>
			</tr>

			<tr>
				<td>Date of Birth</td>
				<td><input type="date" name="dob" onchange="checkDate(this);"></td>
			</tr>
			<tr>
				<td>Contact No</td>
				<td><input type="number" name="contact_no"  min="6000000000"  max="9999999999"></td>
			</tr>
			<tr>
			   <td align="center" colspan="2"><a
								href="removenew.app?bookId=${booksInCart.bookObject.bookId}"> Update </a></td>
			</tr>
		</table>
	</form>


</body>
</html>