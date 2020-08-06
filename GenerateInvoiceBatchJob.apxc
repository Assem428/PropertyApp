global class GenerateInvoiceBatchJob implements Database.Batchable<sObject> {
    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(
                [SELECT Name, Id, Rent_Due_Date__c, Monthly_Rate__c
                 FROM Tenant__c ]);
    }
    global void execute(Database.BatchableContext bc, List<Tenant__c> scope) {
        system.debug(scope);
        List<Invoice__c> invs = new List<Invoice__c>();
        for (Tenant__c tnt : scope) {
            	Invoice__c inv = new Invoice__c();
            	inv.Invoice_for_Tenant__c = tnt.Id;
                invs.add(inv);
        }
        insert invs;
    }
    global void finish(Database.BatchableContext bc) {
     
    }
}