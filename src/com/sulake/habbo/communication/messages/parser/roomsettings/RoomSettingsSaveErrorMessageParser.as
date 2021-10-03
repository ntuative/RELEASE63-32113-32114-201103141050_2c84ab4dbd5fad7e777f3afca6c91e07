package com.sulake.habbo.communication.messages.parser.roomsettings
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class RoomSettingsSaveErrorMessageParser implements IMessageParser
   {
      
      public static const const_1851:int = 1;
      
      public static const const_1874:int = 2;
      
      public static const const_1814:int = 3;
      
      public static const const_1938:int = 4;
      
      public static const const_1387:int = 5;
      
      public static const const_1904:int = 6;
      
      public static const const_1650:int = 7;
      
      public static const const_1402:int = 8;
      
      public static const const_1801:int = 9;
      
      public static const const_1551:int = 10;
      
      public static const const_1656:int = 11;
      
      public static const const_1670:int = 12;
       
      
      private var _roomId:int;
      
      private var var_1526:int;
      
      private var var_1462:String;
      
      public function RoomSettingsSaveErrorMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._roomId = param1.readInteger();
         this.var_1526 = param1.readInteger();
         this.var_1462 = param1.readString();
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get errorCode() : int
      {
         return this.var_1526;
      }
      
      public function get info() : String
      {
         return this.var_1462;
      }
   }
}
