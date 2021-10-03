package com.sulake.habbo.ui
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.advertisement.IAdManager;
   import com.sulake.habbo.advertisement.events.AdEvent;
   import com.sulake.habbo.avatar.IAvatarRenderManager;
   import com.sulake.habbo.avatar.IHabboAvatarEditor;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.friendlist.IHabboFriendList;
   import com.sulake.habbo.help.IHabboHelp;
   import com.sulake.habbo.inventory.IHabboInventory;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.moderation.IHabboModeration;
   import com.sulake.habbo.navigator.IHabboNavigator;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.room.events.RoomEngineDimmerStateEvent;
   import com.sulake.habbo.room.events.RoomEngineEvent;
   import com.sulake.habbo.room.events.RoomEngineObjectEvent;
   import com.sulake.habbo.room.events.RoomEngineRoomColorEvent;
   import com.sulake.habbo.roomevents.IHabboUserDefinedRoomEvents;
   import com.sulake.habbo.session.IRoomSession;
   import com.sulake.habbo.session.IRoomSessionManager;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.session.events.RoomSessionChatEvent;
   import com.sulake.habbo.session.events.RoomSessionDimmerPresetsEvent;
   import com.sulake.habbo.session.events.RoomSessionDoorbellEvent;
   import com.sulake.habbo.session.events.RoomSessionErrorMessageEvent;
   import com.sulake.habbo.session.events.RoomSessionEvent;
   import com.sulake.habbo.session.events.RoomSessionFriendRequestEvent;
   import com.sulake.habbo.session.events.RoomSessionPetPackageEvent;
   import com.sulake.habbo.session.events.RoomSessionPollEvent;
   import com.sulake.habbo.session.events.RoomSessionPresentEvent;
   import com.sulake.habbo.session.events.RoomSessionQueueEvent;
   import com.sulake.habbo.session.events.RoomSessionUserBadgesEvent;
   import com.sulake.habbo.session.events.RoomSessionUserDataUpdateEvent;
   import com.sulake.habbo.session.events.RoomSessionUserGivableBadgesEvent;
   import com.sulake.habbo.session.events.RoomSessionUserNotificationEvent;
   import com.sulake.habbo.session.events.RoomSessionViralFurniStatusEvent;
   import com.sulake.habbo.session.events.RoomSessionVoteEvent;
   import com.sulake.habbo.sound.IHabboSoundManager;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.toolbar.events.HabboToolbarSetIconEvent;
   import com.sulake.habbo.tracking.IHabboTracking;
   import com.sulake.habbo.widget.IRoomWidgetFactory;
   import com.sulake.habbo.widget.RoomWidgetEnum;
   import com.sulake.habbo.widget.messages.RoomWidgetMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import com.sulake.iid.IIDAvatarRenderManager;
   import com.sulake.iid.IIDHabboAdManager;
   import com.sulake.iid.IIDHabboAvatarEditor;
   import com.sulake.iid.IIDHabboCatalog;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboFriendList;
   import com.sulake.iid.IIDHabboHelp;
   import com.sulake.iid.IIDHabboInventory;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDHabboModeration;
   import com.sulake.iid.IIDHabboNavigator;
   import com.sulake.iid.IIDHabboRoomSessionManager;
   import com.sulake.iid.IIDHabboRoomWidget;
   import com.sulake.iid.IIDHabboSoundManager;
   import com.sulake.iid.IIDHabboToolbar;
   import com.sulake.iid.IIDHabboTracking;
   import com.sulake.iid.IIDHabboUserDefinedRoomEvents;
   import com.sulake.iid.IIDRoomEngine;
   import com.sulake.iid.IIDSessionDataManager;
   import flash.events.Event;
   import iid.IIDHabboWindowManager;
   
   public class RoomUI extends Component implements IRoomUI, IUpdateReceiver
   {
       
      
      private var _windowManager:IHabboWindowManager;
      
      private var _roomEngine:IRoomEngine;
      
      private var var_15:IRoomSessionManager;
      
      private var var_1129:IRoomWidgetFactory;
      
      private var var_290:ISessionDataManager;
      
      private var _friendList:IHabboFriendList;
      
      private var var_508:IAvatarRenderManager;
      
      private var _inventory:IHabboInventory;
      
      private var var_187:IHabboToolbar;
      
      private var _navigator:IHabboNavigator;
      
      private var var_1731:IHabboAvatarEditor = null;
      
      private var _catalog:IHabboCatalog;
      
      private var var_296:IAdManager;
      
      private var _localization:IHabboLocalizationManager;
      
      private var var_1094:IHabboHelp;
      
      private var var_911:IHabboModeration;
      
      private var _config:IHabboConfigurationManager;
      
      private var var_517:IHabboSoundManager;
      
      private var var_297:Map;
      
      private var var_1371:int;
      
      private var _connection:IConnection;
      
      private var _habboTracking:IHabboTracking;
      
      private var var_1130:IHabboUserDefinedRoomEvents;
      
      public function RoomUI(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         this.var_1371 = RoomDesktop.const_497;
         super(param1,param2,param3);
         queueInterface(new IIDHabboWindowManager(),this.onWindowManagerReady);
         queueInterface(new IIDRoomEngine(),this.onRoomEngineReady);
         queueInterface(new IIDHabboRoomSessionManager(),this.onRoomSessionManagerReady);
         queueInterface(new IIDHabboRoomWidget(),this.onRoomWidgetFactoryReady);
         queueInterface(new IIDSessionDataManager(),this.onSessionDataManagerReady);
         queueInterface(new IIDHabboFriendList(),this.onFriendListReady);
         queueInterface(new IIDAvatarRenderManager(),this.onAvatarRenderManagerReady);
         queueInterface(new IIDHabboInventory(),this.onInventoryReady);
         queueInterface(new IIDHabboToolbar(),this.onToolbarReady);
         queueInterface(new IIDHabboNavigator(),this.onNavigatorReady);
         queueInterface(new IIDHabboAvatarEditor(),this.onAvatarEditorReady);
         queueInterface(new IIDHabboCatalog(),this.onCatalogReady);
         queueInterface(new IIDHabboAdManager(),this.onAdManagerReady);
         queueInterface(new IIDHabboLocalizationManager(),this.onLocalizationManagerReady);
         queueInterface(new IIDHabboHelp(),this.onHabboHelpReady);
         queueInterface(new IIDHabboModeration(),this.onHabboModerationReady);
         queueInterface(new IIDHabboConfigurationManager(),this.onConfigurationManagerReady);
         queueInterface(new IIDHabboSoundManager(),this.onSoundManagerReady);
         queueInterface(new IIDHabboCommunicationManager(),this.onCommunicationReady);
         queueInterface(new IIDHabboUserDefinedRoomEvents(),this.onUserDefinedRoomEventsReady);
         this._habboTracking = IHabboTracking(queueInterface(new IIDHabboTracking()));
         this.var_297 = new Map();
         registerUpdateReceiver(this,0);
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(this._windowManager != null)
         {
            this._windowManager.release(new IIDHabboWindowManager());
            this._windowManager = null;
         }
         if(this._roomEngine != null)
         {
            this._roomEngine.release(new IIDRoomEngine());
            this._roomEngine = null;
         }
         if(this.var_15 != null)
         {
            this.var_15.release(new IIDHabboRoomSessionManager());
            this.var_15 = null;
         }
         if(this.var_1129 != null)
         {
            this.var_1129.release(new IIDHabboRoomWidget());
            this.var_1129 = null;
         }
         if(this._inventory != null)
         {
            this._inventory.release(new IIDHabboInventory());
            this._inventory = null;
         }
         if(this.var_187 != null)
         {
            this.var_187.release(new IIDHabboToolbar());
            this.var_187 = null;
         }
         if(this._config != null)
         {
            this._config.release(new IIDHabboConfigurationManager());
            this._config = null;
         }
         if(this.var_517 != null)
         {
            this.var_517.release(new IIDHabboSoundManager());
            this.var_517 = null;
         }
         if(this.var_296 != null)
         {
            this.var_296.release(new IIDHabboAdManager());
            this.var_296 = null;
         }
         if(this.var_508 != null)
         {
            this.var_508.release(new IIDAvatarRenderManager());
            this.var_508 = null;
         }
         if(this._catalog != null)
         {
            this._catalog.release(new IIDHabboCatalog());
            this._catalog = null;
         }
         if(this._friendList != null)
         {
            this._friendList.release(new IIDHabboFriendList());
            this._friendList = null;
         }
         if(this.var_1094 != null)
         {
            this.var_1094.release(new IIDHabboHelp());
            this.var_1094 = null;
         }
         if(this._localization != null)
         {
            this._localization.release(new IIDHabboLocalizationManager());
            this._localization = null;
         }
         if(this.var_911 != null)
         {
            this.var_911.release(new IIDHabboModeration());
            this.var_911 = null;
         }
         if(this._navigator != null)
         {
            this._navigator.release(new IIDHabboNavigator());
            this._navigator = null;
         }
         if(this.var_290 != null)
         {
            this.var_290.release(new IIDSessionDataManager());
            this.var_290 = null;
         }
         if(this._habboTracking)
         {
            this._habboTracking.release(new IIDHabboTracking());
            this._habboTracking = null;
         }
         if(this.var_1130)
         {
            this.var_1130.release(new IIDHabboUserDefinedRoomEvents());
            this.var_1130 = null;
         }
         this.var_1731 = null;
         this._connection = null;
         if(this.var_297)
         {
            while(this.var_297.length > 0)
            {
               _loc1_ = this.var_297.getKey(0) as String;
               _loc2_ = this.var_297.remove(_loc1_) as RoomDesktop;
               if(_loc2_ != null)
               {
                  _loc2_.dispose();
               }
            }
            this.var_297.dispose();
            this.var_297 = null;
         }
         removeUpdateReceiver(this);
         super.dispose();
      }
      
      private function onWindowManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this._windowManager = param2 as IHabboWindowManager;
      }
      
      private function onRoomWidgetFactoryReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this.var_1129 = param2 as IRoomWidgetFactory;
      }
      
      private function onRoomSessionManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this.var_15 = param2 as IRoomSessionManager;
         this.registerSessionEvents();
         if(this.var_15 != null && this._roomEngine != null && this._roomEngine.isInitialized)
         {
            this.var_15.roomEngineReady = true;
         }
      }
      
      private function onSessionDataManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this.var_290 = param2 as ISessionDataManager;
      }
      
      private function onFriendListReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this._friendList = param2 as IHabboFriendList;
      }
      
      private function onAvatarRenderManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this.var_508 = param2 as IAvatarRenderManager;
      }
      
      private function onInventoryReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this._inventory = param2 as IHabboInventory;
      }
      
      private function onToolbarReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this.var_187 = param2 as IHabboToolbar;
      }
      
      private function onNavigatorReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this._navigator = param2 as IHabboNavigator;
      }
      
      private function onAvatarEditorReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this.var_1731 = param2 as IHabboAvatarEditor;
      }
      
      private function onCatalogReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this._catalog = param2 as IHabboCatalog;
      }
      
      private function onAdManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this.var_296 = param2 as IAdManager;
         if(this.var_296 != null && this.var_296.events != null)
         {
            this.var_296.events.addEventListener(AdEvent.const_560,this.adEventHandler);
            this.var_296.events.addEventListener(AdEvent.const_549,this.adEventHandler);
            this.var_296.events.addEventListener(AdEvent.const_542,this.adEventHandler);
         }
      }
      
      private function onLocalizationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this._localization = param2 as IHabboLocalizationManager;
      }
      
      private function onHabboHelpReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this.var_1094 = param2 as IHabboHelp;
      }
      
      private function onHabboModerationReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this.var_911 = param2 as IHabboModeration;
         Logger.log("XXXX GOT HABBO MODERATION: " + this.var_911);
      }
      
      private function onConfigurationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this._config = param2 as IHabboConfigurationManager;
      }
      
      private function onSoundManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this.var_517 = param2 as IHabboSoundManager;
      }
      
      private function registerSessionEvents() : void
      {
         if(this.var_15)
         {
            this.var_15.events.addEventListener(RoomSessionEvent.const_216,this.roomSessionStateEventHandler);
            this.var_15.events.addEventListener(RoomSessionEvent.const_92,this.roomSessionStateEventHandler);
            this.var_15.events.addEventListener(RoomSessionEvent.const_101,this.roomSessionStateEventHandler);
            this.var_15.events.addEventListener(RoomSessionChatEvent.const_174,this.roomSessionEventHandler);
            this.var_15.events.addEventListener(RoomSessionChatEvent.const_531,this.roomSessionEventHandler);
            this.var_15.events.addEventListener(RoomSessionUserBadgesEvent.const_66,this.roomSessionEventHandler);
            this.var_15.events.addEventListener(RoomSessionUserGivableBadgesEvent.const_66,this.roomSessionEventHandler);
            this.var_15.events.addEventListener(RoomSessionDoorbellEvent.const_113,this.roomSessionEventHandler);
            this.var_15.events.addEventListener(RoomSessionDoorbellEvent.const_152,this.roomSessionEventHandler);
            this.var_15.events.addEventListener(RoomSessionDoorbellEvent.const_47,this.roomSessionEventHandler);
            this.var_15.events.addEventListener(RoomSessionPresentEvent.const_320,this.roomSessionEventHandler);
            this.var_15.events.addEventListener(RoomSessionPetPackageEvent.const_506,this.roomSessionEventHandler);
            this.var_15.events.addEventListener(RoomSessionPetPackageEvent.const_493,this.roomSessionEventHandler);
            this.var_15.events.addEventListener(RoomSessionViralFurniStatusEvent.const_465,this.roomSessionEventHandler);
            this.var_15.events.addEventListener(RoomSessionViralFurniStatusEvent.const_489,this.roomSessionEventHandler);
            this.var_15.events.addEventListener(RoomSessionErrorMessageEvent.const_269,this.roomSessionDialogEventHandler);
            this.var_15.events.addEventListener(RoomSessionErrorMessageEvent.const_221,this.roomSessionDialogEventHandler);
            this.var_15.events.addEventListener(RoomSessionErrorMessageEvent.const_626,this.roomSessionDialogEventHandler);
            this.var_15.events.addEventListener(RoomSessionErrorMessageEvent.const_987,this.roomSessionDialogEventHandler);
            this.var_15.events.addEventListener(RoomSessionErrorMessageEvent.const_1119,this.roomSessionDialogEventHandler);
            this.var_15.events.addEventListener(RoomSessionErrorMessageEvent.const_233,this.roomSessionDialogEventHandler);
            this.var_15.events.addEventListener(RoomSessionErrorMessageEvent.const_220,this.roomSessionDialogEventHandler);
            this.var_15.events.addEventListener(RoomSessionErrorMessageEvent.const_264,this.roomSessionDialogEventHandler);
            this.var_15.events.addEventListener(RoomSessionErrorMessageEvent.const_263,this.roomSessionDialogEventHandler);
            this.var_15.events.addEventListener(RoomSessionErrorMessageEvent.const_231,this.roomSessionDialogEventHandler);
            this.var_15.events.addEventListener(RoomSessionErrorMessageEvent.const_271,this.roomSessionDialogEventHandler);
            this.var_15.events.addEventListener(RoomSessionErrorMessageEvent.const_240,this.roomSessionDialogEventHandler);
            this.var_15.events.addEventListener(RoomSessionErrorMessageEvent.const_730,this.roomSessionDialogEventHandler);
            this.var_15.events.addEventListener(RoomSessionErrorMessageEvent.const_734,this.roomSessionDialogEventHandler);
            this.var_15.events.addEventListener(RoomSessionErrorMessageEvent.const_195,this.roomSessionDialogEventHandler);
            this.var_15.events.addEventListener(RoomSessionErrorMessageEvent.const_711,this.roomSessionDialogEventHandler);
            this.var_15.events.addEventListener(RoomSessionErrorMessageEvent.const_721,this.roomSessionDialogEventHandler);
            this.var_15.events.addEventListener(RoomSessionQueueEvent.const_468,this.roomSessionEventHandler);
            this.var_15.events.addEventListener(RoomSessionVoteEvent.const_138,this.roomSessionEventHandler);
            this.var_15.events.addEventListener(RoomSessionVoteEvent.const_145,this.roomSessionEventHandler);
            this.var_15.events.addEventListener(RoomSessionPollEvent.const_133,this.roomSessionEventHandler);
            this.var_15.events.addEventListener(RoomSessionPollEvent.const_68,this.roomSessionEventHandler);
            this.var_15.events.addEventListener(RoomSessionPollEvent.const_130,this.roomSessionEventHandler);
            this.var_15.events.addEventListener(RoomSessionDimmerPresetsEvent.const_535,this.roomSessionEventHandler);
            this.var_15.events.addEventListener(RoomSessionFriendRequestEvent.const_141,this.roomSessionEventHandler);
            this.var_15.events.addEventListener(RoomSessionUserNotificationEvent.const_118,this.roomSessionEventHandler);
            this.var_15.events.addEventListener(RoomSessionUserDataUpdateEvent.const_122,this.roomSessionEventHandler);
         }
      }
      
      private function roomSessionStateEventHandler(param1:RoomSessionEvent) : void
      {
         var _loc2_:* = null;
         if(this._roomEngine == null)
         {
            return;
         }
         switch(param1.type)
         {
            case RoomSessionEvent.const_216:
               _loc2_ = this.createDesktop(param1.session);
               break;
            case RoomSessionEvent.const_92:
               break;
            case RoomSessionEvent.const_101:
               if(param1.session != null)
               {
                  this.disposeDesktop(this.getRoomIdentifier(param1.session.roomId,param1.session.roomCategory));
                  this.var_187.events.dispatchEvent(new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_144,HabboToolbarIconEnum.ZOOM));
                  this.var_187.events.dispatchEvent(new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_144,HabboToolbarIconEnum.MEMENU));
                  this.var_187.events.dispatchEvent(new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_144,HabboToolbarIconEnum.INVENTORY));
               }
         }
      }
      
      private function roomSessionEventHandler(param1:RoomSessionEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(this._roomEngine == null)
         {
            return;
         }
         if(param1.session != null)
         {
            _loc2_ = this.getRoomIdentifier(param1.session.roomId,param1.session.roomCategory);
            _loc3_ = this.getDesktop(_loc2_);
            if(_loc3_ != null)
            {
               _loc3_.processEvent(param1);
            }
         }
      }
      
      private function roomSessionDialogEventHandler(param1:RoomSessionEvent) : void
      {
         var errorMessage:String = null;
         var event:RoomSessionEvent = param1;
         var errorTitle:String = "${error.title}";
         switch(event.type)
         {
            case RoomSessionErrorMessageEvent.const_269:
               errorMessage = "${room.error.cant_trade_stuff}";
               break;
            case RoomSessionErrorMessageEvent.const_221:
               errorMessage = "${room.error.cant_set_item}";
               break;
            case RoomSessionErrorMessageEvent.const_626:
               errorMessage = "${room.error.cant_set_not_owner}";
               break;
            case RoomSessionErrorMessageEvent.const_233:
               errorMessage = "${room.error.max_furniture}";
               break;
            case RoomSessionErrorMessageEvent.const_195:
               errorMessage = "${room.error.max_pets}";
               break;
            case RoomSessionErrorMessageEvent.const_220:
               errorMessage = "${room.error.max_queuetiles}";
               break;
            case RoomSessionErrorMessageEvent.const_264:
               errorMessage = "${room.error.max_soundfurni}";
               break;
            case RoomSessionErrorMessageEvent.const_263:
               errorMessage = "${room.error.max_stickies}";
               break;
            case RoomSessionErrorMessageEvent.const_231:
               errorMessage = "${room.error.kicked}";
               errorTitle = "${generic.alert.title}";
               break;
            case RoomSessionErrorMessageEvent.const_240:
               errorMessage = "${room.error.guide.not.available}";
               break;
            case RoomSessionErrorMessageEvent.const_271:
               errorMessage = "${room.error.guide.already.exists}";
               break;
            case RoomSessionErrorMessageEvent.const_730:
               errorMessage = "${room.error.pets.forbidden_in_hotel}";
               break;
            case RoomSessionErrorMessageEvent.const_734:
               errorMessage = "${room.error.pets.forbidden_in_flat}";
               break;
            case RoomSessionErrorMessageEvent.const_711:
               errorMessage = "${room.error.pets.no_free_tiles}";
               break;
            case RoomSessionErrorMessageEvent.const_721:
               errorMessage = "${room.error.pets.selected_tile_not_free}";
               break;
            default:
               return;
         }
         this._windowManager.alert(errorTitle,errorMessage,0,function(param1:IAlertDialog, param2:Event):void
         {
            param1.dispose();
         });
      }
      
      private function adEventHandler(param1:AdEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:String = this.getRoomIdentifier(param1.roomId,param1.roomCategory);
         var _loc3_:RoomDesktop = this.getDesktop(_loc2_) as RoomDesktop;
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.processEvent(param1);
      }
      
      private function onRoomEngineReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this._roomEngine = param2 as IRoomEngine;
         this.initializeRoomEngineEvents();
         if(this.var_15 != null && this._roomEngine != null && this._roomEngine.isInitialized)
         {
            this.var_15.roomEngineReady = true;
         }
      }
      
      private function onCommunicationReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         var _loc3_:IHabboCommunicationManager = param2 as IHabboCommunicationManager;
         if(_loc3_ != null)
         {
            this._connection = _loc3_.getHabboMainConnection(this.onConnectionReady);
            if(this._connection != null)
            {
               this.onConnectionReady(this._connection);
            }
         }
      }
      
      private function onUserDefinedRoomEventsReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this.var_1130 = param2 as IHabboUserDefinedRoomEvents;
      }
      
      private function onConnectionReady(param1:IConnection) : void
      {
         if(disposed)
         {
            return;
         }
         if(param1 != null)
         {
            this._connection = param1;
         }
      }
      
      private function initializeRoomEngineEvents() : void
      {
         if(this._roomEngine != null && this._roomEngine.events != null)
         {
            this._roomEngine.events.addEventListener(RoomEngineEvent.const_699,this.roomEngineEventHandler);
            this._roomEngine.events.addEventListener(RoomEngineEvent.const_749,this.roomEventHandler);
            this._roomEngine.events.addEventListener(RoomEngineEvent.const_809,this.roomEventHandler);
            this._roomEngine.events.addEventListener(RoomEngineEvent.ROOM_ENGINE_NORMAL_MODE,this.roomEngineEventHandler);
            this._roomEngine.events.addEventListener(RoomEngineEvent.const_551,this.roomEngineEventHandler);
            this._roomEngine.events.addEventListener(RoomEngineDimmerStateEvent.const_63,this.roomEventHandler);
            this._roomEngine.events.addEventListener(RoomEngineRoomColorEvent.const_787,this.roomEventHandler);
            this._roomEngine.events.addEventListener(RoomEngineObjectEvent.const_864,this.method_1);
            this._roomEngine.events.addEventListener(RoomEngineObjectEvent.const_442,this.method_1);
            this._roomEngine.events.addEventListener(RoomEngineObjectEvent.const_328,this.method_1);
            this._roomEngine.events.addEventListener(RoomEngineObjectEvent.const_818,this.method_1);
            this._roomEngine.events.addEventListener(RoomEngineObjectEvent.const_218,this.method_1);
            this._roomEngine.events.addEventListener(RoomEngineObjectEvent.const_643,this.method_1);
            this._roomEngine.events.addEventListener(RoomEngineObjectEvent.ROOM_OBJECT_WIDGET_REQUEST_CREDITFURNI,this.method_1);
            this._roomEngine.events.addEventListener(RoomEngineObjectEvent.const_127,this.method_1);
            this._roomEngine.events.addEventListener(RoomEngineObjectEvent.const_148,this.method_1);
            this._roomEngine.events.addEventListener(RoomEngineObjectEvent.const_129,this.method_1);
            this._roomEngine.events.addEventListener(RoomEngineObjectEvent.const_143,this.method_1);
            this._roomEngine.events.addEventListener(RoomEngineObjectEvent.ROOM_OBJECT_WIDGET_REQUEST_ECOTRONBOX,this.method_1);
            this._roomEngine.events.addEventListener(RoomEngineObjectEvent.const_149,this.method_1);
            this._roomEngine.events.addEventListener(RoomEngineObjectEvent.const_140,this.method_1);
            this._roomEngine.events.addEventListener(RoomEngineObjectEvent.const_540,this.method_1);
            this._roomEngine.events.addEventListener(RoomEngineObjectEvent.const_463,this.method_1);
            this._roomEngine.events.addEventListener(RoomEngineObjectEvent.const_583,this.method_1);
            this._roomEngine.events.addEventListener(RoomEngineObjectEvent.const_514,this.method_1);
            this._roomEngine.events.addEventListener(RoomEngineObjectEvent.const_109,this.method_1);
            this._roomEngine.events.addEventListener(RoomEngineObjectEvent.const_135,this.method_1);
         }
      }
      
      private function roomEngineEventHandler(param1:RoomEngineEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(param1 == null)
         {
            return;
         }
         if(param1.type == RoomEngineEvent.const_699)
         {
            if(this.var_15 != null)
            {
               this.var_15.roomEngineReady = true;
            }
         }
         else if(param1.type == RoomEngineEvent.const_551 || param1.type == RoomEngineEvent.ROOM_ENGINE_NORMAL_MODE)
         {
            _loc2_ = this.getRoomIdentifier(param1.roomId,param1.roomCategory);
            _loc3_ = this.getDesktop(_loc2_) as RoomDesktop;
            if(_loc3_ == null)
            {
               return;
            }
            _loc3_.roomEngineEventHandler(param1);
         }
      }
      
      private function roomEventHandler(param1:RoomEngineEvent) : void
      {
         var _loc4_:* = null;
         var _loc5_:Boolean = false;
         var _loc6_:* = null;
         var _loc7_:* = null;
         if(param1 == null)
         {
            return;
         }
         if(this._roomEngine == null)
         {
            return;
         }
         var _loc2_:String = this.getRoomIdentifier(param1.roomId,param1.roomCategory);
         var _loc3_:RoomDesktop = this.getDesktop(_loc2_) as RoomDesktop;
         if(_loc3_ == null)
         {
            if(this.var_15 == null)
            {
               return;
            }
            _loc4_ = this.var_15.getSession(param1.roomId,param1.roomCategory);
            if(_loc4_ != null)
            {
               _loc3_ = this.createDesktop(_loc4_) as RoomDesktop;
            }
         }
         if(_loc3_ == null)
         {
            return;
         }
         switch(param1.type)
         {
            case RoomEngineEvent.const_749:
               _loc5_ = false;
               _loc3_.createRoomView(this.getActiveCanvasId(param1.roomId,param1.roomCategory));
               if(this._roomEngine != null)
               {
                  this._roomEngine.setActiveRoom(param1.roomId,param1.roomCategory);
                  if(!this._roomEngine.isPublicRoomWorldType(this._roomEngine.getWorldType(param1.roomId,param1.roomCategory)))
                  {
                     _loc7_ = new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_91,HabboToolbarIconEnum.ZOOM);
                     _loc7_.iconState = "2";
                     this.var_187.events.dispatchEvent(_loc7_);
                  }
                  else
                  {
                     _loc5_ = true;
                  }
               }
               _loc3_.createWidget(RoomWidgetEnum.const_371);
               _loc3_.createWidget(RoomWidgetEnum.const_475);
               if(!_loc3_.session.isSpectatorMode)
               {
                  _loc3_.createWidget(RoomWidgetEnum.const_564);
                  _loc3_.createWidget(RoomWidgetEnum.CHAT_INPUT_WIDGET);
                  _loc3_.createWidget(RoomWidgetEnum.const_141);
               }
               _loc3_.createWidget(RoomWidgetEnum.const_723);
               _loc3_.createWidget(RoomWidgetEnum.const_507);
               _loc3_.createWidget(RoomWidgetEnum.const_438);
               _loc3_.createWidget(RoomWidgetEnum.const_451);
               _loc3_.createWidget(RoomWidgetEnum.const_581);
               _loc3_.createWidget(RoomWidgetEnum.const_527);
               _loc3_.createWidget(RoomWidgetEnum.const_443);
               _loc3_.createWidget(RoomWidgetEnum.const_579);
               _loc3_.createWidget(RoomWidgetEnum.const_113);
               _loc3_.createWidget(RoomWidgetEnum.const_378);
               _loc3_.createWidget(RoomWidgetEnum.const_124);
               _loc3_.createWidget(RoomWidgetEnum.const_471);
               _loc3_.createWidget(RoomWidgetEnum.const_572);
               _loc3_.createWidget(RoomWidgetEnum.const_665);
               _loc3_.createWidget(RoomWidgetEnum.const_118);
               _loc3_.createWidget(RoomWidgetEnum.const_533);
               if(this._config.getKey("avatar.widget.enabled","0") == "1")
               {
                  _loc3_.createWidget(RoomWidgetEnum.const_123);
               }
               if(this._config.getKey("purse.widget.enabled","0") == "1")
               {
                  _loc3_.createWidget(RoomWidgetEnum.const_384);
                  _loc3_.method_5(RoomWidgetEnum.const_384);
               }
               if(!_loc5_)
               {
                  _loc3_.createWidget(RoomWidgetEnum.const_528);
               }
               _loc3_.createWidget(RoomWidgetEnum.const_290);
               if(this.var_1371 != RoomDesktop.const_497)
               {
                  _loc3_.method_5(RoomWidgetEnum.const_290,this.var_1371);
               }
               if(this.var_296 != null)
               {
                  this.var_296.showRoomAd();
               }
               break;
            case RoomEngineEvent.const_809:
               this.disposeDesktop(_loc2_);
               break;
            case RoomEngineRoomColorEvent.const_787:
               _loc6_ = param1 as RoomEngineRoomColorEvent;
               if(_loc6_ == null)
               {
                  break;
               }
               if(_loc6_.bgOnly)
               {
                  _loc3_.setRoomViewColor(16777215,255);
               }
               else
               {
                  _loc3_.setRoomViewColor(_loc6_.color,_loc6_.brightness);
               }
               break;
            case RoomEngineDimmerStateEvent.const_63:
               _loc3_.processEvent(param1);
         }
      }
      
      private function method_1(param1:RoomEngineObjectEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(this._roomEngine == null)
         {
            return;
         }
         var _loc2_:String = this.getRoomIdentifier(param1.roomId,param1.roomCategory);
         var _loc3_:RoomDesktop = this.getDesktop(_loc2_) as RoomDesktop;
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.method_1(param1);
      }
      
      public function processWidgetMessage(param1:int, param2:int, param3:RoomWidgetMessage) : void
      {
         if(param3 == null)
         {
            return;
         }
         if(this._roomEngine == null)
         {
            return;
         }
         var _loc4_:String = this.getRoomIdentifier(param1,param2);
         var _loc5_:RoomDesktop = this.getDesktop(_loc4_) as RoomDesktop;
         if(_loc5_ == null)
         {
            return;
         }
         _loc5_.processWidgetMessage(param3);
      }
      
      public function createDesktop(param1:IRoomSession) : IRoomDesktop
      {
         if(param1 == null)
         {
            return null;
         }
         if(this._roomEngine == null)
         {
            return null;
         }
         var _loc2_:String = this.getRoomIdentifier(param1.roomId,param1.roomCategory);
         var _loc3_:RoomDesktop = this.getDesktop(_loc2_) as RoomDesktop;
         if(_loc3_ != null)
         {
            return _loc3_;
         }
         _loc3_ = new RoomDesktop(param1,assets,this._connection);
         _loc3_.roomEngine = this._roomEngine;
         _loc3_.windowManager = this._windowManager;
         _loc3_.roomWidgetFactory = this.var_1129;
         _loc3_.sessionDataManager = this.var_290;
         _loc3_.roomSessionManager = this.var_15;
         _loc3_.friendList = this._friendList;
         _loc3_.avatarRenderManager = this.var_508;
         _loc3_.inventory = this._inventory;
         _loc3_.toolbar = this.var_187;
         _loc3_.navigator = this._navigator;
         _loc3_.avatarEditor = this.var_1731;
         _loc3_.catalog = this._catalog;
         _loc3_.adManager = this.var_296;
         _loc3_.localization = this._localization;
         _loc3_.habboHelp = this.var_1094;
         _loc3_.moderation = this.var_911;
         _loc3_.config = this._config;
         _loc3_.soundManager = this.var_517;
         _loc3_.habboTracking = this._habboTracking;
         _loc3_.userDefinedRoomEvents = this.var_1130;
         var _loc4_:XmlAsset = assets.getAssetByName("room_desktop_layout_xml") as XmlAsset;
         if(_loc4_ != null)
         {
            _loc3_.layout = _loc4_.content as XML;
         }
         _loc3_.createWidget(RoomWidgetEnum.const_446);
         _loc3_.createWidget(RoomWidgetEnum.const_648);
         _loc3_.init();
         this.var_297.add(_loc2_,_loc3_);
         return _loc3_;
      }
      
      public function disposeDesktop(param1:String) : void
      {
         var _loc3_:int = 0;
         var _loc2_:RoomDesktop = this.var_297.remove(param1) as RoomDesktop;
         if(_loc2_ != null)
         {
            _loc3_ = _loc2_.getWidgetState(RoomWidgetEnum.const_290);
            if(_loc3_ != RoomDesktop.const_497)
            {
               this.var_1371 = _loc3_;
            }
            _loc2_.dispose();
         }
      }
      
      public function getDesktop(param1:String) : IRoomDesktop
      {
         return this.var_297.getValue(param1) as RoomDesktop;
      }
      
      public function getActiveCanvasId(param1:int, param2:int) : int
      {
         return 1;
      }
      
      public function update(param1:uint) : void
      {
         var _loc3_:* = null;
         var _loc2_:int = 0;
         while(_loc2_ < this.var_297.length)
         {
            _loc3_ = this.var_297.getWithIndex(_loc2_) as RoomDesktop;
            if(_loc3_ != null)
            {
               _loc3_.update();
            }
            _loc2_++;
         }
      }
      
      private function getRoomIdentifier(param1:int, param2:int) : String
      {
         return "hard_coded_room_id";
      }
   }
}
