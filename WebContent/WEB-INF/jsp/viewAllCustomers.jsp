<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="alfa" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" type="text/css" href="mystyle.css">

<meta charset="ISO-8859-1">
<title>View All Customers</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

		<form action="home" method="get">

			<div>
				<table cellspacing="15" align="center" border="2">
					<tr>
						<th colspan="9" height="35"><h2>All Account Details</h2></th>
					</tr>
					<tr>
						<th height="20">Account Number</th>
						<th height="20">Customer Name</th>
						<th height="20">Customer ID</th>
						<th height="20">Account Type</th>
						<th height="20">Account Balance</th>
						<th height="20">Email ID</th>
						<th height="20">Phone No</th>
						<th height="20">Date Of Birth</th>
					</tr>

					<alfa:forEach var="BankAccounts" items="${BankAccounts}">
						<tr>
							<td align="center">${BankAccounts.accountNumber}</td>
							<td align="center">${BankAccounts.accountHolder.customerName}</td>
							<td align="center">${BankAccounts.accountHolder.customerId}</td>
							<td align="center">${BankAccounts.accountType}</td>
							<td align="center">${BankAccounts.accountBalance}</td>
							<td align="center">${BankAccounts.accountHolder.emailId}</td>
							<td align="center">${BankAccounts.accountHolder.contactNumber}</td>
							<td align="center">${BankAccounts.accountHolder.dateOfBirth}</td>
							<td align="center" colspan="2"><a
								href="updateForm?accountNumber=${BankAccounts.accountNumber}"> Update </a></td>
						</tr>
					</alfa:forEach>
					
					<tr>
						<th colspan="9"  height="40"><input type="submit" value="Home"></th>
					</tr>
				</table>
			</div>

		</form>
	<jsp:include page="footer.html"></jsp:include>

</body>
</html>