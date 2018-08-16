<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="alfa" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" type="text/css" href="mystyle.css">

<style type="text/css">
.toBeHidden {
	display: none;
}


</style>

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

<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action="updated" method="get">
		<h1 align="center">Update Account Details</h1>
		<br>

		<table align="center" cellspacing="8" border="2">
			<tr>
				<td align="center">Account Number </td>
				<td><input type="text" name="accountNumber" readonly="readonly" value="${bankAccount.accountNumber}"></td>
			</tr>
			<tr>
				<td align="center">Customer Name</td>
				<td><input type="text" name="customerName" required="required" placeholder="${bankAccount.accountHolder.customerName}"></td>
			</tr>
			<tr>
				<td align="center">Customer ID</td>
				<td><input type="text" name="customerId" readonly="readonly" value="${bankAccount.accountHolder.customerId}"></td>
			</tr>
			<tr>
				<td align="center">Email</td>
				<td><input type="emailId" name="emailId" required="required" placeholder="${bankAccount.accountHolder.emailId}"></td>
			</tr>
			<tr>
				<td align="center">Contact No</td>
				<td><input type="number" name="contact_no"  min="6000000000"  max="9999999999"  required="required" placeholder="${bankAccount.accountHolder.contactNumber}"></td>
			</tr>

			<tr>
				<td align="center">Date of Birth</td>
				<td><input type="date" name="dob" onchange="checkDate(this);"  required="required"  placeholder="${bankAccount.accountHolder.dateOfBirth}"></td>
			</tr>
			
			<tr>
				<td align="center"><input type="reset" value="Clear" onclick="resetAll();"></td>
				<td align="center"><input type="submit" value="Submit"></td>
			</tr>
		</table>
	</form>


</body>
</html>