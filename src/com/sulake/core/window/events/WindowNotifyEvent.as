package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowNotifyEvent extends WindowEvent
   {
      
      public static const const_1645:String = "WN_CRETAE";
      
      public static const const_1495:String = "WN_CREATED";
      
      public static const const_1206:String = "WN_DESTROY";
      
      public static const const_1227:String = "WN_DESTROYED";
      
      public static const const_1223:String = "WN_OPEN";
      
      public static const const_1038:String = "WN_OPENED";
      
      public static const const_1202:String = "WN_CLOSE";
      
      public static const const_1065:String = "WN_CLOSED";
      
      public static const const_1116:String = "WN_FOCUS";
      
      public static const const_1146:String = "WN_FOCUSED";
      
      public static const const_1053:String = "WN_UNFOCUS";
      
      public static const const_1072:String = "WN_UNFOCUSED";
      
      public static const const_1089:String = "WN_ACTIVATE";
      
      public static const const_373:String = "WN_ACTVATED";
      
      public static const const_1113:String = "WN_DEACTIVATE";
      
      public static const const_1161:String = "WN_DEACTIVATED";
      
      public static const const_520:String = "WN_SELECT";
      
      public static const const_342:String = "WN_SELECTED";
      
      public static const const_877:String = "WN_UNSELECT";
      
      public static const const_710:String = "WN_UNSELECTED";
      
      public static const const_1221:String = "WN_LOCK";
      
      public static const const_1026:String = "WN_LOCKED";
      
      public static const const_1070:String = "WN_UNLOCK";
      
      public static const const_1045:String = "WN_UNLOCKED";
      
      public static const const_1201:String = "WN_ENABLE";
      
      public static const const_690:String = "WN_ENABLED";
      
      public static const const_1112:String = "WN_DISABLE";
      
      public static const const_659:String = "WN_DISABLED";
      
      public static const const_827:String = "WN_RESIZE";
      
      public static const const_194:String = "WN_RESIZED";
      
      public static const const_1110:String = "WN_RELOCATE";
      
      public static const const_483:String = "WN_RELOCATED";
      
      public static const const_1069:String = "WN_MINIMIZE";
      
      public static const const_1009:String = "WN_MINIMIZED";
      
      public static const const_1197:String = "WN_MAXIMIZE";
      
      public static const const_1077:String = "WN_MAXIMIZED";
      
      public static const const_1138:String = "WN_RESTORE";
      
      public static const const_1208:String = "WN_RESTORED";
      
      public static const const_403:String = "WN_CHILD_ADDED";
      
      public static const const_848:String = "WN_CHILD_REMOVED";
      
      public static const const_324:String = "WN_CHILD_RESIZED";
      
      public static const const_279:String = "WN_CHILD_RELOCATED";
      
      public static const WINDOW_NOTIFY_CHILD_ACTIVATED:String = "WN_CHILD_ACTIVATED";
      
      public static const const_453:String = "WN_PARENT_ADDED";
      
      public static const const_1192:String = "WN_PARENT_REMOVED";
      
      public static const const_574:String = "WN_PARENT_RESIZED";
      
      public static const const_1136:String = "WN_PARENT_RELOCATED";
      
      public static const const_899:String = "WN_PARENT_ACTIVATED";
      
      public static const const_456:String = "WN_STATE_UPDATED";
      
      public static const const_454:String = "WN_STYLE_UPDATED";
      
      public static const const_552:String = "WN_PARAM_UPDATED";
      
      public static const UNKNOWN:String = "UNKNOWN";
      
      private static const POOL:Array = [];
       
      
      private var var_1740:Boolean;
      
      public function WindowNotifyEvent()
      {
         super("",null,null);
      }
      
      public static function allocate(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false) : WindowNotifyEvent
      {
         var _loc5_:WindowNotifyEvent = false ? POOL.pop() : new WindowNotifyEvent();
         _loc5_._type = param1;
         _loc5_._window = param2;
         _loc5_.var_659 = param3;
         _loc5_.var_2018 = param4;
         _loc5_.var_1740 = false;
         return _loc5_;
      }
      
      public function recycle() : void
      {
         if(this.var_1740)
         {
            throw new Error("Event already recycled!");
         }
         _type = null;
         var_659 = null;
         _window = null;
         this.var_1740 = true;
         POOL.push(this);
      }
      
      override public function clone() : Event
      {
         return allocate(type,_window,var_659,cancelable);
      }
      
      override public function toString() : String
      {
         return formatToString("WindowNotifyEvent","type","cancelable");
      }
   }
}
