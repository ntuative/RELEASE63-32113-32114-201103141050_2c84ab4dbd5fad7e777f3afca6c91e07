package com.sulake.core.runtime
{
   class ComponentInterfaceQueue implements IDisposable
   {
       
      
      private var var_1591:IID;
      
      private var var_688:Boolean;
      
      private var var_1056:Array;
      
      function ComponentInterfaceQueue(param1:IID)
      {
         super();
         this.var_1591 = param1;
         this.var_1056 = new Array();
         this.var_688 = false;
      }
      
      public function get identifier() : IID
      {
         return this.var_1591;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_688;
      }
      
      public function get receivers() : Array
      {
         return this.var_1056;
      }
      
      public function dispose() : void
      {
         if(!this.var_688)
         {
            this.var_688 = true;
            this.var_1591 = null;
            while(this.var_1056.length > 0)
            {
               this.var_1056.pop();
            }
            this.var_1056 = null;
         }
      }
   }
}
