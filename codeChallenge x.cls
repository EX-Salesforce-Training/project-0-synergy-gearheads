trigger ValidateTrigger on Account (before insert, before update, 
                                    before delete, after insert, 
                                    after update, after delete, 
                                    after undelete) {
    switch on trigger.operationType {
        when BEFORE_INSERT {
            
            ValidateRecord.AccountRecord(Trigger.New);
           
        }
        When BEFORE_UPDATE {
            ValidateRecord.DomainMatch(Trigger.New);
           
        }
        When BEFORE_DELETE {
            
        }
        When AFTER_INSERT {
             
        }
        When AFTER_UPDATE {
            
        }
        When AFTER_DELETE {
            
        }
        When AFTER_UNDELETE {
            
        }
        When else{
            
        }
    }

}

public class ValidateRecord {
/* After an account record is removed 
 * from the recycle bin, 
 * make a task for the account owner to validate 
  the record and update if needed.
*/
    public static void AccountRecord(List<Account> acc){
        List<Task> lists = new List<Task>();
        for(Account ac: acc){
            Task tsk = new Task();
            // this create a look-up relationship
            tsk.WhatId = ac.Id;
            // When the account created and before inserted, error will triggered
             ac.addError('You have a task: Validate the record and Update');
            lists.add(tsk);
        
        }
       insert(lists);    
       
    }
    
          
 /*
  * Whenever a new contact is made check 
  * to see if the email domain matches an account's site. 
  * If it does, relate the new contact to the account.
 */
   //domain can be: firstname + Lastname + @ + gmail + . +  com
    public static void DomainMatch(List<Account> acnt){
        Contact cont = new Contact();
       for(Account cnt: acnt){
       
       	String domain= '@gmail.com';
       	cont.Email= cont.FirstName + domain;
            if(cnt.site == domain){
               cont.id=cnt.Id;
            }
            else{
                cnt.addError('Domain and account site don t match');
            }
        }
        update cont;
        
    }
    

@isTest
public class AccountTriggerTest {
    
    
    @isTest static void accountRecordUpdate(){
        Account acc = new Account(Name ='Markos', Phone = '555 555 5555');
        Database.SaveResult sr = Database.insert(acc, false);
        integer numFailed = 0;
        
        if(!sr.isSuccess()){
            numFailed = 1;
        }
        System.assertEquals(1, numFailed);
        
           }
    @isTest static void bulkTestRecordUpdate(){
        List<Account> acc = new List<Account>();
        for(Integer i=0; i < 100; i++){
            Account acnt = new Account(Name ='Test'+i, Phone='555 555 555'+i);
            acc.add(acnt);
        }
        
        
        List<Database.SaveResult> result = Database.insert(acc, False);
        Integer numFailed =0;
        for(Database.SaveResult sr :result){
            if(!sr.isSuccess()){
                numFailed += 1;
            }
        }
        System.assertEquals(100, numFailed);
    }
    
    @isTest static void domainMatchTest(){
        Contact c = new Contact(FirstName=' Test', LastName='Tast', Email= 'Test@gmail.com');
        Database.SaveResult sr = Database.insert(c, True);
       	Integer numFailed = 0;
        if(sr.isSuccess()){
            numFailed = 1;
        }
        System.assertEquals(1, numFailed);
       	    
       }  
    @isTest static void BulkTestDomainMatch(){
        List<Contact> acc = new List<Contact>();
        
        for(Integer i = 0; i < 100; i++){
            Contact co = new Contact();
            co.FirstName = 'Test'+i;
            co.LastName = 'TestB'+i;
            co.Email = 'Test'+ i + '@gmail.com';   
            acc.add(co);
        }
       
        List<Database.SaveResult> result = Database.insert(acc, True);
        Integer numFailed =0;
        for(Database.SaveResult sr :result){
            if(sr.isSuccess()){
                numFailed += 1;
            }
        }
        System.assertEquals(100, numFailed);
        
    }


}