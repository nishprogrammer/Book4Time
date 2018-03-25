({
	loadRelatedCustomers : function(component, event) {
		
		var recordId = component.get("v.recordId");

		component.set('v.columns', [
                {label: 'Name', fieldName: 'Name', type: 'text'},
                {label: 'Owner', fieldName: 'OwnerName', type: 'text'},
                {label: 'Number of treatment score', fieldName: 'NumberofTreatmentScore__c', type: 'number'},
                {label: 'Average Ticket', fieldName: 'AverageTicket__c', type: 'text'},
                {label: 'Number of location', fieldName: 'NumberofLocations__c', type: 'number'},
                {label: 'Credit Card Integration', fieldName: 'Credit_Card_Integration__c', type: 'text'}
            ]);

        var action = component.get('c.fetchRelatedCustomers');

        action.setParams({
            "recordId": recordId
        });

        action.setCallback(this, $A.getCallback(function (response) {
        	
            var state = response.getState();
            if (state === "SUCCESS") {
                
                component.set('v.isLoading',false);
                
                var relatedCustomers = response.getReturnValue();
                
                for (var i = 0; i < relatedCustomers.length; i++) {
                    
                    relatedCustomers[i].OwnerName = relatedCustomers[i].Owner.Name;
                }

                component.set('v.relatedCustomers', relatedCustomers);
            } else if (state === "ERROR") {
                var errors = response.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        console.log('## Error : ', errors[0].message);
                    }
                }
            }
        }));

        $A.enqueueAction(action);
	}
})