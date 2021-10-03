package com.sulake.habbo.communication.messages.outgoing.room.avatar
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class SignMessageComposer implements IMessageComposer
   {
       
      
      private var var_2455:int;
      
      public function SignMessageComposer(param1:int)
      {
         super();
         this.var_2455 = param1;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2455];
      }
      
      public function dispose() : void
      {
      }
   }
}
