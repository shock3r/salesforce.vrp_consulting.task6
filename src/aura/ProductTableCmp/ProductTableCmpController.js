({
	init : function(component, event, helper) {
		
        //Name,  Amount__c, Price__c, ProductType__c, ReleaseDate__c, Available__c, AddedDate__c
        component.set('v.columns', [
            {label: 'Id',              fieldName: 'Id'            , type: 'text'},
            {label: 'Name',            fieldName: 'Name'          , type: 'text'},
            {label: 'Amount',          fieldName: 'Amount__c'     , type: 'number'},
            {label: 'Price',           fieldName: 'Price__c'      , type: 'currency'},
            {label: 'Product Type',    fieldName: 'ProductType__c', type: 'text'},
            {label: 'Release Date',    fieldName: 'ReleaseDate__c', type: 'Date'},
            {label: 'Available',       fieldName: 'Available__c'  , type: 'boolean'}, 
            {label: 'AddedDate',       fieldName: 'AddedDate__c'  , type: 'Date'},             
        ]);
            
            helper.getData(component);
        
	},
                    
    searchProduct : function(component, event, helper) {
		var searchData = component.get('v.searchValue');
    	helper.searchData(component, searchData);
        
	},
            
    loadOptions: function (component, event, helper) {
        var opts = [
            { value: "Multimedia device", label: "Multimedia device" },
            { value: "Phone", label: "Phone" },
            { value: "Pad", label: "Pad" },
            { value: "Phone", label: "Phone" },
            { value: "Notebook", label: "Notebook" },
            { value: "Music player", label: "Music player" }
        ];
        component.set("v.options", opts);
    },
    
    openModel: function(component, event, helper) {
        // for Display Model,set the "isOpen" attribute to "true"
        var newProduct = {'sobjectType': 'ProductTable__c',                          		   
                                   'Name': '',
                                   'Amount__c': '',
                                   'Price__c': '',
                                   'ProductType__c': '',
                                   'ReleaseDate__c': '',
                                   'Available__c': '',
                                   'AddedDate__c': ''                                   
                                  };
       	component.set("v.product",newProduct);
        component.set("v.isOpen", true);
        component.set("v.isVisibleAdd", true);
        component.set("v.isVisibleUpdate", false);
        
    },

    closeModel: function(component, event, helper) {
        // for Hide/Close Model,set the "isOpen" attribute to "Fasle"
        component.set("v.isOpen", false);
    },   
    
    deleteProduct : function(component, event, helper) {
    	//alert('delete :' + event.target.id);
        helper.deleteData(component, event.target.id);
	},

    insertProductData : function(component, event, helper) {
        console.log('Create record');
        
        //getting the candidate information
       	var product = component.get("v.product");

        //Validation

        if($A.util.isEmpty(product.Name) || $A.util.isUndefined(product.Name)){
            alert('Name is Required');
            return;
        }
        
        if(product.Amount__c < 0) {
             alert('Amount must be greater than zero. You enter ' + product.Amount__c);
             return;
         }
        
        if(product.Price__c < 0) {
             alert('Price must be greater than zero. You enter ' + product.Price__c);
             return;
         }
               
        if(new Date(product.ReleaseDate__c) > new Date()) {
             alert('Release date must be not greater than today. You enter ' + product.ReleaseDate__c);
             return;
         }
        
        if(product.Amount__c > 0) {
             product.Available = true
        } else {
            product.Available = false
        }
        
        if($A.util.isEmpty(product.ProductType__c) || $A.util.isUndefined(product.ProductType__c)){
         console.log('Before: ' + product.ProductType__c);
          product.ProductType__c = "Multimedia device";
          console.log('After: ' + product.ProductType__c);   
        }      
  
        helper.InputData(component, product);
    },
    
    updateProductData : function(component, event, helper) {
        console.log('Update record');
        
        //getting the product information
       	var product = component.get("v.product");
       
        //Validation

        if($A.util.isEmpty(product.Name) || $A.util.isUndefined(product.Name)){
            alert('Name is Required');
            return;
        }
        
        if(product.Amount__c < 0) {
             alert('Amount must be greater than zero. You enter ' + product.Amount__c);
             return;
         }
        
        if(product.Price__c < 0) {
             alert('Price must be greater than zero. You enter ' + product.Price__c);
             return;
         }
               
        if(new Date(product.ReleaseDate__c) > new Date()) {
             alert('Release date must be not greater than today. You enter ' + product.ReleaseDate__c);
             return;
         }
        
        if(product.Amount__c > 0) {
             product.Available = true
        } else {
            product.Available = false
        }
        
        helper.updateData(component, product);
    },
    
    updateProduct : function(component, event, helper) {
        
        console.log('update record');
        component.set("v.isVisibleAdd",    false);
        component.set("v.isVisibleUpdate", true);
        component.set("v.isOpen",          true);
        helper.GetUpdateObjectByID(component, event.target.id);
         		        
    }
    
})