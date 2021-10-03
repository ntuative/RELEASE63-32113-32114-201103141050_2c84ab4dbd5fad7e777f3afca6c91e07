package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class TutorialStatusMessageParser implements IMessageParser
   {
       
      
      private var var_1097:Boolean;
      
      private var var_1096:Boolean;
      
      private var var_1340:Boolean;
      
      public function TutorialStatusMessageParser()
      {
         super();
      }
      
      public function get hasChangedLooks() : Boolean
      {
         return this.var_1097;
      }
      
      public function get hasChangedName() : Boolean
      {
         return this.var_1096;
      }
      
      public function get hasCalledGuideBot() : Boolean
      {
         return this.var_1340;
      }
      
      public function flush() : Boolean
      {
         this.var_1097 = false;
         this.var_1096 = false;
         this.var_1340 = false;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1097 = param1.readBoolean();
         this.var_1096 = param1.readBoolean();
         this.var_1340 = param1.readBoolean();
         return true;
      }
   }
}
