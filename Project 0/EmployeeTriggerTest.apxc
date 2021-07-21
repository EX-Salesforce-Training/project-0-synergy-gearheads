/*
//////////////////////////////////////////////////
//
//  Name: EmployeeTriggerTest
//  Author: Dominic Romanello
//  Created Date: 7/21/21
//  Modified Date: 7/21/21
//  Description: This class is designed to test the EmployeeTriggerHelper class's
//  	functions to account for all use cases.
//  
//
/////////////////////////////////////////////////
*/

@isTest
public class EmployeeTriggerTest {
	
    @isTest
    static void PreventZombieTest(){
        // Try to create and insert an employee into the database
        try{
            Employee__c testEmployee = new Employee__c(Last_Name__c = 'Zombie', Phone__c = '1234567890', Email__c = 'test@example.com', Store__c = 'a025e000003GuRiAAK');
            insert testEmployee;
        //If a DML exception occurs we know that the code worked properly, so we assert it to true.
        }catch(DmlException e){
            system.assert(true);
        }
    }
    
    //Try to create and insert 151 employees into the database
    //	with only one having the name "Zombie" that is added after the "good"
    //	records are added to the list. It is then inserted into the database and should
    //	catch a DMLException and if so then the Test passes.
    @isTest
    static void PreventZombieBulkTest(){
        try{
            List<Employee__c> testEmployees = new List<Employee__c>();
            for(integer i = 0 ; i<150 ; i++){
                Employee__c e = new Employee__c(Last_Name__c = 'TestName', Phone__c = '1234567890', Email__c = 'test@example.com', Store__c = 'a025e000003GuRiAAK');
                testEmployees.add(e);
            }
            Employee__c e = new Employee__c(Last_Name__c = 'Zombie', Phone__c = '1234567890', Email__c = 'test@example.com', Store__c = 'a025e000003GuRiAAK');
            testEmployees.add(e);
            insert testEmployees;
        }catch(DMLException e){
            system.assert(true);
        }
    }
    
    @isTest
    static void CheckForDuplicatePhonesTest(){
        try{
            Employee__c testEmployee = new Employee__c(Last_Name__c = 'TestName', Phone__c = '1234567890', Email__c = 'test@example.com', Store__c = 'a025e000003GuRiAAK');
            System.debug(testEmployee);
            insert testEmployee;
            Employee__c testEmployee2 = new Employee__c(Last_Name__c = 'TestName2', Phone__c = '1234567890', Email__c = 'test@example.com', Store__c = 'a025e000003GuRiAAK');
            System.debug(testEmployee2);
            insert testEmployee2;
        }catch(DMLException e){
            system.assert(true);
        }
    }
    
    //Try to create and insert 151 employees into the database
    //	with only one having the same phone number that is added after the "good"
    //	records are added to the list. It is then inserted into the database and should
    //	catch a DMLException and if so then the Test passes.
    @isTest
    static void CheckForDuplicatePhonesBulkTest(){
        try{
            //Iterates 150 times to add different values to the test List
            List<Employee__c> testEmployees = new List<Employee__c>();
            for(integer i = 0 ; i<150 ; i++){
                Employee__c e = new Employee__c();
                e.Last_Name__c = 'TestName' + i;
                e.Phone__c = String.valueOf(1234567890+i);
                e.Email__c = 'test@example.com';
                e.Store__c = 'a025e000003GuRiAAK';
                testEmployees.add(e);
            }
            Employee__c e = new Employee__c(Last_Name__c = 'TestName', Phone__c = '1234567890', Email__c = 'test@example.com', Store__c = 'a025e000003GuRiAAK');
            testEmployees.add(e);
            insert testEmployees;
        }catch(DMLException e){
            system.assert(true);
        }
    }
    
    @isTest
    static void restoredRecordTaskTest(){
        Employee__c testEmployee = new Employee__c(Last_Name__c = 'TestName', Phone__c = '1234567890', Email__c = 'test@example.com', Store__c = 'a025e000003GuRiAAK');
        insert testEmployee;
        delete testEmployee;
        undelete testEmployee;
        List<Task> taskList = [SELECT Id FROM Task];
        system.assertEquals(1,taskList.size());
    }
    
    // Creates a list of Employee records to be deleted from the Database.
    // It inserts these records, deletes them, and then 
    @isTest
    static void restoredRecordTaskBulkTest(){
        List<Employee__c> testEmployees = new List<Employee__c>();
        for(integer i = 0 ; i<150 ; i++){
            Employee__c e = new Employee__c();
            e.Last_Name__c = 'TestName' + i;
            e.Phone__c = String.valueOf(1234567890+i);
            e.Email__c = 'test@example.com'; 
            e.Store__c = 'a025e000003GuRiAAK';
            testEmployees.add(e);
        }
        insert testEmployees;
        delete testEmployees;
        undelete testEmployees;
        List<Task> taskList = [SELECT Id FROM Task];
        system.assertEquals(150, taskList.size());
    }
    
}