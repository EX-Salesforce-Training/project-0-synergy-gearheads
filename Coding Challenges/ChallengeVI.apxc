public class ChallengeVI {
	
    //Constructor for the Object Class
    public ChallengeVI(){
        
    }
    
    //Create a method that Creates N number of Accounts, within it call a second method
    //that creates N contacts with the following fields:
    //Name, Annual Revenue, Phone, and Site
    //Relate the newly created contacts to the newly created accounts and insert into the database.
    public void CreateAccounts(integer n){
        List<Account> bobsList = new List<Account>();
        for(integer i = 0; i<n; i++){
            Account bob = new Account();
            bob.Name = 'Account' + i;
            bob.AnnualRevenue = i;
            bob.Phone = '1234567890'; 
            bob.Site = 'www.' + i + '.com';
            bobsList.add(bob);
        }
        insert bobsList;
        CreateContacts(bobsList);
    }
    
    //Create N Contacts and fill out the following fields:
    //Last Name, First Name, Phone, and Email
    public void CreateContacts(List<Account> AccList){
        List<Contact> AccContacts = new List<Contact>();
        for(Account a: AccList){
            Contact c = new Contact();
            c.LastName = a.name + 'Corpman';
            c.FirstName = 'bob';
            c.Phone = '987654321' + a.AnnualRevenue;
            c.Email = c.FirstName + c.LastName + '@' + a.name + '.com';
            c.AccountId = a.id;
            AccContacts.add(c);
        }
        insert AccContacts;
    }
    
    //Gets all child Contacts from the Account using a relationship query.
    //Changes the Contact Phone Number to the Account Phone Number.
    public void UpdateContactNumber(){
        List<Account> AccList = [SELECT Phone, (SELECT Phone FROM Contacts) FROM Account];
        List<Contact> contactList = new List<Contact>();
        for(Account a : AccList){
            if(a.Contacts != Null){
            	List<Contact> currentContacts = a.Contacts;
            	for(Contact c : currentContacts) {
                	c.Phone = a.Phone;
                	contactList.add(c);
            	}
            }
        }
        update contactList;
    }
    
    public void SystemLog(){
        for(contact c : [SELECT FirstName, LastName, Account.Name, Account.Phone, Account.Site FROM Contact])
            system.debug(c.FirstName + ' ' + c.LastName + ', From' + c.Account.Name + '. Reachable at: ' + c.Account.Phone + ' and ' + c.Account.Site);
    }
    
}