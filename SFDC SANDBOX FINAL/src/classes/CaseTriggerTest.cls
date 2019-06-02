@istest
public class CaseTriggerTest
{
    public static testmethod void beforeinsertTest()
    {
        List<RecordType> personAccRec = new List<RecordType>();
        personAccRec=[select Id,RecordType.Name from RecordType where sobjectType='Account' and RecordType.Name='Person Account'];
        
        Account personAcc = new Account();
        personAcc=CaseTriggerTestUtil.createPesonAccount(personAccRec[0].Id);
        CaseTriggerRecursive.isexecuted=false;
        
        CaseTriggerTestUtil.ccaCreation(personAcc.Id,'testing@lastname.com');
        CaseTriggerTestUtil.createFundingAgreements(personAcc.Id);
        
        
        Case cs = new Case();
        cs=CaseTriggerTestUtil.createcase('Verification Services Trans. #1234567:','Web','testing@lastname.com');
        Case cs1 = new Case();
        cs1=CaseTriggerTestUtil.createcase('Verification Services Trans. #1234567:','website','testing@lastname.com');
        Case cs2 = new Case();
        cs2=CaseTriggerTestUtil.createcase('Services Trans. #1234567:','website','testing@lastname.com');
        Case cs3 = new Case();
        cs3=CaseTriggerTestUtil.createcase('Services Test:','website','lask@gmail.com');
        Case cs4 = new Case();
        cs4=CaseTriggerTestUtil.createcase('Services Test:','web','lask@gmail.com');
        Case cs5 = new Case();
        cs5=CaseTriggerTestUtil.createcase('Services Test:','website','');
        Case cs6 = new Case();
        cs6=CaseTriggerTestUtil.createcase('Services Test:','web','testing@lastname.com');
        
        cs.status='Closed';
        cs.AccountId=personAcc.Id;
        update cs;
        cs1.status='Closed';
        update cs1;
        cs1.status='New';
        cs1.AccountId=personAcc.Id;
        update cs1;
        cs1.status='Closed';
        update cs1;
        cs2.status='Closed';
        update cs2;
        cs3.status='Closed';
        update cs3;
        cs4.status='Closed';
        update cs4;
        cs5.status='Closed';
        update cs5;
        cs6.status='Closed';
        update cs6;
        
        
    }
}