public class Challenge {
	
    
    
    List<Account> pokedex = new List<Account>();
    
    public Challenge(){
       
    }
    
    public void AddPokemon(){
        for(integer i = 0; i<151; i++){
            Account pokemon = new Account();
            pokemon.Name = 'Pokemon' + i;
            pokedex.add(pokemon);
        }
        insert pokedex;
    }
    
    public void RemovePokemon(){
        for(Account pokemon : [SELECT Name FROM Account WHERE Name like 'Pokemon%']){
            pokedex.add(pokemon);
        }
        delete pokedex;
    }
    
    //I know there's an easier and more efficient way to do this via one for loop
    public void DefaultContactInfo(){
        List<Contact> phoneList = new List<Contact>();
        List<Contact> emailList = new List<Contact>();
        for(Contact c : [SELECT Phone FROM Contact WHERE Phone = Null]){
            if(c.phone == Null){
                c.phone = 'None';
            }
            phoneList.add(c);
        }
        for(Contact c : [SELECT Email From Contact WHERE Email = Null]){
            if(c.email == Null){
                c.email = 'None@email.com';
            }
            emailList.add(c);
        }
        update phoneList;
        update emailList;
    }
    
    public void BobifyIt(){
        List<Contact> contactList = new List<Contact>();
        for(integer i = 0; i<200; i++){
            Contact c = new Contact();
            c.FirstName = 'Bob';
            c.LastName = 'Test' + i;
            contactList.add(c);
        }
        for(Contact c : [SELECT FirstName FROM Contact WHERE FirstName != 'Bob']){
            c.FirstName = 'Bob';
            contactList.add(c);
        }
        upsert contactList;
    }
    
}