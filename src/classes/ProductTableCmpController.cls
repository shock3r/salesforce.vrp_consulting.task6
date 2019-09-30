public with sharing class ProductTableCmpController {
    
    @AuraEnabled
    public static List<ProductTable__c> getProducts(String searchValue) {
        List<ProductTable__c> products;
        //Try convert Sting into Date format       
        Try {            
            DateTime searchData = DateTime.valueOf(searchValue);
            searchData = searchData.addHours(3);
            System.debug('Value: '+ searchValue + ' was converted sucesfull into ' + searchData);           
            products = [SELECT ID, Name,  Amount__c, Price__c, ProductType__c, ReleaseDate__c, Available__c, AddedDate__c  FROM ProductTable__c WHERE AddedDate__c =: searchData];
            return products;
        } Catch (Exception ex) {
          System.debug('Value: '+ searchValue + ' cannot be converted into Date format: ' + ex.getMessage());  
        }
        
        //if (searchValue instanceof String)
        if (searchValue == Null || searchValue == '') {
            System.debug('Search variant 1 ');
           products = [SELECT ID, Name,  Amount__c, Price__c, ProductType__c, ReleaseDate__c, Available__c, AddedDate__c  FROM ProductTable__c ORDER BY AddedDate__c DESC];
        } else {
            searchValue = '%' + searchValue + '%';
            System.debug('Search variant 2 ');
           products = [SELECT ID, Name,  Amount__c, Price__c, ProductType__c, ReleaseDate__c, Available__c, AddedDate__c  FROM ProductTable__c WHERE NAME LIKE :searchValue ORDER BY AddedDate__c DESC];
            System.debug('product date: ' + products[0].AddedDate__c);
        }
        return products;
    }
    
    @AuraEnabled 
    public static void insertNewProductTable(ProductTable__c product) { //insertNewProductTable
        try {            
            if (product != null) {
                insert product;
            }
        } catch (Exception ex) {
          System.debug('The following exception has occurred: ' + ex.getMessage());  
        }
        
    }
    
    @AuraEnabled
    public static void updateNewProductTable(ProductTable__C product) {
	
        Try {          
            System.debug('CreateProductTableRecord::updateNewProductTable::product' + product);
            if (product != null) {
                update product;
            }
            
        } catch (Exception ex) {
          System.debug('The following exception has occurred: ' + ex.getMessage());  
        }
        
    }
    
    @AuraEnabled
    public static void deleteProductTable(String ProductID) {
                       
        Id myId = Id.valueOf(ProductID); 
        ProductTable__C product = [SELECT ID, Name,  Amount__c, Price__c, ProductType__c, ReleaseDate__c, Available__c, AddedDate__c  FROM ProductTable__c WHERE ID =: myId];
        Try {          
            System.debug('CreateProductTableRecord::deleteProductTable::ProductID' + ProductID);
            if (product != null) {
                delete product;
            }
            
        } catch (Exception ex) {
          System.debug('The following exception has occurred: ' + ex.getMessage());  
        }
   
    }
     
    @AuraEnabled
    public static ProductTable__C getProductByID(String ProductID) {
                       
        Id myId = Id.valueOf(ProductID); 
        ProductTable__C product = [SELECT ID, Name,  Amount__c, Price__c, ProductType__c, ReleaseDate__c, Available__c, AddedDate__c  FROM ProductTable__c WHERE ID =: myId];
        return product;
   
    }    
}