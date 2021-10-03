package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceItemStatsParser implements IMessageParser
   {
       
      
      private var var_2161:int;
      
      private var var_2160:int;
      
      private var var_2162:int;
      
      private var _dayOffsets:Array;
      
      private var var_1735:Array;
      
      private var var_1734:Array;
      
      private var var_2163:int;
      
      private var var_2164:int;
      
      public function MarketplaceItemStatsParser()
      {
         super();
      }
      
      public function get averagePrice() : int
      {
         return this.var_2161;
      }
      
      public function get offerCount() : int
      {
         return this.var_2160;
      }
      
      public function get historyLength() : int
      {
         return this.var_2162;
      }
      
      public function get dayOffsets() : Array
      {
         return this._dayOffsets;
      }
      
      public function get averagePrices() : Array
      {
         return this.var_1735;
      }
      
      public function get soldAmounts() : Array
      {
         return this.var_1734;
      }
      
      public function get furniTypeId() : int
      {
         return this.var_2163;
      }
      
      public function get furniCategoryId() : int
      {
         return this.var_2164;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_2161 = param1.readInteger();
         this.var_2160 = param1.readInteger();
         this.var_2162 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         this._dayOffsets = [];
         this.var_1735 = [];
         this.var_1734 = [];
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this._dayOffsets.push(param1.readInteger());
            this.var_1735.push(param1.readInteger());
            this.var_1734.push(param1.readInteger());
            _loc3_++;
         }
         this.var_2164 = param1.readInteger();
         this.var_2163 = param1.readInteger();
         return true;
      }
   }
}
