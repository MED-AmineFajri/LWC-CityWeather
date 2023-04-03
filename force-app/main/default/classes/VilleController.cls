public with sharing class VilleController {
    @AuraEnabled(cacheable=true)
    public static List<Account> getCities() {
        AggregateResult[] ag = [Select BillingCity from Account Where BillingCity != null Group By BillingCity];
        List<Account> res = new List<Account>();
        for(AggregateResult r : ag){
            res.add(new Account(BillingCity=String.valueOf(r.get('BillingCity'))));
        }
        return res;
    }
}