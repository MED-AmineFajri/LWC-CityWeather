@isTest
public class VilleControllerTest {
    static testMethod void testVilleController (){
        List<Account> accounts = new List<Account>();
        for (Integer i = 0; i < 10; i++) {
            accounts.add(new Account (Name = 'Acc ' + i, BillingCity = 'Casablanca'));
        }
        for (Integer j = 0; j < 10; j++) {
            accounts.add(new Account (Name = 'Acc ' + j, BillingCity = 'Rabat'));
        }
       
        Test.startTest();
            insert accounts;
            List<Account> accs = VilleController.getCities();
        Test.stopTest();
        System.assertNotEquals(null, accs, 'Success');
        
    }
}