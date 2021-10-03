package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ModeratorUserInfoData
   {
       
      
      private var _userId:int;
      
      private var _userName:String;
      
      private var var_2461:int;
      
      private var var_2466:int;
      
      private var var_758:Boolean;
      
      private var var_2462:int;
      
      private var var_2464:int;
      
      private var var_2463:int;
      
      private var var_2465:int;
      
      public function ModeratorUserInfoData(param1:IMessageDataWrapper)
      {
         super();
         this._userId = param1.readInteger();
         this._userName = param1.readString();
         this.var_2461 = param1.readInteger();
         this.var_2466 = param1.readInteger();
         this.var_758 = param1.readBoolean();
         this.var_2462 = param1.readInteger();
         this.var_2464 = param1.readInteger();
         this.var_2463 = param1.readInteger();
         this.var_2465 = param1.readInteger();
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
      
      public function get userName() : String
      {
         return this._userName;
      }
      
      public function get minutesSinceRegistration() : int
      {
         return this.var_2461;
      }
      
      public function get minutesSinceLastLogin() : int
      {
         return this.var_2466;
      }
      
      public function get online() : Boolean
      {
         return this.var_758;
      }
      
      public function get cfhCount() : int
      {
         return this.var_2462;
      }
      
      public function get abusiveCfhCount() : int
      {
         return this.var_2464;
      }
      
      public function get cautionCount() : int
      {
         return this.var_2463;
      }
      
      public function get banCount() : int
      {
         return this.var_2465;
      }
   }
}
