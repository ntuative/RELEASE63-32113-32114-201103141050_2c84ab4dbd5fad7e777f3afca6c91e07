package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class LatencyPingReportMessageComposer implements IMessageComposer
   {
       
      
      private var var_2532:int;
      
      private var var_2533:int;
      
      private var var_2531:int;
      
      public function LatencyPingReportMessageComposer(param1:int, param2:int, param3:int)
      {
         super();
         this.var_2532 = param1;
         this.var_2533 = param2;
         this.var_2531 = param3;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2532,this.var_2533,this.var_2531];
      }
      
      public function dispose() : void
      {
      }
   }
}
