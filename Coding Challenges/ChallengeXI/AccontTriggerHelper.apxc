public class AccountTriggerHelper {
    
    public static void PreventDeletion(List<Account> accountsToDelete){
        List<Account> filteredAccs = OpenOppsFromAccounts(accountsToDelete);
        for(Account a : filteredAccs){
            if(a.Opportunities.size() != 0)
                a.addError('Accounts with Open Opportunities cannot be deleted.');
            }
    }
    
    private static List<Account> OpenOppsFromAccounts(List<Account> accList){
        Set<id> accIdSet = new Set<id>();
        for(Account a : accList){
            accIdSet.add(a.id);
        }
        List<Account> filteredAccs = [SELECT (SELECT Name FROM Opportunities WHERE NOT StageName LIKE 'Closed%')
                                	FROM Account WHERE Id IN : accIdSet];
        return filteredAccs;
    }
    
    public static void NoCali(List<Account> accountsToAdd){
        for(Account a : accountsToAdd){
            if(a.ShippingState == 'CA'){
                a.addError('We are not currently accepting California clients.');
            }
        }
    }
    
    //Challenge XI Added Method
    public static void RestoredRecordTask(List<Account> restoredRecords){
        List<Task> newTasks = new List<Task>();
        for(Account a : restoredRecords){
            Task newTask = new Task();
            newTask.WhatId = a.Id;
            newTask.Description = 'Hey update this if you need to.';
            newTask.Status = 'Not Started';
            newTask.Subject = 'Other';
            newTask.OwnerId = a.OwnerId;
            newTask.Priority = 'Normal';
            newTasks.add(newTask);
        }
        insert newTasks;
    }
    
    

}