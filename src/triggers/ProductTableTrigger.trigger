trigger ProductTableTrigger on ProductTable__c (before insert, before update) {
   
    if (Trigger.isBefore && Trigger.isInsert) {
       // Поле Available должно автоматически заполняться при создании или обновлении товара.
       // Поле AddedDate должно автоматически заполняться временем создания, при создании продукта
       ProductTableTriggerHelper.handleBeforeInsert(Trigger.new);
        
    } else if (Trigger.isBefore && Trigger.isUpdate){
        // Поле Available должно автоматически заполняться при создании или обновлении товара.
        ProductTableTriggerHelper.handleBeforeUpdate(Trigger.new);
    }
}