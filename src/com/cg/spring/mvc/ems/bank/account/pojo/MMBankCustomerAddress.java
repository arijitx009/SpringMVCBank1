//this class maintains the address of the customer.
//It extends the Address and just calls the parent class constructor using super keyword.
package com.cg.spring.mvc.ems.bank.account.pojo;

import com.cg.bank.framework.account.pojo.Address;

public class MMBankCustomerAddress extends Address {

	public MMBankCustomerAddress(String houseNo, String street, String city, String state, int pinCode) {
		super(houseNo, street, city, state, pinCode);
	}

}
