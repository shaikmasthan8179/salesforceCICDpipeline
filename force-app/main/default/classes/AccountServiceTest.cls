@isTest
private class AccountServiceTest {

    @isTest
    static void testUpdateAccountRating(){

        Account acc = new Account(
            Name = 'Test Account',
            AnnualRevenue = 2000000
        );

        insert acc;

        List<Account> accounts = [
            SELECT Id, Name, AnnualRevenue, Rating
            FROM Account
            WHERE Id = :acc.Id
        ];

        Test.startTest();
        AccountService.updateAccountRating(accounts);
        Test.stopTest();

        Account updatedAcc = [
            SELECT Rating
            FROM Account
            WHERE Id = :acc.Id
        ];

        System.assertEquals('Hot', updatedAcc.Rating);
    }
}