//Поле Available должно автоматически заполняться при создании или обновлении товара.
//Если поле Amount > 0, выставляем в true
//Если поле Amount <= 0, выставляем в false
//Поле AddedDate должно автоматически заполняться временем создания, при создании продукта
//Используйте класс Datetime, что бы заполнять это поле

public with sharing class ProductTableTriggerHelper {

    public static void handleBeforeInsert(List<ProductTable__c> myProductsList){
        
        for (ProductTable__c myProduct:myProductsList ) {
            
            if (myProduct.AddedDate__c==null) {                
                myProduct.AddedDate__c = DateTime.now();                   
            }
            
            insertValueIntoAvailableField(myProduct);
        }
        
    } // handleBeforeInsert()
    
    public static void handleBeforeUpdate(List<ProductTable__c> myProductsList){
        
        for (ProductTable__c myProduct:myProductsList ) {
            insertValueIntoAvailableField(myProduct);   
        } 
           
    } // handleBeforeUpdate()
        
    private static void insertValueIntoAvailableField(ProductTable__c myProduct){
        
        if (myProduct.Amount__c <= 0 || myProduct.Amount__c == null ) {
            myProduct.Available__c = False;
        } else if (myProduct.Amount__c > 0) {
            myProduct.Available__c = True;
        }
        
    } // insertValueIntoAvailableField()
    
}