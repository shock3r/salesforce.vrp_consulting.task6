({
	getData : function(component) {
		var action = component.get('c.getProducts');
        action.setParams({
            searchValue : null
        });
        
		action.setCallback(this, $A.getCallback(function (response) {
            
			var state = response.getState();
			if (state === "SUCCESS") {
				component.set('v.data', response.getReturnValue());
			} else if (state === "ERROR") {
				var errors = response.getError();
				console.error(errors);
			}

		}));
		$A.enqueueAction(action);
	},
    
    searchData : function(component, searchData) {
		var action = component.get('c.getProducts');
        console.log('Search value:' + searchData);
        
        action.setParams({
            searchValue : searchData
        });
        
         console.log('log action.getState:'+action.getState());
        
		action.setCallback(this, $A.getCallback(function (response) {
            
			var state = response.getState();
			if (state === "SUCCESS") {
				component.set('v.data', response.getReturnValue());
			} else if (state === "ERROR") {
				var errors = response.getError();
				console.error(errors);
			}

		}));
		$A.enqueueAction(action);
	},
    
    GetUpdateObjectByID : function(component, Id) {
		var action = component.get('c.getProductByID');
        action.setParams({
            ProductID : Id
        });
		action.setCallback(this, $A.getCallback(function (response) {
            
			var state = response.getState();
			if (state === "SUCCESS") {
				//component.set('v.dataProductByID', response.getReturnValue());
                component.set("v.product", response.getReturnValue());
                //component.set("v.updateObjectID", Id);
                
			} else if (state === "ERROR") {
				var errors = response.getError();
				console.error(errors);
			}

		}));
		$A.enqueueAction(action);
	},
    
    deleteData : function(component, Id) {
        console.log('log id:'+Id);
        var action = component.get("c.deleteProductTable");
        console.log('log action.getState:'+action.getState());
        action.setParams({
            ProductID : Id
        });
        
        action.setCallback(this,function(a){
            //get the response state
            var state = a.getState();                    
            //check if result is successfull
            if(state == "SUCCESS"){                
                alert('Record was deleted');
            } else if(state == "ERROR"){
                alert('Error in calling server side action');
            }
        });
        
        //adds the server-side action to the queue
        $A.enqueueAction(action);
        
        var a = component.get('c.init');
        $A.enqueueAction(a);
    },
    
    InputData : function(component, product) {
         
         //Calling the Apex Function
         var action = component.get("c.insertNewProductTable");
         console.log('log action.getState:'+action.getState());
         //Setting the Apex Parameter
         action.setParams({
             product : product
         });
         
         //Setting the Callback
         action.setCallback(this,function(a){
             //get the response state
             var state = a.getState();
             //check if result is successfull
             if(state == "SUCCESS"){
                 //Reset Form
                 var newProduct = {'sobjectType': 'ProductTable__c',                                   
                                   'Name': '',
                                   'Amount__c': '',
                                   'Price__c': '',
                                   'ProductType__c': '',
                                   'ReleaseDate__c': '',
                                   'Available__c': '',
                                   'AddedDate__c': ''                                   
                                  };
                 //resetting the Values in the form
                 component.set("v.product",newProduct);
                 alert('Record is Created Successfully');
             } else if(state == "ERROR"){
                 alert('Error in calling server side action');
             }
         });
         
         //adds the server-side action to the queue
         $A.enqueueAction(action);
         
         var a = component.get('c.init');
         $A.enqueueAction(a);
         component.set("v.isOpen", false);
	 },
    
    updateData : function(component, product) {
         
         //Calling the Apex Function      
         var action = component.get("c.updateNewProductTable");
         //console.log('log action.getState:'+action.getState());
        
         //Setting the Apex Parameter
         action.setParams({
             product : product
         });
         
         //Setting the Callback
         action.setCallback(this,function(a){
             //get the response state
             var state = a.getState();
             console.log('log Name:'+a.Name);
             console.log('log getState:'+a.getState());
             console.log('log state:'+state);
             
             //check if result is successfull
             if(state == "SUCCESS"){
                 //Reset Form
                 var newProduct = {'sobjectType': 'ProductTable__c',                                   
                                   'Name': '',
                                   'Amount__c': '',
                                   'Price__c': '',
                                   'ProductType__c': '',
                                   'ReleaseDate__c': '',
                                   'Available__c': '',
                                   'AddedDate__c': ''                                   
                                  };
                 //resetting the Values in the form
                 component.set("v.product",newProduct);
                 alert('Record is Created Successfully');
             } else if(state == "ERROR"){
                 alert('Error in calling server side action');
             }
         });
         
         //adds the server-side action to the queue
         $A.enqueueAction(action);
         
         var a = component.get('c.init');
         $A.enqueueAction(a);
         component.set("v.isOpen", false);
         
	 },
})