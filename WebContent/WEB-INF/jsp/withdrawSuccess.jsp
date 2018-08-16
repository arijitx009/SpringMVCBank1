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
					<th colspan="7" height="35"><h2>Successfully Withdrawn
							${amountInWithdraw} from Account Number
							${accountInWithdraw}</h2></th>
				</tr>

				<tr>
					<th colspan="7" height="40"><h3>Denominations</h3></th>
				</tr>

				<alfa:forEach var="notes"
					items="${denomination.keySet()}">
					<tr align="center">
						<td>${notes}: ${denomination.get(notes)}</td>
					</tr>
				</alfa:forEach>

				<tr>
					<th colspan="7" height="40"><input type="submit" value="Home"></th>
				</tr>
			</table>
		</div>

	</form>
	<jsp:include page="footer.html"></jsp:include>


</body>
</html>