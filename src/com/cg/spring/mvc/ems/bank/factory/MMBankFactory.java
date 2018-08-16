//This class implements the class BankFactory.
//It overrides the the methods createNewCurrentAccount() and createNewSavingsAccount() of class BankFactory.

package com.cg.spring.mvc.ems.bank.factory;

import java.time.LocalDate;
import java.util.Map;

import com.cg.bank.framework.account.pojo.CurrentAccount;
import com.cg.bank.framework.account.pojo.SavingsAccount;
import com.cg.bank.framework.factory.BankFactory;
import com.cg.spring.mvc.ems.bank.account.pojo.MMBankCurrentAccount;
import com.cg.spring.mvc.ems.bank.account.pojo.MMBankCustomer;
import com.cg.spring.mvc.ems.bank.account.pojo.MMBankCustomerAddress;
import com.cg.spring.mvc.ems.bank.account.pojo.MMBankSavingsAccount;

public class MMBankFactory extends BankFactory {
	
	MMBankCurrentAccount mmBankCurrentAccount;
	MMBankSavingsAccount mmBankSavingAccount;
	MMBankCustomer mmBankCustomer;
	MMBankCustomerAddress mmBankCustomerAddress;

	@Override
	public CurrentAccount createNewCurrentAccount(Map<String, Object> map) {
		mmBankCustomerAddress = new MMBankCustomerAddress(map.get("houseNo").toString(), map.get("street").toString(),
				map.get("city").toString(), map.get("state").toString(), Integer.parseInt(map.get("pincode").toString()));
		
		mmBankCustomer = new MMBankCustomer(map.get("accountHolderName").toString(),Long.parseLong((map.get("contactNumber").toString())),
				map.get("email").toString(), (LocalDate) map.get("dateOfBirth"), mmBankCustomerAddress, map.get("nationality").toString(),
				map.get("gender").toString());
		 
		 mmBankCurrentAccount = new MMBankCurrentAccount(mmBankCustomer, Double.parseDouble((map.get("accountBalance").toString())),
				 Double.parseDouble((map.get("odLimit").toString())), map.get("accountType").toString());
		 
		 System.out.println(mmBankCustomerAddress);
		 System.out.println(mmBankCustomer);
		return mmBankCurrentAccount;
	}

	@Override
	public SavingsAccount createNewSavingsAccount(Map<String, Object> map) {
		
			    mmBankCustomerAddress = new MMBankCustomerAddress(map.get("houseNo").toString(),
					map.get("street").toString(), map.get("city").toString(), map.get("state").toString(),
					Integer.parseInt(map.get("pincode").toString()));
				 
				mmBankCustomer = new MMBankCustomer(map.get("accountHolderName").toString(),
					Long.parseLong((map.get("contactNumber").toString())), map.get("email").toString(), (LocalDate) map.get("dateOfBirth"), mmBankCustomerAddress,
					map.get("nationality").toString(), map.get("gender").toString());
			
			    mmBankSavingAccount = new MMBankSavingsAccount(mmBankCustomer, Double.parseDouble((map.get("accountBalance").toString())),
					(boolean) map.get("salaried"), map.get("accountType").toString());
			    
			    System.out.println(mmBankCustomerAddress);
				System.out.println(mmBankCustomer);
			    System.out.println(mmBankSavingAccount); 
			return mmBankSavingAccount;
	}

}
