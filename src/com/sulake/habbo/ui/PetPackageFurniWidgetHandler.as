package com.sulake.habbo.ui
{
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.IPetImageListener;
   import com.sulake.habbo.avatar.enum.AvatarScaleType;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.avatar.pets.IPetData;
   import com.sulake.habbo.avatar.pets.IPetDataListener;
   import com.sulake.habbo.room.IGetImageListener;
   import com.sulake.habbo.room.ImageResult;
   import com.sulake.habbo.session.events.RoomSessionPetPackageEvent;
   import com.sulake.habbo.widget.RoomWidgetEnum;
   import com.sulake.habbo.widget.events.RoomWidgetPetPackageUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUpdateEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetOpenPetPackageMessage;
   import com.sulake.room.utils.Vector3d;
   import flash.display.BitmapData;
   import flash.events.Event;
   
   public class PetPackageFurniWidgetHandler implements IRoomWidgetHandler, IPetImageListener, IPetDataListener, IGetImageListener
   {
       
      
      private var var_688:Boolean = false;
      
      private var _container:IRoomWidgetHandlerContainer = null;
      
      private var var_333:int = -1;
      
      private var var_1201:int = -1;
      
      private var var_1534:int = -1;
      
      private var _color:String = "";
      
      public function PetPackageFurniWidgetHandler()
      {
         super();
      }
      
      public function get type() : String
      {
         return RoomWidgetEnum.const_579;
      }
      
      public function set container(param1:IRoomWidgetHandlerContainer) : void
      {
         this._container = param1;
      }
      
      public function getWidgetMessages() : Array
      {
         return [RoomWidgetOpenPetPackageMessage.const_801];
      }
      
      public function processWidgetMessage(param1:RoomWidgetMessage) : RoomWidgetUpdateEvent
      {
         var _loc2_:* = null;
         switch(param1.type)
         {
            case RoomWidgetOpenPetPackageMessage.const_801:
               _loc2_ = param1 as RoomWidgetOpenPetPackageMessage;
               if(this._container != null && this._container.roomSession != null)
               {
                  this._container.roomSession.sendOpenPetPackageMessage(_loc2_.objectId,_loc2_.name);
               }
         }
         return null;
      }
      
      public function getProcessedEvents() : Array
      {
         return [RoomSessionPetPackageEvent.const_506,RoomSessionPetPackageEvent.const_493];
      }
      
      public function processEvent(param1:Event) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:int = 0;
         if(param1 == null)
         {
            return;
         }
         if(this._container != null && this._container.events != null && param1 != null)
         {
            switch(param1.type)
            {
               case RoomSessionPetPackageEvent.const_506:
                  _loc2_ = param1 as RoomSessionPetPackageEvent;
                  this.var_333 = _loc2_.objectId;
                  this.var_1201 = _loc2_.petType;
                  this.var_1534 = _loc2_.breed;
                  this._color = _loc2_.color;
                  _loc4_ = this._container.avatarRenderManager.petDataManager.getPetData(this.var_1201,this);
                  _loc5_ = this.getPetImage();
                  _loc3_ = new RoomWidgetPetPackageUpdateEvent(RoomWidgetPetPackageUpdateEvent.const_559,this.var_333,_loc5_,-1);
                  this._container.events.dispatchEvent(_loc3_);
                  break;
               case RoomSessionPetPackageEvent.const_493:
                  _loc2_ = param1 as RoomSessionPetPackageEvent;
                  this.var_333 = _loc2_.objectId;
                  _loc6_ = _loc2_.nameValidationStatus;
                  _loc3_ = new RoomWidgetPetPackageUpdateEvent(RoomWidgetPetPackageUpdateEvent.const_550,this.var_333,null,_loc6_);
                  this._container.events.dispatchEvent(_loc3_);
            }
         }
      }
      
      public function update() : void
      {
      }
      
      public function dispose() : void
      {
         this.var_688 = true;
         this._container = null;
         this.var_333 = -1;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_688;
      }
      
      public function petImageReady(param1:String) : void
      {
         var _loc2_:BitmapData = this.getPetImage();
         var _loc3_:RoomWidgetPetPackageUpdateEvent = new RoomWidgetPetPackageUpdateEvent(RoomWidgetPetPackageUpdateEvent.const_362,this.var_333,_loc2_,-1);
         this._container.events.dispatchEvent(_loc3_);
      }
      
      public function imageReady(param1:int, param2:BitmapData) : void
      {
         var _loc3_:RoomWidgetPetPackageUpdateEvent = new RoomWidgetPetPackageUpdateEvent(RoomWidgetPetPackageUpdateEvent.const_362,this.var_333,param2,-1);
         this._container.events.dispatchEvent(_loc3_);
      }
      
      public function petDataReady() : void
      {
         this.petImageReady("");
      }
      
      private function getPetImage() : BitmapData
      {
         var _loc1_:* = 0;
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         if(this.var_1201 < 8)
         {
            _loc1_ = uint(parseInt(this._color,16));
            _loc2_ = this._container.avatarRenderManager.createPetImage(this.var_1201,this.var_1534,_loc1_,AvatarScaleType.const_57,this);
            if(_loc2_ != null)
            {
               return _loc2_.getCroppedImage(AvatarSetType.const_36);
            }
         }
         else
         {
            _loc3_ = 0;
            _loc4_ = this._container.roomEngine.getPetImage(this.var_1201,this.var_1534,new Vector3d(90),64,this,_loc3_);
            if(_loc4_ != null)
            {
               return _loc4_.data;
            }
         }
         return null;
      }
   }
}
