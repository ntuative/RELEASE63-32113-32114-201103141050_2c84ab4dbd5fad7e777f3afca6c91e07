package com.sulake.habbo.help
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.help.cfh.data.CallForHelpData;
   import com.sulake.habbo.help.cfh.data.UserRegistry;
   import com.sulake.habbo.help.enum.HabboHelpViewEnum;
   import com.sulake.habbo.help.help.HelpUI;
   import com.sulake.habbo.help.help.data.FaqIndex;
   import com.sulake.habbo.help.hotelmerge.HotelMergeUI;
   import com.sulake.habbo.help.tutorial.TutorialUI;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.session.IRoomSessionManager;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.session.events.RoomSessionEvent;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarSetIconEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDHabboRoomSessionManager;
   import com.sulake.iid.IIDHabboToolbar;
   import com.sulake.iid.IIDSessionDataManager;
   import flash.utils.Dictionary;
   import iid.IIDHabboWindowManager;
   
   public class HabboHelp extends Component implements IHabboHelp
   {
       
      
      private var var_187:IHabboToolbar;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_319:IHabboCommunicationManager;
      
      private var var_1006:IHabboLocalizationManager;
      
      private var var_808:IHabboConfigurationManager;
      
      private var var_290:ISessionDataManager;
      
      private var var_1241:FaqIndex;
      
      private var var_1436:IncomingMessages;
      
      private var var_66:HelpUI;
      
      private var var_106:TutorialUI;
      
      private var var_809:HotelMergeUI;
      
      private var var_1508:CallForHelpData;
      
      private var var_2759:UserRegistry;
      
      private var var_2383:String = "";
      
      private var var_655:WelcomeScreenController;
      
      public function HabboHelp(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         this.var_1508 = new CallForHelpData();
         this.var_2759 = new UserRegistry();
         super(param1,param2,param3);
         this._assetLibrary = param3;
         this.var_1241 = new FaqIndex();
         queueInterface(new IIDHabboWindowManager(),this.onWindowManagerReady);
         queueInterface(new IIDSessionDataManager(),this.onSessionDataManagerReady);
      }
      
      public function set ownUserName(param1:String) : void
      {
         this.var_2383 = param1;
      }
      
      public function get ownUserName() : String
      {
         return this.var_2383;
      }
      
      public function get callForHelpData() : CallForHelpData
      {
         return this.var_1508;
      }
      
      public function get userRegistry() : UserRegistry
      {
         return this.var_2759;
      }
      
      public function get localization() : IHabboLocalizationManager
      {
         return this.var_1006;
      }
      
      public function get windowManager() : IHabboWindowManager
      {
         return this._windowManager;
      }
      
      public function get toolbar() : IHabboToolbar
      {
         return this.var_187;
      }
      
      public function get sessionDataManager() : ISessionDataManager
      {
         return this.var_290;
      }
      
      public function get tutorialUI() : TutorialUI
      {
         return this.var_106;
      }
      
      public function get hotelMergeUI() : HotelMergeUI
      {
         return this.var_809;
      }
      
      public function hasChangedName() : Boolean
      {
         if(this.var_106)
         {
            return this.var_106.hasChangedName;
         }
         return true;
      }
      
      override public function dispose() : void
      {
         if(this.var_66 != null)
         {
            this.var_66.dispose();
            this.var_66 = null;
         }
         if(this.var_106 != null)
         {
            this.var_106.dispose();
            this.var_106 = null;
         }
         if(this.var_809)
         {
            this.var_809.dispose();
            this.var_809 = null;
         }
         if(this.var_1241 != null)
         {
            this.var_1241.dispose();
            this.var_1241 = null;
         }
         this.var_1436 = null;
         if(this.var_187)
         {
            this.var_187.release(new IIDHabboToolbar());
            this.var_187 = null;
         }
         if(this.var_1006)
         {
            this.var_1006.release(new IIDHabboLocalizationManager());
            this.var_1006 = null;
         }
         if(this.var_319)
         {
            this.var_319.release(new IIDHabboCommunicationManager());
            this.var_319 = null;
         }
         if(this.var_808)
         {
            this.var_808.release(new IIDHabboConfigurationManager());
            this.var_808 = null;
         }
         if(this._windowManager)
         {
            this._windowManager.release(new IIDHabboWindowManager());
            this._windowManager = null;
         }
         if(this.var_290 != null)
         {
            this.var_290.release(new IIDSessionDataManager());
            this.var_290 = null;
         }
         if(this.var_655 != null)
         {
            this.var_655.dispose();
            this.var_655 = null;
         }
         super.dispose();
      }
      
      public function showUI(param1:String = null) : void
      {
         if(this.var_66 != null)
         {
            this.var_66.showUI(param1);
         }
      }
      
      public function hideUI() : void
      {
         if(this.var_66 != null)
         {
            this.var_66.hideUI();
         }
      }
      
      public function tellUI(param1:String, param2:* = null) : void
      {
         if(this.var_66 != null)
         {
            this.var_66.tellUI(param1,param2);
         }
      }
      
      public function enableCallForGuideBotUI() : void
      {
         if(this.var_66 != null)
         {
            this.var_66.updateCallForGuideBotUI(true);
         }
      }
      
      public function disableCallForGuideBotUI() : void
      {
         if(this.var_66 != null)
         {
            this.var_66.updateCallForGuideBotUI(false);
         }
      }
      
      public function getFaq() : FaqIndex
      {
         return this.var_1241;
      }
      
      public function sendMessage(param1:IMessageComposer) : void
      {
         if(this.var_319 != null && param1 != null)
         {
            this.var_319.getHabboMainConnection(null).send(param1);
         }
      }
      
      public function getConfigurationKey(param1:String, param2:String = null, param3:Dictionary = null) : String
      {
         if(this.var_808 == null)
         {
            return param1;
         }
         return this.var_808.getKey(param1,param2,param3);
      }
      
      public function showCallForHelpReply(param1:String) : void
      {
         if(this.var_66 != null)
         {
            this.var_66.showCallForHelpReply(param1);
         }
      }
      
      public function showCallForHelpResult(param1:String) : void
      {
         if(this.var_66 != null)
         {
            this.var_66.showCallForHelpResult(param1);
         }
      }
      
      public function reportUser(param1:int, param2:String) : void
      {
         this.var_1508.reportedUserId = param1;
         this.var_1508.reportedUserName = param2;
         this.var_66.showUI(HabboHelpViewEnum.const_339);
      }
      
      private function toggleHelpUI() : void
      {
         if(this.var_66 == null)
         {
            if(!this.createHelpUI())
            {
               return;
            }
         }
         this.var_66.toggleUI();
      }
      
      private function createHelpUI() : Boolean
      {
         if(this.var_66 == null && this._assetLibrary != null && this._windowManager != null)
         {
            this.var_66 = new HelpUI(this,this._assetLibrary,this._windowManager,this.var_1006,this.var_187);
         }
         return this.var_66 != null;
      }
      
      private function createTutorialUI() : Boolean
      {
         var _loc1_:* = false;
         if(this.var_106 == null && this._assetLibrary != null && this._windowManager != null)
         {
            _loc1_ = this.getConfigurationKey("avatar.widget.enabled","0") == "0";
            this.var_106 = new TutorialUI(this,_loc1_);
         }
         return this.var_106 != null;
      }
      
      public function removeTutorialUI() : void
      {
         if(this.var_106 != null)
         {
            this.var_106.dispose();
            this.var_106 = null;
         }
      }
      
      public function initHotelMergeUI() : void
      {
         if(!this.var_809)
         {
            this.var_809 = new HotelMergeUI(this);
         }
         this.var_809.startNameChange();
      }
      
      public function updateTutorial(param1:Boolean, param2:Boolean, param3:Boolean) : void
      {
         if(param1 && param2 && param3)
         {
            this.removeTutorialUI();
            return;
         }
         if(this.var_106 == null)
         {
            if(!this.createTutorialUI())
            {
               return;
            }
         }
         this.var_106.update(param1,param2,param3);
      }
      
      public function startNameChange() : void
      {
         if(this.var_106)
         {
            this.var_106.showView(TutorialUI.const_299);
         }
      }
      
      private function onWindowManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this._windowManager = IHabboWindowManager(param2);
         queueInterface(new IIDHabboCommunicationManager(),this.onCommunicationManagerReady);
      }
      
      private function onCommunicationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this.var_319 = IHabboCommunicationManager(param2);
         this.var_1436 = new IncomingMessages(this,this.var_319);
         queueInterface(new IIDHabboToolbar(),this.onToolbarReady);
      }
      
      private function onToolbarReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this.var_187 = IHabboToolbar(param2);
         queueInterface(new IIDHabboLocalizationManager(),this.onLocalizationManagerReady);
      }
      
      private function onLocalizationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this.var_1006 = IHabboLocalizationManager(param2);
         queueInterface(new IIDHabboConfigurationManager(),this.onConfigurationManagerReady);
      }
      
      private function onConfigurationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this.var_808 = IHabboConfigurationManager(param2);
         queueInterface(new IIDHabboRoomSessionManager(),this.onRoomSessionManagerReady);
      }
      
      private function onRoomSessionManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var _loc3_:IRoomSessionManager = IRoomSessionManager(param2);
         _loc3_.events.addEventListener(RoomSessionEvent.const_92,this.onRoomSessionEvent);
         _loc3_.events.addEventListener(RoomSessionEvent.const_101,this.onRoomSessionEvent);
         this.var_187.events.addEventListener(HabboToolbarEvent.const_71,this.onHabboToolbarEvent);
         this.var_187.events.addEventListener(HabboToolbarEvent.const_37,this.onHabboToolbarEvent);
         this.createHelpUI();
         this.setHabboToolbarIcon();
      }
      
      private function onSessionDataManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this.var_290 = param2 as ISessionDataManager;
      }
      
      private function onRoomSessionEvent(param1:RoomSessionEvent) : void
      {
         switch(param1.type)
         {
            case RoomSessionEvent.const_92:
               if(this.var_66 != null)
               {
                  this.var_66.setRoomSessionStatus(true);
               }
               if(this.var_106 != null)
               {
                  this.var_106.setRoomSessionStatus(true);
               }
               this.showWelcomeScreen(true);
               break;
            case RoomSessionEvent.const_101:
               if(this.var_66 != null)
               {
                  this.var_66.setRoomSessionStatus(false);
               }
               if(this.var_106 != null)
               {
                  this.var_106.setRoomSessionStatus(false);
               }
               this.userRegistry.unregisterRoom();
               this.showWelcomeScreen(false);
         }
      }
      
      private function showWelcomeScreen(param1:Boolean) : void
      {
         if(!this.var_655)
         {
            this.var_655 = new WelcomeScreenController(this,this._windowManager,this.var_808);
         }
         this.var_655.showWelcomeScreen(param1);
      }
      
      private function setHabboToolbarIcon() : void
      {
         if(this.var_187 != null)
         {
            this.var_187.events.dispatchEvent(new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_132,HabboToolbarIconEnum.HELP));
         }
      }
      
      private function onHabboToolbarEvent(param1:HabboToolbarEvent) : void
      {
         if(param1.type == HabboToolbarEvent.const_71)
         {
            this.setHabboToolbarIcon();
            return;
         }
         if(param1.type == HabboToolbarEvent.const_37)
         {
            if(param1.iconId == HabboToolbarIconEnum.HELP)
            {
               this.toggleHelpUI();
               return;
            }
         }
      }
      
      public function setWelcomeScreenCategory(param1:String, param2:String = "", param3:String = "") : void
      {
         if(!this.var_655)
         {
            this.showWelcomeScreen(true);
         }
         this.var_655.setCategory(param1,param2,param3);
      }
   }
}
