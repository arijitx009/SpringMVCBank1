<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="alfa" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<!-- <link rel="stylesheet" type="text/css" href="mystyle.css"> -->

<style type="text/css">
.toBeHidden {
	display: none;
}


</style>

<script type="text/javascript">

  function checkAccountType(accountTypeShow) {
	if(accountTypeShow.value =="savingAccount"){
		document.getElementById("salaried").style.display="block";
		document.getElementById("overDraft").style.display="none";
		document.getElementById("curBalance").style.display="none";
		document.getElementById("savNotSalBalance").style.display="none";
		document.getElementById("savSalBalance").style.display="none";

	}
		else if(accountTypeShow.value =="currentAccount"){
			document.getElementById("overDraft").style.display="block";
			document.getElementById("curBalance").style.display="block";
			document.getElementById("salaried").style.display="none";
			document.getElementById("savNotSalBalance").style.display="none";
			document.getElementById("savSalBalance").style.display="none";
		}		
}
  function checkSalariedType(SalaryTypeShow) {
		if(SalaryTypeShow.value =="salaried"){
			document.getElementById("savSalBalance").style.display="block";
			document.getElementById("savNotSalBalance").style.display="none";

		}
  			else if(SalaryTypeShow.value =="notSalaried"){
				document.getElementById("savNotSalBalance").style.display="block";
				document.getElementById("savSalBalance").style.display="none";
			}		
	}
   
  
  function resetAll()
  {
	    document.getElementById("salaried").style.display="none";
		document.getElementById("overDraft").style.display="none";
		document.getElementById("curBalance").style.display="none";
		document.getElementById("savNotSalBalance").style.display="none";
		document.getElementById("savSalBalance").style.display="none";
	  
  }
  
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
	<form action="createAccount" method="get">
		<h1 align="center">Add Account Details</h1>
		<br>

		<table align="center" cellspacing="8" border="2">
			<tr>
				<td align="center">Customer Name</td>
				<td><input type="text" name="customerName" required="required"></td>
			</tr>

			<tr>
				<td align="center">Gender</td>
				<td><input type="radio" name="gender" value="male"
					checked="checked">Male <input type="radio" name="gender"
					value="female" checked="checked">Female <input type="radio"
					name="gender" value="others" checked="checked">Others</td>
			</tr>
			<tr>
				<td align="center">Date of Birth</td>
				<td><input type="date" name="dob" onchange="checkDate(this);"  required="required"></td>
			</tr>
			<tr>
				<td align="center">Email</td>
				<td><input type="email" name="email" placeholder="Email"  required="required"></td>
			</tr>
			<tr>
				<td align="center">Contact No</td>
				<td><input type="number" name="contact_no"  min="6000000000"  max="9999999999"  required="required"></td>
			</tr>

			<tr>
				<td align="center" height="30">Address</td>
				<td ><input type="text" name="houseNo" placeholder="House Number" required="required"></td>
				<td align="center"><input type="text" name="street" placeholder="street"  required="required"></td>
				<td align="center"><input type="text" name="city" placeholder="city" required="required"></td>
				<td align="center"><input type="text" name="state" placeholder="state" required="required"></td>
				<td align="center"><input type="number" name="pincode" placeholder="pincode" required="required"></td>
			</tr>

			<tr>
				<td align="center">Nationality</td>
				<td><input type="text" name="nationality" placeholder="Nationality" required="required"></td>
			</tr>

			<tr>
				<td align="center">Account Type</td>
				<td><select name="accountType" onchange="checkAccountType(this);" required="required">
						<option id="" value="">Select Account Type</option>
						<option id="savingAccount" value="savingAccount">Saving Account</option>
						<option id="currentAccount" value="currentAccount">Current Account</option>
				</select></td>
			</tr>

			<tr id="salaried" class="toBeHidden">
				<td align="center">isSalaried</td>
				<td><input type="radio" name="salaried" value="salaried"   checked="checked" onchange="checkSalariedType(this);">Salaried 
					<input type="radio" name="salaried" value="notSalaried" checked="checked" onchange="checkSalariedType(this);">Notsalaried
				</td>
			</tr>
			
			<tr id="savSalBalance" class="toBeHidden">
				<td align="center">savSEnter Balance</td>
				<td><input type="number" name="savSbalance" min="0"></td>
			</tr>

			<tr id="savNotSalBalance" class="toBeHidden">
				<td align="center">savNEnter Balance</td>
				<td><input type="number" name="savNbalance" min="5000"></td>
			<tr id="overDraft" class="toBeHidden">
				<td align="center">Over Draft Limit</td>
				<td><input type="number" name="overDraft"></td>
			</tr>

			<tr id="curBalance" class="toBeHidden">
				<td align="center">curEnter Balance</td>
				<td><input type="number" name="curbalance" min="10000"></td>
			</tr>

			<tr>
				<td align="center"><input type="reset" value="Clear" onclick="resetAll();"></td>
				<td align="center"><input type="submit" value="Submit"></td>
			</tr>
		</table>
	</form>


</body>
</html>