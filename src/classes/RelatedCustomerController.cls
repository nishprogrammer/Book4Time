public with sharing class RelatedCustomerController {

	@AuraEnabled
    public static List<Account> fetchRelatedCustomers(Id recordId) {

		Account objAccount = [SELECT BillingState
			FROM Account
			WHERE Id =: recordId];

		return new List<Account>([SELECT Id, Name, Owner.Name, NumberofTreatmentScore__c, AverageTicket__c, NumberofLocations__c, Credit_Card_Integration__c
			FROM Account
			WHERE BillingState =: objAccount.BillingState
			AND RecordType.Name = 'Customer'
			AND Id <>: recordId]);
    }
}