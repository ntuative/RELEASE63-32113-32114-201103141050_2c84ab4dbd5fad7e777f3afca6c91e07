package com.sulake.habbo.communication.messages.parser.error
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ErrorReportMessageParser implements IMessageParser
   {
       
      
      private var var_1526:int;
      
      private var var_1546:int;
      
      private var var_1545:String;
      
      public function ErrorReportMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1546 = param1.readInteger();
         this.var_1526 = param1.readInteger();
         this.var_1545 = param1.readString();
         return true;
      }
      
      public function flush() : Boolean
      {
         this.var_1526 = 0;
         this.var_1546 = 0;
         this.var_1545 = null;
         return true;
      }
      
      public function get errorCode() : int
      {
         return this.var_1526;
      }
      
      public function get messageId() : int
      {
         return this.var_1546;
      }
      
      public function get timestamp() : String
      {
         return this.var_1545;
      }
   }
}
