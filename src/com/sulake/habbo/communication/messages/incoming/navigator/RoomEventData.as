package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomEventData implements IDisposable
   {
       
      
      private var var_1197:Boolean;
      
      private var var_2302:int;
      
      private var var_2303:String;
      
      private var var_360:int;
      
      private var var_2304:int;
      
      private var var_2059:String;
      
      private var var_2306:String;
      
      private var var_2305:String;
      
      private var var_817:Array;
      
      private var _disposed:Boolean;
      
      public function RoomEventData(param1:IMessageDataWrapper)
      {
         var _loc5_:* = null;
         this.var_817 = new Array();
         super();
         var _loc2_:String = param1.readString();
         if(_loc2_ == "-1")
         {
            Logger.log("Got null room event");
            this.var_1197 = false;
            return;
         }
         this.var_1197 = true;
         this.var_2302 = int(_loc2_);
         this.var_2303 = param1.readString();
         this.var_360 = int(param1.readString());
         this.var_2304 = param1.readInteger();
         this.var_2059 = param1.readString();
         this.var_2306 = param1.readString();
         this.var_2305 = param1.readString();
         var _loc3_:int = param1.readInteger();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = param1.readString();
            this.var_817.push(_loc5_);
            _loc4_++;
         }
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         this.var_817 = null;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get ownerAvatarId() : int
      {
         return this.var_2302;
      }
      
      public function get ownerAvatarName() : String
      {
         return this.var_2303;
      }
      
      public function get flatId() : int
      {
         return this.var_360;
      }
      
      public function get eventType() : int
      {
         return this.var_2304;
      }
      
      public function get eventName() : String
      {
         return this.var_2059;
      }
      
      public function get eventDescription() : String
      {
         return this.var_2306;
      }
      
      public function get creationTime() : String
      {
         return this.var_2305;
      }
      
      public function get tags() : Array
      {
         return this.var_817;
      }
      
      public function get exists() : Boolean
      {
         return this.var_1197;
      }
   }
}
