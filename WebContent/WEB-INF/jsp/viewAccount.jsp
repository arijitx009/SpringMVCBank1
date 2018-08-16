<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="alfa" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="mystyle.css">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>

	<form action="home.jsp" method="get">

		<div>
			<table cellspacing="15" align="center" border="2">
				<tr>
					<th colspan="9" height="35"><h2>Account Detail</h2></th>
				</tr>
				<tr>
					<th height="20">Account Number</th>
					<th height="20">Customer Name</th>
					<th height="20">Customer ID</th>
					<th height="20">Account Type</th>
					<th height="20">Account Balance</th>
					<th height="20">Overdraft Limit</th>
					<th height="20">Salary Account ?</th>
				</tr>
				<tr>
					<td align="center">${createdbankAccount.accountNumber}</td>
					<td align="center">${createdbankAccount.accountHolder.customerName}</td>
					<td align="center">${createdbankAccount.accountHolder.customerId}</td>
					<td align="center">${createdbankAccount.accountType}</td>
					<td align="center">${createdbankAccount.accountBalance}</td>

					<alfa:choose>
						<alfa:when
							test='${createdbankAccount.accountType.equals("currentAccount")}'>
							<td align="center">${createdbankAccount.odLimit}</td>
							<td align="center">NA</td>
						</alfa:when>
						<alfa:otherwise>
							<td align="center">NA</td>
							<td align="center">${createdbankAccount.salary}</td>
						</alfa:otherwise>
					</alfa:choose>
            		<tr>
						<th colspan="9"  height="40"><input type="submit" value="Home"></th>
					</tr>
          
			</table>
		</div>

	</form>
	<jsp:include page="footer.html"></jsp:include>


</body>
</html>