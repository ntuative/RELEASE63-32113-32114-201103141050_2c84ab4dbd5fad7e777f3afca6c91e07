package com.sulake.habbo.communication.messages.parser.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class NotEnoughBalanceMessageParser implements IMessageParser
   {
       
      
      private var var_1609:int = 0;
      
      private var var_1610:int = 0;
      
      private var var_1671:int = 0;
      
      public function NotEnoughBalanceMessageParser()
      {
         super();
      }
      
      public function get notEnoughCredits() : int
      {
         return this.var_1609;
      }
      
      public function get notEnoughActivityPoints() : int
      {
         return this.var_1610;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1671;
      }
      
      public function flush() : Boolean
      {
         this.var_1609 = 0;
         this.var_1610 = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1609 = param1.readInteger();
         this.var_1610 = param1.readInteger();
         this.var_1671 = param1.readInteger();
         return true;
      }
   }
}
