@isTest
public class TestDataFactory {

    public static void createAccount(String billingState, Integer totalAccount) {

    	RecordType rt = [SELECT Id FROM RecordType WHERE DeveloperName = 'Customer' AND SobjectType = 'Account'];

        List<Account> lstAccounts = new List<Account>();
        
        for(Integer i=0; i < totalAccount; i++) {

            lstAccounts.add(new Account(Name='TestAccount' + i,
            	BillingCountry = 'United States',
            	BillingState = billingState,
            	RecordTypeId = rt.Id));
        }

        insert lstAccounts;
    }
}