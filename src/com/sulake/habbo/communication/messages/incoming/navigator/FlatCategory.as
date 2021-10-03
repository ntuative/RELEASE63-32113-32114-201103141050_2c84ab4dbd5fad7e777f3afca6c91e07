package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FlatCategory
   {
       
      
      private var var_1533:int;
      
      private var var_2734:String;
      
      private var var_313:Boolean;
      
      public function FlatCategory(param1:IMessageDataWrapper)
      {
         super();
         this.var_1533 = param1.readInteger();
         this.var_2734 = param1.readString();
         this.var_313 = param1.readBoolean();
      }
      
      public function get nodeId() : int
      {
         return this.var_1533;
      }
      
      public function get nodeName() : String
      {
         return this.var_2734;
      }
      
      public function get visible() : Boolean
      {
         return this.var_313;
      }
   }
}
