package com.sulake.habbo.communication.messages.parser.sound
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class NowPlayingMessageParser implements IMessageParser
   {
       
      
      private var var_1973:int;
      
      private var var_1972:int;
      
      private var var_1971:int;
      
      public function NowPlayingMessageParser()
      {
         super();
      }
      
      public function get current() : int
      {
         return this.var_1973;
      }
      
      public function get next() : int
      {
         return this.var_1972;
      }
      
      public function get syncCount() : int
      {
         return this.var_1971;
      }
      
      public function flush() : Boolean
      {
         this.var_1973 = -1;
         this.var_1972 = -1;
         this.var_1971 = -1;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1973 = param1.readInteger();
         this.var_1972 = param1.readInteger();
         this.var_1971 = param1.readInteger();
         return true;
      }
   }
}
