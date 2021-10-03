package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceConfigurationParser implements IMessageParser
   {
       
      
      private var var_1415:Boolean;
      
      private var var_2170:int;
      
      private var var_1590:int;
      
      private var var_1589:int;
      
      private var var_2165:int;
      
      private var var_2171:int;
      
      private var var_2166:int;
      
      private var var_2167:int;
      
      public function MarketplaceConfigurationParser()
      {
         super();
      }
      
      public function get isEnabled() : Boolean
      {
         return this.var_1415;
      }
      
      public function get commission() : int
      {
         return this.var_2170;
      }
      
      public function get tokenBatchPrice() : int
      {
         return this.var_1590;
      }
      
      public function get tokenBatchSize() : int
      {
         return this.var_1589;
      }
      
      public function get offerMinPrice() : int
      {
         return this.var_2171;
      }
      
      public function get offerMaxPrice() : int
      {
         return this.var_2165;
      }
      
      public function get expirationHours() : int
      {
         return this.var_2166;
      }
      
      public function get averagePricePeriod() : int
      {
         return this.var_2167;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1415 = param1.readBoolean();
         this.var_2170 = param1.readInteger();
         this.var_1590 = param1.readInteger();
         this.var_1589 = param1.readInteger();
         this.var_2171 = param1.readInteger();
         this.var_2165 = param1.readInteger();
         this.var_2166 = param1.readInteger();
         this.var_2167 = param1.readInteger();
         return true;
      }
   }
}
