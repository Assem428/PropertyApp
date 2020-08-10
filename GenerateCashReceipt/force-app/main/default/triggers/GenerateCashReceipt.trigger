trigger GenerateCashReceipt on Property__c (after insert, after update) {
    //List<Cash_Receipt__c> CashReceiptToUpdate= new List<Cash_Receipt__c>();  
 for(Property__c prpt: Trigger.new)
         if(prpt.Deposit_paid__c==true) {
            Cash_Receipt__c receipt = new Cash_Receipt__c();
            receipt.Name = 'Test';
            receipt.Deposit_received_from__c = 'Test';
            receipt.Deposit_re__c = 1000;
            receipt.Property_Cash_Receipt__c=prpt.Id;
             insert receipt;
         }
             //insert CashReceiptToUpdate;
}