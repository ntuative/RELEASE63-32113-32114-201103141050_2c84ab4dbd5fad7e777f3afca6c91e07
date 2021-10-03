package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class HabboSearchResultData
   {
       
      
      private var var_2099:int;
      
      private var var_1802:String;
      
      private var var_2101:String;
      
      private var var_2102:Boolean;
      
      private var var_2103:Boolean;
      
      private var var_2100:int;
      
      private var var_2098:String;
      
      private var var_2104:String;
      
      private var var_1804:String;
      
      public function HabboSearchResultData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2099 = param1.readInteger();
         this.var_1802 = param1.readString();
         this.var_2101 = param1.readString();
         this.var_2102 = param1.readBoolean();
         this.var_2103 = param1.readBoolean();
         param1.readString();
         this.var_2100 = param1.readInteger();
         this.var_2098 = param1.readString();
         this.var_2104 = param1.readString();
         this.var_1804 = param1.readString();
      }
      
      public function get avatarId() : int
      {
         return this.var_2099;
      }
      
      public function get avatarName() : String
      {
         return this.var_1802;
      }
      
      public function get avatarMotto() : String
      {
         return this.var_2101;
      }
      
      public function get isAvatarOnline() : Boolean
      {
         return this.var_2102;
      }
      
      public function get canFollow() : Boolean
      {
         return this.var_2103;
      }
      
      public function get avatarGender() : int
      {
         return this.var_2100;
      }
      
      public function get avatarFigure() : String
      {
         return this.var_2098;
      }
      
      public function get lastOnlineDate() : String
      {
         return this.var_2104;
      }
      
      public function get realName() : String
      {
         return this.var_1804;
      }
   }
}
