package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class GuestRoomData implements IDisposable
   {
       
      
      private var var_360:int;
      
      private var var_730:Boolean;
      
      private var var_842:String;
      
      private var _ownerName:String;
      
      private var var_2149:int;
      
      private var var_2183:int;
      
      private var var_2543:int;
      
      private var var_1695:String;
      
      private var var_2542:int;
      
      private var var_2338:Boolean;
      
      private var var_677:int;
      
      private var var_1489:int;
      
      private var var_2541:String;
      
      private var var_817:Array;
      
      private var var_2540:RoomThumbnailData;
      
      private var var_2148:Boolean;
      
      private var _disposed:Boolean;
      
      public function GuestRoomData(param1:IMessageDataWrapper)
      {
         var _loc4_:* = null;
         this.var_817 = new Array();
         super();
         this.var_360 = param1.readInteger();
         this.var_730 = param1.readBoolean();
         this.var_842 = param1.readString();
         this._ownerName = param1.readString();
         this.var_2149 = param1.readInteger();
         this.var_2183 = param1.readInteger();
         this.var_2543 = param1.readInteger();
         this.var_1695 = param1.readString();
         this.var_2542 = param1.readInteger();
         this.var_2338 = param1.readBoolean();
         this.var_677 = param1.readInteger();
         this.var_1489 = param1.readInteger();
         this.var_2541 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readString();
            this.var_817.push(_loc4_);
            _loc3_++;
         }
         this.var_2540 = new RoomThumbnailData(param1);
         this.var_2148 = param1.readBoolean();
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
      
      public function get flatId() : int
      {
         return this.var_360;
      }
      
      public function get event() : Boolean
      {
         return this.var_730;
      }
      
      public function get roomName() : String
      {
         return this.var_842;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get doorMode() : int
      {
         return this.var_2149;
      }
      
      public function get userCount() : int
      {
         return this.var_2183;
      }
      
      public function get maxUserCount() : int
      {
         return this.var_2543;
      }
      
      public function get description() : String
      {
         return this.var_1695;
      }
      
      public function get srchSpecPrm() : int
      {
         return this.var_2542;
      }
      
      public function get allowTrading() : Boolean
      {
         return this.var_2338;
      }
      
      public function get score() : int
      {
         return this.var_677;
      }
      
      public function get categoryId() : int
      {
         return this.var_1489;
      }
      
      public function get eventCreationTime() : String
      {
         return this.var_2541;
      }
      
      public function get tags() : Array
      {
         return this.var_817;
      }
      
      public function get thumbnail() : RoomThumbnailData
      {
         return this.var_2540;
      }
      
      public function get allowPets() : Boolean
      {
         return this.var_2148;
      }
   }
}
