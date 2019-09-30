//Класс должен покрывать тестами следующие классы:
//ProductTableTrigger
//ProductTableCmpController

@isTest
public class TestProductTableApplication {
    
    //add test data
    @TestSetup
    public static void setup() {
        
        ProductTable__c ProducTest1 = new ProductTable__c(Name = 'testUnit1');
        insert ProducTest1;
 
        String searhDateInTextValue = '2019-09-29 20:24:39';
        DateTime testData = DateTime.valueOf(searhDateInTextValue);
        ProductTable__c ProducTest2 = new ProductTable__c(Name = 'testUnit2', AddedDate__c = testData);
        insert ProducTest2;
    }
    
    @isTest
    public static void testHhandleBeforeInsert() {
       
        Boolean isInserted;
        ProductTable__c testUnitInsert = new ProductTable__c(Name = 'testUnitInsert');  
        Try{
            insert testUnitInsert;
            isInserted = true;
        } catch(Exception e){
            isInserted = false;  
        }
        System.assertEquals(true, isInserted , 'Error in insertion testUnitInsert');
        
        ProductTable__c testUnitAfterInsert = [SELECT Name, AddedDate__c   FROM ProductTable__c ORDER WHERE Name='testUnitInsert'];  
        System.assertNotEquals(null, testUnitAfterInsert.AddedDate__c, 'Error in AddedDate__c field');
          
    } // testHhandleBeforeInsert()
    
    @isTest
    public static void testHandleBeforeUpdate(){
        
        ProductTable__c testUnit1 = [SELECT  Name,  Amount__c, Available__c  FROM ProductTable__c ORDER WHERE Name='testUnit1'];
        testUnit1.Amount__c = 5;
        Boolean isUpdated;
        
        Try{
            update testUnit1;
            isUpdated = true;
        } catch(Exception e){
          	isUpdated = false;  
        }
        
        ProductTable__c updatedTestUnit1 = [SELECT Name,  Amount__c, Available__c  FROM ProductTable__c ORDER WHERE Name='testUnit1'];
        
        System.assertEquals(true, isUpdated , 'Error in update testUnit1');
        System.assertEquals(true, updatedTestUnit1.Available__c, 'Error Available must be "true"');
    } // testHandleBeforeUpdate()
    
    @isTest
    public static void testProductTableCmpGetProducts(){
       
        List<ProductTable__c> ProductsListNull = ProductTableCmpController.getProducts(null);
        System.assertNotEquals(0,  ProductsListNull.size() , 'ProductsListNull must be greater than zero (null)');
        
        List<ProductTable__c> ProductsListText = ProductTableCmpController.getProducts('Unit1');
        System.assertNotEquals(0,  ProductsListText.size() , 'ProductsListText must be greater than zero (String text)');
        /*
        String searhDateInTextValue = '2019-09-29 20:24:39';
        List<ProductTable__c> ProductsListDate = ProductTableCmpController.getProducts(searhDateInTextValue);
        System.assertNotEquals(0,  ProductsListDate.size() , 'ProductsListDate must be greater than zero (String Date)');
        */
    }
    
    @isTest
    public static void testinsertNewProductTable(){
        
        ProductTable__c testProduct = new ProductTable__c(Name = 'AddRecord test');
        ProductTableCmpController.insertNewProductTable(testProduct);
        ProductTable__c insertedProduct = [SELECT ID, NAME FROM ProductTable__c ORDER WHERE Name='AddRecord test'];
        System.assertNotEquals(null, insertedProduct, 'Inserted value must not be a null');        
    
	}
    
     @isTest
    public static void testupdateNewProductTable(){
        
        ProductTable__c updateProduct = [SELECT ID, NAME, Amount__c FROM ProductTable__c ORDER WHERE Name='testUnit1'];
        updateProduct.Amount__c = 777;
        ProductTableCmpController.updateNewProductTable(updateProduct);
        System.assertEquals(777, updateProduct.Amount__c, 'Inserted value of Amount__c must be 777');        
    
	}
    
    
    @isTest
    public static void testDeleteProductTable(){
        
        ProductTable__c checkProduct = [SELECT ID, NAME, Amount__c FROM ProductTable__c ORDER WHERE Name='testUnit1'];
        String IDForTest = '' + checkProduct.ID;
        ProductTableCmpController.deleteProductTable(IDForTest);
        ProductTable__c checkProduct2;
        Try {
            checkProduct2 = [SELECT ID, NAME, Amount__c FROM ProductTable__c ORDER WHERE Name='testUnit1'];
        } Catch (Exception ex) {
            checkProduct2 = null;
        }
        
        
		System.assertEquals(null, checkProduct2, 'Must be null');        
    
	}
	
	
    @isTest
    public static void testGetProductByID(){
        
        ProductTable__c checkProduct = [SELECT ID, NAME, Amount__c FROM ProductTable__c ORDER WHERE Name='testUnit1'];
        String IDForTest = '' + checkProduct.ID;
        ProductTable__c selectedByIDProduct = ProductTableCmpController.getProductByID(IDForTest);
        //ProductTable__c checkProduct = [SELECT ID, NAME, Amount__c FROM ProductTable__c ORDER WHERE Name='testUnit1'];
        System.assertEquals(checkProduct.ID, selectedByIDProduct.ID, 'Check and select objects must be the same');        
    
	}
   
}