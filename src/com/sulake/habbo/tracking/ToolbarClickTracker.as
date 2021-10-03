package com.sulake.habbo.tracking
{
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   
   public class ToolbarClickTracker
   {
       
      
      private var var_1271:IHabboTracking;
      
      private var var_1912:Boolean = false;
      
      private var var_2653:int = 0;
      
      private var var_1885:int = 0;
      
      public function ToolbarClickTracker(param1:IHabboTracking)
      {
         super();
         this.var_1271 = param1;
      }
      
      public function dispose() : void
      {
         this.var_1271 = null;
      }
      
      public function configure(param1:IHabboConfigurationManager) : void
      {
         this.var_1912 = Boolean(parseInt(param1.getKey("toolbar.tracking.enabled","1")));
         this.var_2653 = parseInt(param1.getKey("toolbar.tracking.max.events","100"));
      }
      
      public function track(param1:String) : void
      {
         if(!this.var_1912)
         {
            return;
         }
         ++this.var_1885;
         if(this.var_1885 <= this.var_2653)
         {
            this.var_1271.track("toolbar",param1);
         }
      }
   }
}
