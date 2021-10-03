package com.sulake.habbo.messenger.domain
{
   public class Message
   {
      
      public static const const_861:int = 1;
      
      public static const const_898:int = 2;
      
      public static const const_881:int = 3;
      
      public static const const_1075:int = 4;
      
      public static const const_625:int = 5;
      
      public static const const_1232:int = 6;
       
      
      private var _type:int;
      
      private var var_1040:int;
      
      private var var_2107:String;
      
      private var var_2775:String;
      
      public function Message(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         this._type = param1;
         this.var_1040 = param2;
         this.var_2107 = param3;
         this.var_2775 = param4;
      }
      
      public function get messageText() : String
      {
         return this.var_2107;
      }
      
      public function get time() : String
      {
         return this.var_2775;
      }
      
      public function get senderId() : int
      {
         return this.var_1040;
      }
      
      public function get type() : int
      {
         return this._type;
      }
   }
}
