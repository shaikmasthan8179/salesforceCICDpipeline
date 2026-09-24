@isTest
private class AccountServiceTest {

    @isTest
    static void testHotRating() {

        Account acc = new Account(
            Name = 'Hot Account',
            AnnualRevenue = 2000000
        );

        insert acc;

        List<Account> accounts = [
            SELECT Id, AnnualRevenue, Rating
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

    @isTest
    static void testWarmRating() {

        Account acc = new Account(
            Name = 'Warm Account',
            AnnualRevenue = 500000
        );

        insert acc;

        List<Account> accounts = [
            SELECT Id, AnnualRevenue, Rating
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

        System.assertEquals('Warm', updatedAcc.Rating);
    }
}