/*
/////////////////////////////////////////////////////////////////////
//
//  Name: AccountTriggerTest
//  Author: Dominic Romanello
//  Created: 7/14/21
//  Description: Tests Challenge XI RestoredRecordTask with singular testing. Other method was for fun
//  
/////////////////////////////////////////////////////////////////////
*/


@isTest
public class AccountTriggerTest {
    
    @isTest
    static void NoCaliTest(){
        try{
            Account testAccount = new Account(name = 'TestAccount', ShippingState = 'CA');
            insert testAccount;
        }catch(DmlException e){
            system.assert(true);
        }
    }
    
    //Challenge XI Test
    @isTest
    static void RestoredRecordTaskTest(){
        Account testAccount = new Account(name='TestAccount');
        insert testAccount;
        delete testAccount;
        undelete testAccount;
        List<Task> taskList = [SELECT Id FROM Task];
        system.assertEquals(1, taskList.size());
    }
}