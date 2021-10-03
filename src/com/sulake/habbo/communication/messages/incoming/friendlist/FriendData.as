package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendData
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_936:int;
      
      private var var_758:Boolean;
      
      private var var_1602:Boolean;
      
      private var _figure:String;
      
      private var var_1489:int;
      
      private var var_1942:String;
      
      private var var_1803:String;
      
      private var var_1804:String;
      
      public function FriendData(param1:IMessageDataWrapper)
      {
         super();
         this._id = param1.readInteger();
         this._name = param1.readString();
         this.var_936 = param1.readInteger();
         this.var_758 = param1.readBoolean();
         this.var_1602 = param1.readBoolean();
         this._figure = param1.readString();
         this.var_1489 = param1.readInteger();
         this.var_1942 = param1.readString();
         this.var_1803 = param1.readString();
         this.var_1804 = param1.readString();
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get gender() : int
      {
         return this.var_936;
      }
      
      public function get online() : Boolean
      {
         return this.var_758;
      }
      
      public function get followingAllowed() : Boolean
      {
         return this.var_1602;
      }
      
      public function get figure() : String
      {
         return this._figure;
      }
      
      public function get categoryId() : int
      {
         return this.var_1489;
      }
      
      public function get motto() : String
      {
         return this.var_1942;
      }
      
      public function get lastAccess() : String
      {
         return this.var_1803;
      }
      
      public function get realName() : String
      {
         return this.var_1804;
      }
   }
}
