package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.mainview.MainViewCtrl;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.EventsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.MyRoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.OfficialTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.SearchTabPageDecorator;
   
   public class Tabs
   {
      
      public static const const_366:int = 1;
      
      public static const const_261:int = 2;
      
      public static const const_305:int = 3;
      
      public static const const_354:int = 4;
      
      public static const const_267:int = 5;
      
      public static const const_365:int = 1;
      
      public static const const_621:int = 2;
      
      public static const const_769:int = 3;
      
      public static const const_641:int = 4;
      
      public static const const_252:int = 5;
      
      public static const const_840:int = 6;
      
      public static const const_672:int = 7;
      
      public static const const_257:int = 8;
      
      public static const const_337:int = 9;
      
      public static const const_1798:int = 10;
      
      public static const const_687:int = 11;
      
      public static const const_452:int = 12;
       
      
      private var var_398:Array;
      
      private var _navigator:HabboNavigator;
      
      public function Tabs(param1:HabboNavigator)
      {
         super();
         this._navigator = param1;
         this.var_398 = new Array();
         this.var_398.push(new Tab(this._navigator,const_366,const_452,new EventsTabPageDecorator(this._navigator),MainViewCtrl.const_470));
         this.var_398.push(new Tab(this._navigator,const_261,const_365,new RoomsTabPageDecorator(this._navigator),MainViewCtrl.const_470));
         this.var_398.push(new Tab(this._navigator,const_354,const_687,new OfficialTabPageDecorator(this._navigator),MainViewCtrl.const_1195));
         this.var_398.push(new Tab(this._navigator,const_305,const_252,new MyRoomsTabPageDecorator(this._navigator),MainViewCtrl.const_470));
         this.var_398.push(new Tab(this._navigator,const_267,const_257,new SearchTabPageDecorator(this._navigator),MainViewCtrl.const_757));
         this.setSelectedTab(const_366);
      }
      
      public function onFrontPage() : Boolean
      {
         return this.getSelected().id == const_354;
      }
      
      public function get tabs() : Array
      {
         return this.var_398;
      }
      
      public function setSelectedTab(param1:int) : void
      {
         this.clearSelected();
         this.getTab(param1).selected = true;
      }
      
      public function getSelected() : Tab
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_398)
         {
            if(_loc1_.selected)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      private function clearSelected() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_398)
         {
            _loc1_.selected = false;
         }
      }
      
      public function getTab(param1:int) : Tab
      {
         var _loc2_:* = null;
         for each(_loc2_ in this.var_398)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
   }
}
