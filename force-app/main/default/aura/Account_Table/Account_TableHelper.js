({
   getRecentAccounts : function(component) {
      var action = component.get("c.getRecentAccounts");
      action.setParams({ limit : 10 });
      return action;
   }
})