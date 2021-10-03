package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserObjectMessageParser implements IMessageParser
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var _figure:String;
      
      private var var_910:String;
      
      private var var_2517:String;
      
      private var var_1804:String;
      
      private var var_2513:int;
      
      private var var_2514:String;
      
      private var var_2515:int;
      
      private var var_2512:int;
      
      private var var_2516:int;
      
      private var var_1041:int;
      
      private var var_675:int;
      
      private var var_2123:int;
      
      public function UserObjectMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._id = int(param1.readString());
         this._name = param1.readString();
         this._figure = param1.readString();
         this.var_910 = param1.readString();
         this.var_2517 = param1.readString();
         this.var_1804 = param1.readString();
         this.var_2513 = param1.readInteger();
         this.var_2514 = param1.readString();
         this.var_2515 = param1.readInteger();
         this.var_2512 = param1.readInteger();
         this.var_2516 = param1.readInteger();
         this.var_1041 = param1.readInteger();
         this.var_675 = param1.readInteger();
         this.var_2123 = param1.readInteger();
         return true;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get figure() : String
      {
         return this._figure;
      }
      
      public function get sex() : String
      {
         return this.var_910;
      }
      
      public function get customData() : String
      {
         return this.var_2517;
      }
      
      public function get realName() : String
      {
         return this.var_1804;
      }
      
      public function get tickets() : int
      {
         return this.var_2513;
      }
      
      public function get poolFigure() : String
      {
         return this.var_2514;
      }
      
      public function get photoFilm() : int
      {
         return this.var_2515;
      }
      
      public function get directMail() : int
      {
         return this.var_2512;
      }
      
      public function get respectTotal() : int
      {
         return this.var_2516;
      }
      
      public function get respectLeft() : int
      {
         return this.var_1041;
      }
      
      public function get petRespectLeft() : int
      {
         return this.var_675;
      }
      
      public function get identityId() : int
      {
         return this.var_2123;
      }
   }
}
