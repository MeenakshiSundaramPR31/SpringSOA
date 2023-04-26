({
   doInit : function(component, event, helper) {
      var action = component.get("c.getRecentAccounts");
      action.setCallback(this, function(response) {
         var state = response.getState();
         if (state === "SUCCESS") {
            component.set("v.accounts", response.getReturnValue());
         }
         else {
            console.log("Failed with state: " + state);
         }
      });
      $A.enqueueAction(action);
   }
})