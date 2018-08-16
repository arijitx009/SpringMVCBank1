package com.cg.spring.mvc.ems.bank.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cg.spring.mvc.ems.bank.factory.MMBankFactory;
import com.cg.spring.mvc.ems.bank.service.MoneyMoneyBankService;

@Controller
public class BankAccountController {

	private Map<String, Object> account = new HashMap<String, Object>();
	MMBankFactory mmBankFactory = new MMBankFactory();
	MoneyMoneyBankService moneyBankService = new MoneyMoneyBankService();

	@RequestMapping("addNewAccount")
	public String addNewAccount() {
		return "addNewAccount";
	}

	@RequestMapping("createAccount")
	public String createAccount(@RequestParam("customerName") String customerName,
			@RequestParam("gender") String gender, @RequestParam("dob") String dob, @RequestParam("email") String email,
			@RequestParam("contact_no") String contact_no, @RequestParam("houseNo") String houseNo,
			@RequestParam("street") String street, @RequestParam("city") String city,
			@RequestParam("state") String state, @RequestParam("pincode") String pincode,
			@RequestParam("nationality") String nationality, @RequestParam("accountType") String accountType,
			@RequestParam("salaried") String salaried, @RequestParam("savSbalance") String savSbalance,
			@RequestParam("savNbalance") String savNbalance, @RequestParam("overDraft") String overDraft,
			@RequestParam("curbalance") String curbalance, Model model) {
		account.put("accountHolderName", customerName);
		account.put("gender", gender);

		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDate date = LocalDate.parse(dob, formatter);
		account.put("dateOfBirth", date);

		account.put("contactNumber", contact_no);
		account.put("houseNo", houseNo);
		account.put("street", street);
		account.put("city", city);
		account.put("state", state);
		account.put("pincode", pincode);
		account.put("email", email);
		account.put("nationality", nationality);

		account.put("accountType", accountType);
		System.out.println("&************************&");

		if (accountType.equals("savingAccount")) {
			if (salaried.equals("salaried")) {
				account.put("salaried", true);
				account.put("accountBalance", savSbalance);
			} else {
				account.put("salaried", false);
				account.put("accountBalance", savNbalance);
			}
			System.out.println();
			System.out.println("Map : " + account);
			System.out.println();

			model.addAttribute("createdbankAccount",
					moneyBankService.addBankAccount(mmBankFactory.createNewSavingsAccount(account)));

		} else {
			account.put("odLimit", overDraft);

			account.put("accountBalance", curbalance);

			model.addAttribute("createdbankAccount",
					moneyBankService.addBankAccount(mmBankFactory.createNewCurrentAccount(account)));
		}
		return "addNewSuccess";
	}

	@RequestMapping("updateForm")
	public String updateForm(@RequestParam("accountNumber")int accountNumber,Model model)
	{
		model.addAttribute("bankAccount",moneyBankService.getAccountByAccountNumber(accountNumber));
		return "updateForm";
	}
	
	@RequestMapping("updated")
	public String updated(@RequestParam("customerName") String customerName,@RequestParam("emailId") String emailId,@RequestParam("contact_no") String contact_no,@RequestParam("dob") String dob,@RequestParam("accountNumber") String accountNumber,Model model)
	{
	   Map<String, Object> upMap = new HashMap<String, Object>();
	   
	   upMap.put("customerName",customerName);
	   upMap.put("emailId",emailId);
	   upMap.put("contact_no",contact_no);
	   
	  
	   DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	   LocalDate date = LocalDate.parse(dob, formatter);
	   
	   upMap.put("dob",date);
	   upMap.put("accountNumber",accountNumber);
	   
	   System.out.println(upMap);
	   
	   moneyBankService.updateAccount(upMap); 
	   
	   model.addAttribute("BankAccounts", moneyBankService.getBankAccounts());
	   
	   return "viewAllCustomers";

}

}