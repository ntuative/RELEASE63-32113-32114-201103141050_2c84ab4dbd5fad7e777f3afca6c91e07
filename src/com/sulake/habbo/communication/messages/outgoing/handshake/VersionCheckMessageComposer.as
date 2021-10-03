package com.sulake.habbo.communication.messages.outgoing.handshake
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class VersionCheckMessageComposer implements IMessageComposer
   {
       
      
      private var var_2684:int;
      
      private var var_1454:String;
      
      private var var_2683:String;
      
      public function VersionCheckMessageComposer(param1:int, param2:String, param3:String)
      {
         super();
         this.var_2684 = param1;
         this.var_1454 = param2;
         this.var_2683 = param3;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2684,this.var_1454,this.var_2683];
      }
   }
}
