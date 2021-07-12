/*
 * Prevent the deletion of a Account if there is open Oppertunity related to the account 
 * (try to use a parent to child Relationship SOQL query with this)
 */

public class OfficeChallenge {
    
    public static void PreventDeletion(List<Account> accountsToBeDeleted) {
        List<Account> filteredAccounts = GetOpenOpportunitiesFromAccounts(accountsToBeDeleted);
        for(Account acc: filteredAccounts){
            if(acc.Opportunities.size() != 0){
                acc.addError('Error: Cannot delete Accounts with an open Opportunity.');
            }
        }
        Database.Delete(filteredAccounts, false);
    }
    
    private static List<Account> GetOpenOpportunitiesFromAccounts(List<Account> accountList){
        Set<ID> accountIdSet = new Set<ID>();
        for(Account acc : accountList){
            accountIdSet.add(acc.ID);
        }
        List<Account> filteredAccounts = [SELECT 
                                          (SELECT Name FROM Opportunities WHERE NOT StageName LIKE 'Closed%')
                                          FROM Account WHERE ID IN :accountIdSet];
        return filteredAccounts;
    }
}