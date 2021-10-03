package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowEvent extends Event
   {
      
      public static const const_1550:String = "WE_CREATE";
      
      public static const const_1398:String = "WE_CREATED";
      
      public static const const_1510:String = "WE_DESTROY";
      
      public static const const_325:String = "WE_DESTROYED";
      
      public static const const_1436:String = "WE_OPEN";
      
      public static const const_1633:String = "WE_OPENED";
      
      public static const const_1491:String = "WE_CLOSE";
      
      public static const const_1601:String = "WE_CLOSED";
      
      public static const const_1544:String = "WE_FOCUS";
      
      public static const const_312:String = "WE_FOCUSED";
      
      public static const const_1520:String = "WE_UNFOCUS";
      
      public static const const_1667:String = "WE_UNFOCUSED";
      
      public static const const_1671:String = "WE_ACTIVATE";
      
      public static const const_1503:String = "WE_ACTIVATED";
      
      public static const const_1433:String = "WE_DEACTIVATE";
      
      public static const const_866:String = "WE_DEACTIVATED";
      
      public static const const_477:String = "WE_SELECT";
      
      public static const const_64:String = "WE_SELECTED";
      
      public static const const_685:String = "WE_UNSELECT";
      
      public static const const_883:String = "WE_UNSELECTED";
      
      public static const const_1771:String = "WE_ATTACH";
      
      public static const const_1761:String = "WE_ATTACHED";
      
      public static const const_1745:String = "WE_DETACH";
      
      public static const const_1925:String = "WE_DETACHED";
      
      public static const const_1489:String = "WE_LOCK";
      
      public static const const_1640:String = "WE_LOCKED";
      
      public static const const_1563:String = "WE_UNLOCK";
      
      public static const const_1435:String = "WE_UNLOCKED";
      
      public static const const_620:String = "WE_ENABLE";
      
      public static const const_286:String = "WE_ENABLED";
      
      public static const const_826:String = "WE_DISABLE";
      
      public static const const_222:String = "WE_DISABLED";
      
      public static const const_1617:String = "WE_RELOCATE";
      
      public static const const_388:String = "WE_RELOCATED";
      
      public static const const_1442:String = "WE_RESIZE";
      
      public static const const_51:String = "WE_RESIZED";
      
      public static const const_1573:String = "WE_MINIMIZE";
      
      public static const const_1427:String = "WE_MINIMIZED";
      
      public static const const_1529:String = "WE_MAXIMIZE";
      
      public static const const_1497:String = "WE_MAXIMIZED";
      
      public static const const_1620:String = "WE_RESTORE";
      
      public static const const_1537:String = "WE_RESTORED";
      
      public static const const_1915:String = "WE_ARRANGE";
      
      public static const const_1892:String = "WE_ARRANGED";
      
      public static const const_107:String = "WE_UPDATE";
      
      public static const const_1943:String = "WE_UPDATED";
      
      public static const const_1778:String = "WE_CHILD_RELOCATE";
      
      public static const const_434:String = "WE_CHILD_RELOCATED";
      
      public static const const_1784:String = "WE_CHILD_RESIZE";
      
      public static const const_298:String = "WE_CHILD_RESIZED";
      
      public static const const_1894:String = "WE_CHILD_REMOVE";
      
      public static const const_455:String = "WE_CHILD_REMOVED";
      
      public static const const_1767:String = "WE_PARENT_RELOCATE";
      
      public static const const_1744:String = "WE_PARENT_RELOCATED";
      
      public static const const_1838:String = "WE_PARENT_RESIZE";
      
      public static const const_1477:String = "WE_PARENT_RESIZED";
      
      public static const const_175:String = "WE_OK";
      
      public static const const_654:String = "WE_CANCEL";
      
      public static const const_103:String = "WE_CHANGE";
      
      public static const WINDOW_EVENT_MESSAGE:String = "WE_MESSAGE";
      
      public static const const_476:String = "WE_SCROLL";
      
      public static const const_161:String = "";
       
      
      protected var _type:String = "";
      
      protected var _window:IWindow;
      
      protected var var_659:IWindow;
      
      protected var var_2019:Boolean;
      
      protected var var_2018:Boolean;
      
      public function WindowEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false, param5:Boolean = false)
      {
         this._type = param1;
         this._window = param2;
         this.var_659 = param3;
         this.var_2019 = false;
         this.var_2018 = param5;
         super(param1,param4);
      }
      
      public function set type(param1:String) : void
      {
         this._type = param1;
      }
      
      override public function get type() : String
      {
         return this._type;
      }
      
      public function get window() : IWindow
      {
         return this._window;
      }
      
      public function get related() : IWindow
      {
         return this.var_659;
      }
      
      override public function get cancelable() : Boolean
      {
         return this.var_2018;
      }
      
      override public function clone() : Event
      {
         return new WindowEvent(this._type,this.window,this.related,bubbles,this.cancelable);
      }
      
      public function preventWindowOperation() : void
      {
         if(this.cancelable)
         {
            this.var_2019 = true;
            stopImmediatePropagation();
            return;
         }
         throw new Error("Attempted to prevent window operation that is not canceable!");
      }
      
      public function isWindowOperationPrevented() : Boolean
      {
         return this.var_2019;
      }
      
      override public function toString() : String
      {
         return formatToString("WindowEvent","type","bubbles","cancelable","window");
      }
   }
}
