@isTest
public class SendEmailToCustomerControllerTest
{
    public static testmethod void testm()
    {
       // Create person Account
       
        Account a = new Account();
        a.PersonEmail='Test@mail.com';
        a.Lastname='Testlastname';
        
        a.FirstName='Testfirst';
        insert a;
        
        Test.startTest();
            
            
            PageReference tpageRef = Page.Send_Email_To_Customer_for_SSN_Update;
            Test.setCurrentPage(tpageRef);

           ApexPages.currentPage().getParameters().put('Id', a.Id);
           
           ApexPages.StandardController sc = new ApexPages.StandardController(a);
            SendEmailToCustomerController obj = new SendEmailToCustomerController(sc);
            obj.sendEmail();
           
      
        
        Test.stopTest();
        
    }
}