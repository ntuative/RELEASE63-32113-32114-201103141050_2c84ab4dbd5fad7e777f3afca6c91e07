package com.sulake.habbo.inventory.furni
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.ICoreWindowManager;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IItemGridWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.inventory.items.GroupItem;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.window.IHabboWindowManager;
   
   public class FurniGridView
   {
       
      
      private var _windowManager:IHabboWindowManager;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var var_16:IWindowContainer;
      
      private var var_67:FurniModel;
      
      private var _roomEngine:IRoomEngine;
      
      private var _category:String;
      
      private var var_254:IItemGridWindow;
      
      private var var_2860:XML;
      
      private var var_583:Object;
      
      public function FurniGridView(param1:FurniModel, param2:String, param3:IHabboWindowManager, param4:IAssetLibrary, param5:IRoomEngine)
      {
         super();
         this.var_67 = param1;
         this._category = param2;
         this._assetLibrary = param4;
         this._windowManager = param3;
         this._roomEngine = param5;
         var _loc6_:IAsset = this._assetLibrary.getAssetByName("inventory_furni_grid_xml");
         var _loc7_:XmlAsset = XmlAsset(_loc6_);
         var _loc8_:ICoreWindowManager = ICoreWindowManager(this._windowManager);
         this.var_16 = IWindowContainer(_loc8_.buildFromXML(XML(_loc7_.content)));
         if(this.var_16 != null)
         {
            this.var_254 = this.var_16.findChildByName("item_grid") as IItemGridWindow;
         }
      }
      
      public function get window() : IWindowContainer
      {
         if(this.var_16 == null)
         {
            return null;
         }
         if(this.var_16.disposed)
         {
            return null;
         }
         return this.var_16;
      }
      
      public function clearGrid() : void
      {
         if(this.var_254 != null)
         {
            this.var_254.removeGridItems();
         }
      }
      
      public function initFromList() : void
      {
         var _loc3_:* = null;
         var _loc1_:Array = this.var_67.getCategoryContent(this._category);
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_.length)
         {
            _loc3_ = _loc1_[_loc2_] as GroupItem;
            this.var_254.addGridItem(_loc3_.window);
            _loc2_++;
         }
      }
      
      public function updateItem(param1:int, param2:IWindowContainer) : void
      {
         var _loc3_:IWindow = this.var_254.getGridItemAt(param1);
         if(_loc3_)
         {
            _loc3_ = param2;
         }
      }
      
      public function addItemToBottom(param1:IWindowContainer) : void
      {
         this.var_254.addGridItem(param1);
         param1.procedure = this.itemEventProc;
      }
      
      public function addItemAt(param1:IWindowContainer, param2:int) : void
      {
         this.var_254.addGridItemAt(param1,param2);
         param1.procedure = this.itemEventProc;
      }
      
      public function removeItem(param1:int) : IWindow
      {
         return this.var_254.removeGridItemAt(param1);
      }
      
      public function setLock(param1:Boolean) : void
      {
         if(param1)
         {
            this.var_254.autoArrangeItems = false;
            this.var_254.lock();
         }
         else
         {
            this.var_254.autoArrangeItems = true;
            this.var_254.unlock();
         }
      }
      
      private function itemEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:Boolean = false;
         if(param1.type == WindowMouseEvent.const_61)
         {
            this.var_583 = null;
            this.var_67.cancelFurniInMover();
         }
         else if(param1.type == WindowMouseEvent.const_46)
         {
            if(param2 == null)
            {
               return;
            }
            this.var_67.toggleItemSelection(this._category,this.var_254.getGridItemIndex(param1.window));
            this.var_583 = param2;
         }
         else if(param1.type == WindowMouseEvent.const_25 && this.var_583 != null && this.var_583 == param2 && !this.var_67.isTradingOpen)
         {
            _loc3_ = this.var_67.requestSelectedFurniPlacement(true);
            if(_loc3_)
            {
               this.var_583 = null;
            }
         }
         else if(param1.type == WindowMouseEvent.const_61)
         {
            this.var_583 == null;
         }
         else if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            this.var_583 == null;
         }
         else if(param1.type == WindowMouseEvent.const_308)
         {
            this.var_67.requestCurrentActionOnSelection();
            this.var_583 = null;
         }
      }
   }
}
