package com.cg.spring.mvc.ems.bank.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cg.spring.mvc.ems.bank.service.MoneyMoneyBankService;

@Controller
public class DisplayController {

	MoneyMoneyBankService moneyBankService = new MoneyMoneyBankService();
	
	@RequestMapping("viewAccount")
	public String viewAccount(@RequestParam("typedAccount") int accountNumberToBeSearched , Model model)
	{
		System.out.println("*********************1");

	   model.addAttribute("createdbankAccount", moneyBankService.getAccountByAccountNumber(accountNumberToBeSearched));
		
		return "viewAccount";
	}



	@RequestMapping("searchAccount")
	public String searchAccount()
	{
		return "searchAccount";
	}
	
@RequestMapping("viewAllCustomers")
public String viewAllCustomers(Model model)
{
	model.addAttribute("BankAccounts", moneyBankService.getBankAccounts());
	return "viewAllCustomers";
}

}

