@isTest
private class Test_RelatedCustomerController {
	
	@testSetup static void methodName() {

		TestDataFactory.createAccount('Alabama',3);
	}

	@isTest static void test_fetchingAccountWithSameState() {
		
		Account objAccount = [SELECT Id FROM Account WHERE BillingState = 'Alabama' limit 1];
		List<Account> lstRelatedAccounts = RelatedCustomerController.fetchRelatedCustomers(objAccount.Id);
		system.assertEquals(lstRelatedAccounts.size(),2);
	}	
}