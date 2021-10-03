package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class OfficialRoomEntryData implements IDisposable
   {
      
      public static const const_1047:int = 1;
      
      public static const const_793:int = 2;
      
      public static const const_845:int = 3;
      
      public static const const_1425:int = 4;
       
      
      private var _index:int;
      
      private var var_2182:String;
      
      private var var_2181:String;
      
      private var var_2179:Boolean;
      
      private var var_2178:String;
      
      private var var_846:String;
      
      private var var_2184:int;
      
      private var var_2183:int;
      
      private var _type:int;
      
      private var var_2180:String;
      
      private var var_855:GuestRoomData;
      
      private var var_854:PublicRoomData;
      
      private var _open:Boolean;
      
      private var _disposed:Boolean;
      
      public function OfficialRoomEntryData(param1:IMessageDataWrapper)
      {
         super();
         this._index = param1.readInteger();
         this.var_2182 = param1.readString();
         this.var_2181 = param1.readString();
         this.var_2179 = param1.readInteger() == 1;
         this.var_2178 = param1.readString();
         this.var_846 = param1.readString();
         this.var_2184 = param1.readInteger();
         this.var_2183 = param1.readInteger();
         this._type = param1.readInteger();
         if(this._type == const_1047)
         {
            this.var_2180 = param1.readString();
         }
         else if(this._type == const_845)
         {
            this.var_854 = new PublicRoomData(param1);
         }
         else if(this._type == const_793)
         {
            this.var_855 = new GuestRoomData(param1);
         }
         else
         {
            this._open = param1.readBoolean();
         }
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         if(this.var_855 != null)
         {
            this.var_855.dispose();
            this.var_855 = null;
         }
         if(this.var_854 != null)
         {
            this.var_854.dispose();
            this.var_854 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get index() : int
      {
         return this._index;
      }
      
      public function get popupCaption() : String
      {
         return this.var_2182;
      }
      
      public function get popupDesc() : String
      {
         return this.var_2181;
      }
      
      public function get showDetails() : Boolean
      {
         return this.var_2179;
      }
      
      public function get picText() : String
      {
         return this.var_2178;
      }
      
      public function get picRef() : String
      {
         return this.var_846;
      }
      
      public function get folderId() : int
      {
         return this.var_2184;
      }
      
      public function get tag() : String
      {
         return this.var_2180;
      }
      
      public function get userCount() : int
      {
         return this.var_2183;
      }
      
      public function get guestRoomData() : GuestRoomData
      {
         return this.var_855;
      }
      
      public function get publicRoomData() : PublicRoomData
      {
         return this.var_854;
      }
      
      public function get open() : Boolean
      {
         return this._open;
      }
      
      public function toggleOpen() : void
      {
         this._open = !this._open;
      }
      
      public function get maxUsers() : int
      {
         if(this.type == const_1047)
         {
            return 0;
         }
         if(this.type == const_793)
         {
            return this.var_855.maxUserCount;
         }
         if(this.type == const_845)
         {
            return this.var_854.maxUsers;
         }
         return 0;
      }
   }
}
