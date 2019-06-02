@isTest
public class PersonAccountsUpdateControllerTest
{
    public static testmethod void meth()
    {
        // Create person Account
       
        Account a = new Account();
        a.PersonEmail='Test@mail.com';
        a.Lastname='Testlastname';
        
        a.FirstName='Testfirst';
        insert a;
        
        Test.startTest();
            
            PersonAccountsUpdateController pau = new PersonAccountsUpdateController();
            pau.Email='Test@mail.com';
            pau.Name ='vanasvi';
            pau.SSN='12345678';
            pau.submit();
      
        
        Test.stopTest();
    }
}