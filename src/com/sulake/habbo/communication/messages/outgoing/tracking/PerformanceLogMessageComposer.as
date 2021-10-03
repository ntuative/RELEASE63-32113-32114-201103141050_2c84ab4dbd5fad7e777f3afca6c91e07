package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class PerformanceLogMessageComposer implements IMessageComposer
   {
       
      
      private var var_2429:int = 0;
      
      private var var_1362:String = "";
      
      private var var_1703:String = "";
      
      private var var_2393:String = "";
      
      private var var_2629:String = "";
      
      private var var_1872:int = 0;
      
      private var var_2627:int = 0;
      
      private var var_2628:int = 0;
      
      private var var_1361:int = 0;
      
      private var var_2626:int = 0;
      
      private var var_1363:int = 0;
      
      public function PerformanceLogMessageComposer(param1:int, param2:String, param3:String, param4:String, param5:String, param6:Boolean, param7:int, param8:int, param9:int, param10:int, param11:int)
      {
         super();
         this.var_2429 = param1;
         this.var_1362 = param2;
         this.var_1703 = param3;
         this.var_2393 = param4;
         this.var_2629 = param5;
         if(param6)
         {
            this.var_1872 = 1;
         }
         else
         {
            this.var_1872 = 0;
         }
         this.var_2627 = param7;
         this.var_2628 = param8;
         this.var_1361 = param9;
         this.var_2626 = param10;
         this.var_1363 = param11;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2429,this.var_1362,this.var_1703,this.var_2393,this.var_2629,this.var_1872,this.var_2627,this.var_2628,this.var_1361,this.var_2626,this.var_1363];
      }
   }
}
