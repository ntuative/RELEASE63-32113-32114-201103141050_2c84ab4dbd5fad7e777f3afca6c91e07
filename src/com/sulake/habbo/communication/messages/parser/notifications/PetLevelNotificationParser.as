package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetLevelNotificationParser implements IMessageParser
   {
       
      
      private var var_1665:int;
      
      private var var_2585:String;
      
      private var var_1435:int;
      
      private var var_1201:int;
      
      private var var_1534:int;
      
      private var _color:String;
      
      public function PetLevelNotificationParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1665 = param1.readInteger();
         this.var_2585 = param1.readString();
         this.var_1435 = param1.readInteger();
         this.var_1201 = param1.readInteger();
         this.var_1534 = param1.readInteger();
         this._color = param1.readString();
         return true;
      }
      
      public function get petId() : int
      {
         return this.var_1665;
      }
      
      public function get petName() : String
      {
         return this.var_2585;
      }
      
      public function get level() : int
      {
         return this.var_1435;
      }
      
      public function get petType() : int
      {
         return this.var_1201;
      }
      
      public function get breed() : int
      {
         return this.var_1534;
      }
      
      public function get color() : String
      {
         return this._color;
      }
   }
}
