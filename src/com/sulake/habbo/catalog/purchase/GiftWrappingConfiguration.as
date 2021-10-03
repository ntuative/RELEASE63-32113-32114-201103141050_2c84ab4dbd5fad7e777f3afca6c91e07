package com.sulake.habbo.catalog.purchase
{
   import com.sulake.habbo.communication.messages.incoming.catalog.GiftWrappingConfigurationEvent;
   import com.sulake.habbo.communication.messages.parser.catalog.GiftWrappingConfigurationParser;
   
   public class GiftWrappingConfiguration
   {
       
      
      private var var_1415:Boolean = false;
      
      private var var_1825:int;
      
      private var var_1632:Array;
      
      private var var_696:Array;
      
      private var var_695:Array;
      
      public function GiftWrappingConfiguration(param1:GiftWrappingConfigurationEvent)
      {
         super();
         if(param1 == null)
         {
            return;
         }
         var _loc2_:GiftWrappingConfigurationParser = param1.getParser();
         if(_loc2_ == null)
         {
            return;
         }
         this.var_1415 = _loc2_.isWrappingEnabled;
         this.var_1825 = _loc2_.wrappingPrice;
         this.var_1632 = _loc2_.stuffTypes;
         this.var_696 = _loc2_.boxTypes;
         this.var_695 = _loc2_.ribbonTypes;
      }
      
      public function get isEnabled() : Boolean
      {
         return this.var_1415;
      }
      
      public function get price() : int
      {
         return this.var_1825;
      }
      
      public function get stuffTypes() : Array
      {
         return this.var_1632;
      }
      
      public function get boxTypes() : Array
      {
         return this.var_696;
      }
      
      public function get ribbonTypes() : Array
      {
         return this.var_695;
      }
   }
}
