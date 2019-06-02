public class CaseTriggerTestUtil
{
    public static Account createPesonAccount(Id RecId)
    {
        Account acc = new Account();
        acc.RecordTypeId=RecId;
        acc.LastName='Test LastName';
        acc.PersonEmail='testing@lastname.com';
        acc.Lending_Program_Name__c ='upstart';
        acc.NSC_Trans_ops__c ='1234567';
        acc.NSC_Trans__c ='1234567';
        insert acc;
        return acc;
    
    }
    
    
    public static case createcase(string subject,string Origin,string suppliedEmail)
    {
        Case cs = new Case();
        cs.status='New';
        cs.Subject=subject;
        cs.description='test';
        cs.Origin=Origin;
        if(suppliedEmail!='')
        cs.suppliedEmail=suppliedEmail;
        insert cs; 
        return cs;
    }
    
    public static Credit_Card_Applications__c ccaCreation(String AccId,string Email)
    {
        
        Credit_Card_Applications__c cca = new Credit_Card_Applications__c();
        cca.Name__c='Test';
        cca.Account__c=AccId;
        cca.Email__c=Email;
        insert cca;
        return cca;
    }
    
    public static void createFundingAgreements(Id accId)
    {
        Funding_Agreement__c fa = new Funding_Agreement__c();
        fa.Name='Test FA';
        fa.Upstart__c=accId;
        insert fa;
    }
    
    

}