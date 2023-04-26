trigger ContactTrigger on Contact (after insert, after update, after delete, after undelete) {
	List<Account> accountList = new List<Account>();
    Map<Id, Integer> contactsCountMap = new Map<Id, Integer>();
    
    for(Contact con : Trigger.New){
		contactsCountMap.put(con.AccountId, 0);
    }
    
    for(AggregateResult result : [Select AccountId, COUNT(Id) numContact FROM Contact Where AccountId IN: contactsCountMap.keySet() GROUP BY AccountId]){
        Id accId = (Id)result.get('AccountId');
        Integer contactCount= (Integer)result.get('numContact');
        
        contactsCountMap.put(accId, contactCount);
    }
    
    for(Id accId : contactsCountMap.keySet()){
        //accountList.add(new Account(Id = accId, Number_of_Contacts__c = contactsCountMap.get(accId)));
    }
    
    update accountList;
}