public with sharing class AccountService {

    public static void updateAccountRating(List<Account> accounts){

        for(Account acc : accounts){

            if(acc.AnnualRevenue != null && acc.AnnualRevenue > 1000000){
                acc.Rating = 'Hot';
            } else {
                acc.Rating = 'Warm';
            }
        }

        update accounts;
    }
}