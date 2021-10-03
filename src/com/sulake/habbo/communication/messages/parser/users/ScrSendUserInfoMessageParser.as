package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ScrSendUserInfoMessageParser implements IMessageParser
   {
      
      public static const const_1843:int = 1;
      
      public static const const_1542:int = 2;
       
      
      private var var_968:String;
      
      private var var_2079:int;
      
      private var var_2071:int;
      
      private var var_2070:int;
      
      private var var_2077:int;
      
      private var var_2078:Boolean;
      
      private var var_2075:Boolean;
      
      private var var_2073:int;
      
      private var var_2074:int;
      
      private var var_2069:Boolean;
      
      private var var_2076:int;
      
      private var var_2072:int;
      
      public function ScrSendUserInfoMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_968 = param1.readString();
         this.var_2079 = param1.readInteger();
         this.var_2071 = param1.readInteger();
         this.var_2070 = param1.readInteger();
         this.var_2077 = param1.readInteger();
         this.var_2078 = param1.readBoolean();
         this.var_2075 = param1.readBoolean();
         this.var_2073 = param1.readInteger();
         this.var_2074 = param1.readInteger();
         this.var_2069 = param1.readBoolean();
         this.var_2076 = param1.readInteger();
         this.var_2072 = param1.readInteger();
         return true;
      }
      
      public function get productName() : String
      {
         return this.var_968;
      }
      
      public function get daysToPeriodEnd() : int
      {
         return this.var_2079;
      }
      
      public function get memberPeriods() : int
      {
         return this.var_2071;
      }
      
      public function get periodsSubscribedAhead() : int
      {
         return this.var_2070;
      }
      
      public function get responseType() : int
      {
         return this.var_2077;
      }
      
      public function get hasEverBeenMember() : Boolean
      {
         return this.var_2078;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2075;
      }
      
      public function get pastClubDays() : int
      {
         return this.var_2073;
      }
      
      public function get pastVipDays() : int
      {
         return this.var_2074;
      }
      
      public function get isShowBasicPromo() : Boolean
      {
         return this.var_2069;
      }
      
      public function get basicNormalPrice() : int
      {
         return this.var_2076;
      }
      
      public function get basicPromoPrice() : int
      {
         return this.var_2072;
      }
   }
}
