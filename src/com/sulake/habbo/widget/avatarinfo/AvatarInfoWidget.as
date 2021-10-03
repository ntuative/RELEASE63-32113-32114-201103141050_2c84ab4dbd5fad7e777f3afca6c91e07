package com.sulake.habbo.widget.avatarinfo
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.room.object.RoomObjectTypeEnum;
   import com.sulake.habbo.widget.RoomWidgetBase;
   import com.sulake.habbo.widget.events.RoomWidgetAvatarInfoEvent;
   import com.sulake.habbo.widget.events.RoomWidgetFurniInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetPetInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomEngineUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomObjectUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserDataUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserLocationUpdateEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetGetUserLocationMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetRoomObjectMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.events.IEventDispatcher;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class AvatarInfoWidget extends RoomWidgetBase implements IUpdateReceiver
   {
       
      
      private var _component:Component;
      
      private var var_16:AvatarInfoView;
      
      private var var_189:Boolean = false;
      
      private var var_1620:Boolean = false;
      
      private var var_1065:Timer;
      
      private var var_2816:int = 3000;
      
      private var var_1313:Boolean;
      
      private var var_858:Boolean;
      
      private var var_699:Number;
      
      private var var_1314:int;
      
      private var var_2815:int = 500;
      
      public function AvatarInfoWidget(param1:IHabboWindowManager, param2:IAssetLibrary, param3:IHabboLocalizationManager, param4:Component)
      {
         super(param1,param2,param3);
         this._component = param4;
         this.var_1313 = false;
         this.var_858 = false;
         this.var_1065 = new Timer(this.var_2816,1);
         this.var_1065.addEventListener(TimerEvent.TIMER_COMPLETE,this.onTimerComplete);
      }
      
      private function onTimerComplete(param1:TimerEvent) : void
      {
         this.var_858 = true;
         this.var_1314 = 0;
      }
      
      private function getOwnCharacterInfo() : void
      {
         messageListener.processWidgetMessage(new RoomWidgetRoomObjectMessage(RoomWidgetRoomObjectMessage.const_741,0,0));
      }
      
      override public function dispose() : void
      {
         if(disposed)
         {
            return;
         }
         if(this._component)
         {
            this._component.removeUpdateReceiver(this);
            this._component = null;
         }
         if(this.var_16)
         {
            this.var_16.dispose();
            this.var_16 = null;
         }
         super.dispose();
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(!param1)
         {
            return;
         }
         param1.addEventListener(RoomWidgetAvatarInfoEvent.const_123,this.updateEventHandler);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.const_115,this.updateEventHandler);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.const_136,this.updateEventHandler);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_139,this.updateEventHandler);
         param1.addEventListener(RoomWidgetFurniInfoUpdateEvent.const_313,this.updateEventHandler);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.BOT,this.updateEventHandler);
         param1.addEventListener(RoomWidgetPetInfoUpdateEvent.const_105,this.updateEventHandler);
         param1.addEventListener(RoomWidgetUserDataUpdateEvent.const_122,this.updateEventHandler);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_168,this.updateEventHandler);
         param1.addEventListener(RoomWidgetRoomEngineUpdateEvent.const_90,this.updateEventHandler);
         param1.addEventListener(RoomWidgetRoomEngineUpdateEvent.const_406,this.updateEventHandler);
         super.registerUpdateEvents(param1);
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetAvatarInfoEvent.const_123,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.const_115,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.const_136,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_139,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetFurniInfoUpdateEvent.const_313,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.BOT,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetPetInfoUpdateEvent.const_105,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetUserDataUpdateEvent.const_122,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_168,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetRoomEngineUpdateEvent.const_90,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetRoomEngineUpdateEvent.const_406,this.updateEventHandler);
      }
      
      private function updateEventHandler(param1:RoomWidgetUpdateEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         switch(param1.type)
         {
            case RoomWidgetAvatarInfoEvent.const_123:
               _loc2_ = param1 as RoomWidgetAvatarInfoEvent;
               this.updateView(_loc2_.userId,_loc2_.userName,_loc2_.roomIndex,RoomObjectTypeEnum.const_189,_loc2_.allowNameChange);
               this.var_189 = true;
               break;
            case RoomWidgetRoomObjectUpdateEvent.const_139:
            case RoomWidgetFurniInfoUpdateEvent.const_313:
               this.removeView();
               break;
            case RoomWidgetUserInfoUpdateEvent.const_115:
               this.getOwnCharacterInfo();
               break;
            case RoomWidgetUserInfoUpdateEvent.const_136:
               _loc3_ = param1 as RoomWidgetUserInfoUpdateEvent;
               this.updateView(_loc3_.webID,_loc3_.name,_loc3_.userRoomId,RoomObjectTypeEnum.const_189);
               break;
            case RoomWidgetUserInfoUpdateEvent.BOT:
               _loc4_ = param1 as RoomWidgetUserInfoUpdateEvent;
               this.updateView(_loc4_.webID,_loc4_.name,_loc4_.userRoomId,RoomObjectTypeEnum.const_872);
               break;
            case RoomWidgetPetInfoUpdateEvent.const_105:
               _loc5_ = param1 as RoomWidgetPetInfoUpdateEvent;
               this.updateView(_loc5_.id,_loc5_.name,_loc5_.roomIndex,RoomObjectTypeEnum.const_196);
               break;
            case RoomWidgetUserDataUpdateEvent.const_122:
               if(!this.var_189)
               {
                  this.getOwnCharacterInfo();
               }
               break;
            case RoomWidgetRoomObjectUpdateEvent.const_168:
               _loc6_ = param1 as RoomWidgetRoomObjectUpdateEvent;
               if(this.var_16 && this.var_16.roomIndex == _loc6_.id)
               {
                  this.disposeView();
               }
               break;
            case RoomWidgetRoomEngineUpdateEvent.const_90:
               this.var_1620 = false;
               break;
            case RoomWidgetRoomEngineUpdateEvent.const_406:
               this.var_1620 = true;
         }
         this.checkUpdateNeed();
      }
      
      private function updateView(param1:int, param2:String, param3:int, param4:int, param5:Boolean = false) : void
      {
         this.var_858 = false;
         if(this.var_1065.running)
         {
            this.var_1065.stop();
         }
         if(this.var_16 == null || this.var_16.userId != param1 || this.var_16.userName != param2 || this.var_16.roomIndex != param3 || this.var_16.userType != param4)
         {
            if(this.var_16)
            {
               this.disposeView();
            }
            if(!this.var_1620)
            {
               this.var_16 = new AvatarInfoView(this,param1,param2,param3,param4,param5);
            }
         }
      }
      
      public function disposeView() : void
      {
         if(this.var_16)
         {
            this.var_16.dispose();
            this.var_16 = null;
            this.var_1313 = true;
            this.var_858 = false;
         }
      }
      
      private function removeView() : void
      {
         if(!this.var_1313)
         {
            this.var_1313 = true;
            this.var_1065.start();
         }
         else if(!this.var_858)
         {
            this.disposeView();
         }
      }
      
      public function checkUpdateNeed() : void
      {
         if(!this._component)
         {
            return;
         }
         if(this.var_16)
         {
            this._component.registerUpdateReceiver(this,10);
         }
         else
         {
            this._component.removeUpdateReceiver(this);
         }
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:* = null;
         if(!this.var_16)
         {
            return;
         }
         _loc2_ = messageListener.processWidgetMessage(new RoomWidgetGetUserLocationMessage(this.var_16.userId,this.var_16.userType)) as RoomWidgetUserLocationUpdateEvent;
         if(!_loc2_)
         {
            return;
         }
         if(this.var_858)
         {
            this.var_1314 += param1;
            this.var_699 = 1 - this.var_1314 / Number(this.var_2815);
         }
         else
         {
            this.var_699 = 1;
         }
         if(this.var_699 <= 0)
         {
            this.disposeView();
            return;
         }
         this.var_16.update(_loc2_.rectangle,this.var_699);
         this.checkUpdateNeed();
      }
   }
}
