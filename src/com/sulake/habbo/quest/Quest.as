package com.sulake.habbo.quest
{
   import com.sulake.core.assets.AssetLoaderStruct;
   import com.sulake.core.assets.loaders.AssetLoaderEvent;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.quest.QuestMessageData;
   import com.sulake.habbo.quest.enum.QuestStatusEnum;
   import flash.events.Event;
   
   public class Quest implements IDisposable
   {
       
      
      private var var_16:IWindowContainer;
      
      private var _region:IRegionWindow;
      
      private var var_58:QuestCampaign;
      
      private var _id:int;
      
      private var var_388:int;
      
      private var _type:String;
      
      private var var_1601:String;
      
      private var var_1598:int;
      
      private var var_1733:Date;
      
      private var var_682:String;
      
      private var var_2176:String;
      
      private var var_207:Boolean = false;
      
      private var var_1372:uint = 7645971;
      
      private var var_1732:uint = 6710886;
      
      private var var_205:IWindow;
      
      private var var_688:Boolean = false;
      
      public function Quest(param1:QuestMessageData, param2:QuestCampaign)
      {
         super();
         this.var_58 = param2;
         this._id = param1.id;
         this.update(param1);
      }
      
      public function dispose() : void
      {
         if(this._region)
         {
            this._region.removeEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.itemGridEventProc);
            this._region.removeEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,this.itemGridEventProc);
            this._region.removeEventListener(WindowMouseEvent.const_25,this.itemGridEventProc);
         }
         if(this.var_16)
         {
            this.var_16.dispose();
            this.var_16 = null;
         }
         this.var_688 = true;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_688;
      }
      
      public function update(param1:QuestMessageData) : void
      {
         this.var_388 = param1.status;
         this._type = param1.type;
         this.var_1601 = param1.roomItemTypeName;
         this.var_1598 = param1.rewardCurrencyAmount;
         this.var_1733 = new Date();
         this.var_1733.setTime(param1.endDateTimeStamp);
         this.var_682 = param1.localizationCode;
         this.var_2176 = param1.questBadgeAchievementTypeId;
         this.updateView();
      }
      
      private function createView() : void
      {
         switch(this.var_388)
         {
            case QuestStatusEnum.const_47:
               this.var_16 = this.var_58.controller.questEngine.getXmlWindow("QuestEntityAccepted") as IWindowContainer;
               break;
            case QuestStatusEnum.const_571:
               this.var_16 = this.var_58.controller.questEngine.getXmlWindow("QuestEntityAvailable") as IWindowContainer;
               break;
            case QuestStatusEnum.const_202:
               this.var_16 = this.var_58.controller.questEngine.getXmlWindow("QuestEntityExpired") as IWindowContainer;
               break;
            case QuestStatusEnum.const_874:
               this.var_16 = this.var_58.controller.questEngine.getXmlWindow("QuestEntityCompleted") as IWindowContainer;
               break;
            case QuestStatusEnum.const_191:
               this.var_16 = this.var_58.controller.questEngine.getXmlWindow("QuestEntityPreview") as IWindowContainer;
               break;
            default:
               this.var_16 = this.var_58.controller.questEngine.getXmlWindow("QuestEntityExpired") as IWindowContainer;
         }
         if(!this.var_16)
         {
            return;
         }
         this._region = this.var_16.findChildByName("mouse.region") as IRegionWindow;
         this._region.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.itemGridEventProc);
         this._region.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,this.itemGridEventProc);
         this._region.addEventListener(WindowMouseEvent.const_25,this.itemGridEventProc);
         var _loc1_:IWindow = this.var_16.findChildByTag("SELECTION_COLOR");
         if(_loc1_ != null)
         {
            this.var_1372 = _loc1_.color;
         }
         var _loc2_:IWindow = this.var_16.findChildByTag("SELECTION_BORDER");
         if(_loc2_ != null)
         {
            this.var_1732 = _loc2_.color;
            this.var_205 = _loc2_;
         }
         else
         {
            this.var_205 = this.var_16;
         }
         this.var_205.color = this.var_1372;
      }
      
      private function updateView() : void
      {
         var _loc2_:* = null;
         if(this.var_16 == null)
         {
            this.createView();
         }
         var _loc1_:IBitmapWrapperWindow = this.find(this.var_16,"icon") as IBitmapWrapperWindow;
         switch(this.var_388)
         {
            case QuestStatusEnum.const_47:
               _loc2_ = ["icon",this.var_58.code,"active"].join("_");
               this.var_58.controller.questEngine.setImageFromAsset(_loc1_,_loc2_,this.onPreviewImageReady);
               break;
            case QuestStatusEnum.const_571:
               break;
            case QuestStatusEnum.const_202:
               break;
            case QuestStatusEnum.const_874:
               this.var_58.controller.questEngine.setImageFromAsset(_loc1_,"icon_complete",this.onPreviewImageReady);
         }
         var _loc3_:String = ["quest",this.var_58.code,this.var_682].join("_");
         var _loc4_:* = _loc3_ + ".title";
         var _loc5_:* = _loc3_ + ".short";
         this.setText("quest.title",_loc4_);
         this.setText("quest.short",_loc5_);
      }
      
      public function get endDate() : Date
      {
         return this.var_1733;
      }
      
      private function itemGridEventProc(param1:Event, param2:IWindow = null) : void
      {
         if(param2 == null)
         {
            param2 = param1.target as IWindow;
         }
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            this.var_58.activateListItem(this);
         }
         else if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            if(!this.var_207)
            {
               this.var_205.color = this.var_1732;
            }
         }
         else if(param1.type == WindowMouseEvent.const_25)
         {
            if(!this.var_207)
            {
               this.var_205.color = this.var_1372;
            }
         }
      }
      
      public function get selected() : Boolean
      {
         return this.var_207;
      }
      
      public function set selected(param1:Boolean) : void
      {
         this.var_207 = param1;
         if(this.var_207)
         {
            this.var_205.color = this.var_1732;
         }
         else
         {
            this.var_205.color = this.var_1372;
         }
      }
      
      private function setText(param1:String, param2:String, param3:Boolean = true) : void
      {
         var _loc4_:IWindow = this.var_16.findChildByName(param1);
         if(_loc4_)
         {
            if(param3)
            {
               param2 = "${" + param2 + "}";
            }
            _loc4_.caption = param2;
         }
      }
      
      private function setVisible(param1:String, param2:Boolean) : void
      {
         var _loc3_:IWindow = this.var_16.findChildByName(param1);
         if(_loc3_)
         {
            _loc3_.visible = param2;
         }
      }
      
      private function find(param1:IWindowContainer, param2:String) : IWindow
      {
         var _loc3_:IWindow = param1.findChildByName(param2);
         if(_loc3_ == null)
         {
            throw new Error("Window element with name: " + param2 + " cannot be found!");
         }
         return _loc3_;
      }
      
      private function onPreviewImageReady(param1:AssetLoaderEvent) : void
      {
         var _loc3_:* = null;
         if(this.var_688)
         {
            return;
         }
         var _loc2_:AssetLoaderStruct = param1.target as AssetLoaderStruct;
         if(_loc2_ != null)
         {
            _loc3_ = this.find(this.var_16,"icon") as IBitmapWrapperWindow;
            this.var_58.controller.questEngine.setImageFromAsset(_loc3_,_loc2_.assetName,this.onPreviewImageReady);
         }
      }
      
      public function get view() : IWindowContainer
      {
         return this.var_16;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get status() : int
      {
         return this.var_388;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get roomItemTypeName() : String
      {
         return this.var_1601;
      }
      
      public function get rewardCurrencyAmount() : int
      {
         return this.var_1598;
      }
      
      public function get localizationCode() : String
      {
         return this.var_682;
      }
      
      public function get questBadgeAchievementTypeId() : String
      {
         return this.var_2176;
      }
   }
}
