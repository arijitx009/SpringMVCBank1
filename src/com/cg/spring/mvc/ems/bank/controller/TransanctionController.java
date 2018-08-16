package com.cg.spring.mvc.ems.bank.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cg.bank.framework.account.pojo.BankAccount;
import com.cg.spring.mvc.ems.bank.service.MoneyMoneyBankService;

@Controller
public class TransanctionController {

	MoneyMoneyBankService moneyBankService = new MoneyMoneyBankService();	
	
	@RequestMapping("depositForm")
	public String depositForm()
	{
		return "depositForm";
	}
	
	@RequestMapping("depositTransact")
	public String depositSuccess(@RequestParam("typedAccount") int accountNumber,@RequestParam("typedAmount") double Amount, Model model)
	{
			model.addAttribute("amountInDeposit", Amount);
			model.addAttribute("accountInDeposit", accountNumber);
			

		double check = moneyBankService.depositAmount(accountNumber, Amount);
		if (check == 0.0) {
			return "errorDeposit";
		} 
		return "depositSuccess";
	}
	
	
	@RequestMapping("withdrawForm")
	public String withdrawForm()
	{
		return "withdrawForm";
	}
	
	@RequestMapping("withdrawTransact")
	public String withdrawSuccess(@RequestParam("typedAccount") int accountNumber,@RequestParam("typedAmount") double Amount, Model model)
	{
		model.addAttribute("amountInWithdraw", Amount);
		model.addAttribute("accountInWithdraw", accountNumber);
		
		double check = moneyBankService.withdrawAmount(accountNumber, Amount);
		
		BankAccount bankAccount = moneyBankService.getAccountByAccountNumber(accountNumber);
		
		System.out.println(bankAccount.getAccountBalance());
		System.out.println("Check : " + check);
		
		if (check == -1) {
			return "errorWithdraw";
		} 
			Map<Integer, Integer> denomination = new HashMap<Integer, Integer>();
			denomination = giveDenominations(check);
			
			System.out.println("deno : "+denomination.values());
			
			System.out.println("\n");
			model.addAttribute("denomination", denomination);

			return "withdrawSuccess";
	}
	
	
	@RequestMapping("fundTransfer")
	public String fundTransfer()
	{
		return "fundTransfer";
	}
	
	@RequestMapping("fundTransferTransact")
	public String fundTransferSuccess(@RequestParam("typedFromAccount") int typedFromAccount,@RequestParam("typedToAccount") int typedToAccount,@RequestParam("typedAmount") double typedAmount, Model model)
	{
		model.addAttribute("accountInWithdrawTransfer", typedFromAccount);

		model.addAttribute("accountInDepositTransfer", typedToAccount);

		
		model.addAttribute("amountInTransfer", typedAmount);

		
		double  check = moneyBankService.performFundTransfer(typedToAccount, typedFromAccount, typedAmount);
		if (check == 0.0) {
			return "errorfundTransfer";
		}
		return "fundTransferSuccess";
	}
	
	private Map<Integer, Integer> giveDenominations(double check) {
		Map<Integer, Integer> denomination = new HashMap<Integer, Integer>();

		if (check >= 2000) {
			denomination.put(2000, (int) check / 2000);
			check %= 2000;
		}
		if (check >= 500) {
			denomination.put(500, (int) check / 500);
			check %= 500;
		}
		if (check >= 200) {
			denomination.put(200, (int) check / 200);
			check %= 200;
		}
		if (check >= 100) {
			denomination.put(100, (int) check / 100);
			check %= 100;
		}
		if (check >= 50) {
			denomination.put(50, (int) check / 50);
			check %= 50;
		}
		if (check >= 10) {
			denomination.put(10, (int) check / 10);
			check %= 10;
		}
		if (check >= 1) {
			denomination.put(1, (int) check / 1);
			check %= 1;
		}
		return denomination;
	}
	
}
