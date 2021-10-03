package com.sulake.habbo.room.object.logic.furniture
{
   import com.sulake.habbo.room.events.RoomObjectRoomAdEvent;
   import com.sulake.habbo.room.events.RoomObjectStateChangeEvent;
   import com.sulake.habbo.room.messages.RoomObjectDataUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectItemDataUpdateMessage;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.habbo.room.object.logic.MovingObjectLogic;
   import com.sulake.room.events.RoomObjectEvent;
   import com.sulake.room.events.RoomObjectMouseEvent;
   import com.sulake.room.events.RoomSpriteMouseEvent;
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   import com.sulake.room.object.IRoomObjectModelController;
   import com.sulake.room.utils.IRoomGeometry;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   import com.sulake.room.utils.XMLValidator;
   import flash.events.MouseEvent;
   
   public class FurnitureLogic extends MovingObjectLogic
   {
       
      
      private var var_1084:Boolean = false;
      
      private var var_488:Number = 0.0;
      
      private var var_588:Number = 0.0;
      
      private var var_1329:Number = 0.0;
      
      private var var_2290:Number = 0.0;
      
      private var var_2289:Number = 0.0;
      
      private var var_1652:Number = 0.0;
      
      private var var_271:Array;
      
      public function FurnitureLogic()
      {
         this.var_271 = [];
         super();
      }
      
      override public function dispose() : void
      {
         super.dispose();
         this.var_271 = null;
      }
      
      override public function initialize(param1:XML) : void
      {
         var _loc7_:* = null;
         var _loc8_:int = 0;
         if(param1 == null)
         {
            return;
         }
         this.var_488 = 0;
         this.var_588 = 0;
         this.var_1329 = 0;
         this.var_271 = [];
         var _loc2_:XMLList = param1.model.dimensions;
         if(_loc2_.length() == 0)
         {
            return;
         }
         var _loc3_:XMLList = _loc2_.@x;
         if(_loc3_.length() == 1)
         {
            this.var_488 = Number(_loc3_);
         }
         _loc3_ = _loc2_.@y;
         if(_loc3_.length() == 1)
         {
            this.var_588 = Number(_loc3_);
         }
         _loc3_ = _loc2_.@z;
         if(_loc3_.length() == 1)
         {
            this.var_1329 = Number(_loc3_);
         }
         this.var_2290 = this.var_488 / 2;
         this.var_2289 = this.var_588 / 2;
         _loc3_ = _loc2_.@centerZ;
         if(_loc3_.length() == 1)
         {
            this.var_1652 = Number(_loc3_);
         }
         else
         {
            this.var_1652 = this.var_1329 / 2;
         }
         var _loc4_:XMLList = param1.model.directions.direction;
         var _loc5_:* = ["id"];
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_.length())
         {
            _loc7_ = _loc4_[_loc6_];
            if(XMLValidator.checkRequiredAttributes(_loc7_,_loc5_))
            {
               _loc8_ = parseInt(_loc7_.@id);
               this.var_271.push(_loc8_);
            }
            _loc6_++;
         }
         this.var_271.sort(Array.NUMERIC);
         if(object == null || object.getModelController() == null)
         {
            return;
         }
         object.getModelController().setNumber(RoomObjectVariableEnum.const_304,this.var_488,true);
         object.getModelController().setNumber(RoomObjectVariableEnum.const_372,this.var_588,true);
         object.getModelController().setNumber(RoomObjectVariableEnum.const_628,this.var_1329,true);
         object.getModelController().setNumber(RoomObjectVariableEnum.const_1487,this.var_2290,true);
         object.getModelController().setNumber(RoomObjectVariableEnum.const_1621,this.var_2289,true);
         object.getModelController().setNumber(RoomObjectVariableEnum.const_1230,this.var_1652,true);
         object.getModelController().setNumberArray(RoomObjectVariableEnum.const_706,this.var_271,true);
         object.getModelController().setNumber(RoomObjectVariableEnum.const_314,1);
      }
      
      override public function mouseEvent(param1:RoomSpriteMouseEvent, param2:IRoomGeometry) : void
      {
         var _loc6_:int = 0;
         var _loc7_:* = null;
         var _loc8_:* = null;
         if(param1 == null || param2 == null)
         {
            return;
         }
         if(object == null)
         {
            return;
         }
         var _loc3_:IRoomObjectModelController = object.getModel() as IRoomObjectModelController;
         if(_loc3_ == null)
         {
            return;
         }
         var _loc9_:String = _loc3_.getString(RoomObjectVariableEnum.const_381);
         switch(param1.type)
         {
            case MouseEvent.ROLL_OVER:
               if(!this.var_1084)
               {
                  _loc6_ = object.getId();
                  _loc7_ = object.getType();
                  if(eventDispatcher != null && _loc9_ != null && _loc9_.indexOf("http") == 0)
                  {
                     eventDispatcher.dispatchEvent(new RoomObjectRoomAdEvent(RoomObjectRoomAdEvent.const_356,_loc6_,_loc7_));
                  }
                  this.var_1084 = true;
               }
               break;
            case MouseEvent.ROLL_OUT:
               if(this.var_1084)
               {
                  _loc6_ = object.getId();
                  _loc7_ = object.getType();
                  if(eventDispatcher != null && _loc9_ != null && _loc9_.indexOf("http") == 0)
                  {
                     eventDispatcher.dispatchEvent(new RoomObjectRoomAdEvent(RoomObjectRoomAdEvent.const_383,_loc6_,_loc7_));
                  }
                  this.var_1084 = false;
               }
               break;
            case MouseEvent.DOUBLE_CLICK:
               _loc6_ = object.getId();
               _loc7_ = object.getType();
               if(eventDispatcher != null && _loc9_ != null && _loc9_.indexOf("http") == 0)
               {
                  eventDispatcher.dispatchEvent(new RoomObjectRoomAdEvent(RoomObjectRoomAdEvent.const_424,_loc6_,_loc7_));
               }
               if(eventDispatcher != null)
               {
                  eventDispatcher.dispatchEvent(new RoomObjectStateChangeEvent(RoomObjectStateChangeEvent.const_157,_loc6_,_loc7_));
               }
               break;
            case MouseEvent.CLICK:
               _loc6_ = object.getId();
               _loc7_ = object.getType();
               if(eventDispatcher != null)
               {
                  _loc8_ = new RoomObjectMouseEvent(RoomObjectMouseEvent.const_227,param1.eventId,_loc6_,_loc7_,param1.altKey,param1.ctrlKey,param1.shiftKey,param1.buttonDown);
                  eventDispatcher.dispatchEvent(_loc8_);
               }
               if(eventDispatcher != null && _loc9_ != null && _loc9_.indexOf("http") == 0)
               {
                  eventDispatcher.dispatchEvent(new RoomObjectRoomAdEvent(RoomObjectRoomAdEvent.const_301,_loc6_,_loc7_));
               }
               break;
            case MouseEvent.MOUSE_DOWN:
               _loc6_ = object.getId();
               _loc7_ = object.getType();
               if(eventDispatcher != null)
               {
                  _loc8_ = new RoomObjectMouseEvent(RoomObjectMouseEvent.const_569,param1.eventId,_loc6_,_loc7_,param1.altKey,param1.ctrlKey,param1.shiftKey,param1.buttonDown);
                  eventDispatcher.dispatchEvent(_loc8_);
               }
         }
      }
      
      override public function processUpdateMessage(param1:RoomObjectUpdateMessage) : void
      {
         var _loc2_:IRoomObjectModelController = object.getModelController();
         var _loc3_:RoomObjectDataUpdateMessage = param1 as RoomObjectDataUpdateMessage;
         if(_loc3_ != null)
         {
            object.setState(_loc3_.state,0);
            if(_loc2_ != null)
            {
               _loc2_.setString(RoomObjectVariableEnum.const_85,_loc3_.data);
               if(!isNaN(_loc3_.extra))
               {
                  _loc2_.setString(RoomObjectVariableEnum.const_558,String(_loc3_.extra));
               }
               _loc2_.setNumber(RoomObjectVariableEnum.const_733,lastUpdateTime);
            }
            return;
         }
         var _loc4_:RoomObjectItemDataUpdateMessage = param1 as RoomObjectItemDataUpdateMessage;
         if(_loc4_ != null)
         {
            if(_loc2_ != null)
            {
               _loc2_.setString(RoomObjectVariableEnum.const_1164,_loc4_.itemData);
            }
            return;
         }
         this.var_1084 = false;
         super.processUpdateMessage(param1);
      }
   }
}
