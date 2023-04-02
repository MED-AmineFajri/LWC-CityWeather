public with sharing class VilleController {
    @AuraEnabled(cacheable=true)
    public static List<Account> getCities() {
        AggregateResult[] ag = [Select Name, BillingCity from Account Where BillingCity != null Group By BillingCity, Name Having Count(Id) = 1];
        List<Account> res = new List<Account>();
        for(AggregateResult r : ag){
            res.add(new Account(BillingCity=String.valueOf(r.get('BillingCity')), Name=String.valueOf(r.get('Name'))));
        }
        return res;
    }
}