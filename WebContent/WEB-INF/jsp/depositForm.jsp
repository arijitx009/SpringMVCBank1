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

		<form action="depositTransact" method="get">

			<div>
				<table cellspacing="15" align="center" border="2">
					<tr>
						<th colspan="6" height="35"><h2>Deposit</h2></th>
					</tr>
					<tr>
						<th height="20">Account Number : </th>
						<th colspan="5" > <input type="number" name="typedAccount"  placeholder="Enter Account Number" required="required"></th>
					</tr>
					<tr>
						<th height="20">Amount : </th>
						<th colspan="5" > <input type="number" name="typedAmount"  placeholder="Enter Amount" required="required" min="1"></th>
					</tr>
 					<tr>
						<th colspan="6"  height="40"><input type="submit" value="Deposit"></th>
					</tr>
				</table>
			</div>

		</form>
	<jsp:include page="footer.html"></jsp:include>


</body>
</html>