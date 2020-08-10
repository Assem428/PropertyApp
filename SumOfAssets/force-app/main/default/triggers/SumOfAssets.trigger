trigger SumOfAssets on Asset__c (after insert, after update, after delete) {
    Set<Id> PropertiesIds= new Set<Id>(); 
        List<Property__c> PropertiesToUpdate= new List<Property__c>();
        if(Trigger.isInsert || Trigger.isUpdate){
            for(Asset__c assets: Trigger.new){ 
                    PropertiesIds.add(assets.Property__c); 
            }
        }
        if(Trigger.isDelete){
            for(Asset__c assets: Trigger.old){ 
                    PropertiesIds.add(assets.Property__c);
            }
        } 
        List <Property__c> PropertiesToUpdateSumOfAssets = [SELECT Id,
                                                    (SELECT Name  
                                                    FROM Assets__r WHERE Property__c != Null) 
                                                    FROM Property__c 
                                                    WHERE Id in :PropertiesIds];
        
            AggregateResult[] groupedResults = [SELECT SUM(Price_for_Asset__c)sum FROM Asset__c Group by Property__c];
            Object total = groupedResults[0].get('sum');
            system.debug(total);
            for(Property__c prop: PropertiesToUpdateSumOfAssets){
                
              if(prop.Assets__r.size()>0) 
                    prop.Sum_of_Assets__c = Integer.valueOf(total);
                    
                    PropertiesToUpdate.add(prop);
        }
        update PropertiesToUpdate;
    }