//this account extends the SavingAccount .
//It has the instances Specific to the Saving account.
//This class defines the withdraw logic of the saving account.
//It also implements the comparable interface and overrides the compareTo() as finaaly the TreeSet() is used .

package com.cg.spring.mvc.ems.bank.account.pojo;

import com.cg.bank.framework.account.pojo.BankAccount;
import com.cg.bank.framework.account.pojo.Customer;
import com.cg.bank.framework.account.pojo.SavingsAccount;

public class MMBankSavingsAccount extends SavingsAccount implements Comparable<BankAccount> {

	public MMBankSavingsAccount(Customer accountHolder, double accountBalance, boolean salary, String accountType) {
		super(accountHolder, accountBalance, salary, accountType);
		// TODO Auto-generated constructor stub
	}

	public MMBankSavingsAccount(Customer accountHolder, double accountBalance, String accountType) {
		super(accountHolder, accountBalance, accountType);
		// TODO Auto-generated constructor stub
	}

	@Override
	public int compareTo(BankAccount BankAccount) {
		return this.getAccountNumber() - BankAccount.getAccountNumber();
	}

	public double withdraw(double amountToBeWithDrawn) {
		if (this.getAccountBalance()>= amountToBeWithDrawn) {
			this.setAccountBalance(this.getAccountBalance() - amountToBeWithDrawn);
			return amountToBeWithDrawn;
		}else {
			return -1;
		}
	}

}
