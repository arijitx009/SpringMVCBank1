package com.cg.spring.mvc.ems.bank.service;

import java.util.Collection;
import java.util.Map;

import com.cg.bank.framework.account.pojo.BankAccount;
import com.cg.bank.framework.account.pojo.Customer;
import com.cg.spring.mvc.ems.bank.account.dao.MoneyMoneyBankCollection;

public class MoneyMoneyBankService {

	MoneyMoneyBankCollection bankCollection = new MoneyMoneyBankCollection();
	
	public BankAccount addBankAccount(BankAccount bankAccount) {
		System.out.println("bankAccount return : "+		bankCollection.addBankAccount(bankAccount));
		return bankAccount;
	}
	
	public void removeBankAccountByAccountNumber(int accountNumberToBeRemoved) {
		bankCollection.removeBankAccountByAccountNumber(accountNumberToBeRemoved);
	}
	
	public BankAccount getAccountByAccountNumber(int accountToBeSearched) {
	  
	  return bankCollection.getAccountByAccountNumber(accountToBeSearched);
	}
	
	public Collection<Customer> getCustomers() {
		return bankCollection.getCustomers();
	}
	
	public Collection<BankAccount> getBankAccounts() {
		return bankCollection.getBankAccounts();
	}
	
	
	public Double withdrawAmount(int accountToDeductedFrom, double amount) {
	 return	bankCollection.withdrawAmount(accountToDeductedFrom, amount);
	
	}
	
	public Double depositAmount(int accountToBeDepositedIn, double amount) {
		return bankCollection.depositAmount(accountToBeDepositedIn, amount);
		
	}

   public Double performFundTransfer(int receipientAccountNumber, int donerAccountNumber, double amountToBeTransffered) {
		
		return bankCollection.performFundTransfer(receipientAccountNumber, donerAccountNumber, amountToBeTransffered);
	}
   
   
   public void updateAccount(Map<String, Object> upMapint ) {
    bankCollection.updateAccount(upMapint);
   }
}