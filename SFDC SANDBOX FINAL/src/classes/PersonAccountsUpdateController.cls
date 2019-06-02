public class PersonAccountsUpdateController
{
    public string Name {get;set;}
    public string Email {get;set;}
    public string SSN {get;set;}
    public list<Account>  personAccounts {get;set;}
    public list<Account> personAccountsToUpdate;
    
    public PersonAccountsUpdateController()
    {
        
    }
    
    public pageReference submit()
    {
        PageReference pg = new PageReference('https://www.upstart.com/');
        if(Email!=null && SSN!=null)
        {
            personAccounts = new list<Account>();
            personAccountsToUpdate= new list<Account>();
            
            
            personAccounts=[SELECT Id, IsPersonAccount, PersonContactId,SSN_Encrypted__c,personEmail FROM Account where IsPersonAccount=true and PersonEmail=:Email];
            
            if(!personAccounts.isempty())
            {
                for(Account a:personAccounts)
                {
                    a.SSN_Encrypted__c =SSN;
                    personAccountsToUpdate.add(a);
                    
                }
            }
            
            if(!personAccountsToUpdate.isempty())
            update personAccountsToUpdate;
            return pg;
        }
        
        return pg;
    }
}