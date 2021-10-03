package com.sulake.habbo.communication.messages.parser.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class GiftWrappingConfigurationParser implements IMessageParser
   {
       
      
      private var var_2716:Boolean;
      
      private var var_2715:int;
      
      private var var_1632:Array;
      
      private var var_696:Array;
      
      private var var_695:Array;
      
      public function GiftWrappingConfigurationParser()
      {
         super();
      }
      
      public function get isWrappingEnabled() : Boolean
      {
         return this.var_2716;
      }
      
      public function get wrappingPrice() : int
      {
         return this.var_2715;
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
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc2_:int = 0;
         this.var_1632 = [];
         this.var_696 = [];
         this.var_695 = [];
         this.var_2716 = param1.readBoolean();
         this.var_2715 = param1.readInteger();
         var _loc3_:int = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.var_1632.push(param1.readInteger());
            _loc2_++;
         }
         _loc3_ = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.var_696.push(param1.readInteger());
            _loc2_++;
         }
         _loc3_ = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.var_695.push(param1.readInteger());
            _loc2_++;
         }
         return true;
      }
   }
}
