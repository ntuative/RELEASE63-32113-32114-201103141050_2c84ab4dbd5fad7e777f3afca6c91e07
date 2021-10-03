package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.core.utils.Map;
   
   public class FaqClientFaqsMessageParser implements IMessageParser
   {
       
      
      private var var_866:Map;
      
      private var var_865:Map;
      
      public function FaqClientFaqsMessageParser()
      {
         super();
      }
      
      public function get urgentData() : Map
      {
         return this.var_866;
      }
      
      public function get normalData() : Map
      {
         return this.var_865;
      }
      
      public function flush() : Boolean
      {
         if(this.var_866 != null)
         {
            this.var_866.dispose();
         }
         this.var_866 = null;
         if(this.var_865 != null)
         {
            this.var_865.dispose();
         }
         this.var_865 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         this.var_866 = new Map();
         this.var_865 = new Map();
         _loc5_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc5_)
         {
            _loc2_ = param1.readInteger();
            _loc3_ = param1.readString();
            this.var_866.add(_loc2_,_loc3_);
            _loc4_++;
         }
         _loc5_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc5_)
         {
            _loc2_ = param1.readInteger();
            _loc3_ = param1.readString();
            this.var_865.add(_loc2_,_loc3_);
            _loc4_++;
         }
         return true;
      }
   }
}
