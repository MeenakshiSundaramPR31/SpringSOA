public class AccountsController {
   @AuraEnabled
   public static List<Account> getRecentAccounts(Integer acclimit) {
      return [SELECT Id, Name, Phone FROM Account ORDER BY CreatedDate DESC LIMIT :acclimit];
   }
}