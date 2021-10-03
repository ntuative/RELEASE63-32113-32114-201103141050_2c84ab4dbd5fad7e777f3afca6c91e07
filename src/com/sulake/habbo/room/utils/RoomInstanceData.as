package com.sulake.habbo.room.utils
{
   import com.sulake.core.utils.Map;
   
   public class RoomInstanceData
   {
       
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_686:TileHeightMap = null;
      
      private var var_1059:LegacyWallGeometry = null;
      
      private var var_1060:RoomCamera = null;
      
      private var var_687:SelectedRoomObjectData = null;
      
      private var var_685:SelectedRoomObjectData = null;
      
      private var var_2185:String = null;
      
      private var var_480:Map;
      
      public function RoomInstanceData(param1:int, param2:int)
      {
         this.var_480 = new Map();
         super();
         this._roomId = param1;
         this._roomCategory = param2;
         this.var_1059 = new LegacyWallGeometry();
         this.var_1060 = new RoomCamera();
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get roomCategory() : int
      {
         return this._roomCategory;
      }
      
      public function get tileHeightMap() : TileHeightMap
      {
         return this.var_686;
      }
      
      public function set tileHeightMap(param1:TileHeightMap) : void
      {
         if(this.var_686 != null)
         {
            this.var_686.dispose();
         }
         this.var_686 = param1;
      }
      
      public function get legacyGeometry() : LegacyWallGeometry
      {
         return this.var_1059;
      }
      
      public function get roomCamera() : RoomCamera
      {
         return this.var_1060;
      }
      
      public function get worldType() : String
      {
         return this.var_2185;
      }
      
      public function set worldType(param1:String) : void
      {
         this.var_2185 = param1;
      }
      
      public function get selectedObject() : SelectedRoomObjectData
      {
         return this.var_687;
      }
      
      public function set selectedObject(param1:SelectedRoomObjectData) : void
      {
         if(this.var_687 != null)
         {
            this.var_687.dispose();
         }
         this.var_687 = param1;
      }
      
      public function get placedObject() : SelectedRoomObjectData
      {
         return this.var_685;
      }
      
      public function set placedObject(param1:SelectedRoomObjectData) : void
      {
         if(this.var_685 != null)
         {
            this.var_685.dispose();
         }
         this.var_685 = param1;
      }
      
      public function dispose() : void
      {
         if(this.var_686 != null)
         {
            this.var_686.dispose();
            this.var_686 = null;
         }
         if(this.var_1059 != null)
         {
            this.var_1059.dispose();
            this.var_1059 = null;
         }
         if(this.var_1060 != null)
         {
            this.var_1060.dispose();
            this.var_1060 = null;
         }
         if(this.var_687 != null)
         {
            this.var_687.dispose();
            this.var_687 = null;
         }
         if(this.var_685 != null)
         {
            this.var_685.dispose();
            this.var_685 = null;
         }
         if(this.var_480 != null)
         {
            this.var_480.dispose();
            this.var_480 = null;
         }
      }
      
      public function addFurnitureData(param1:FurnitureData) : void
      {
         if(param1 != null)
         {
            this.var_480.remove(param1.id);
            this.var_480.add(param1.id,param1);
         }
      }
      
      public function getFurnitureData() : FurnitureData
      {
         if(this.var_480.length > 0)
         {
            return this.getFurnitureDataWithId(this.var_480.getKey(0));
         }
         return null;
      }
      
      public function getFurnitureDataWithId(param1:int) : FurnitureData
      {
         return this.var_480.remove(param1);
      }
   }
}
