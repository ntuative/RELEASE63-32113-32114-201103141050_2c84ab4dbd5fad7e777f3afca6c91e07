package com.sulake.habbo.widget.messages
{
   public class RoomWidgetUserActionMessage extends RoomWidgetMessage
   {
      
      public static const const_767:String = "RWUAM_WHISPER_USER";
      
      public static const const_639:String = "RWUAM_IGNORE_USER";
      
      public static const const_854:String = "RWUAM_UNIGNORE_USER";
      
      public static const const_563:String = "RWUAM_KICK_USER";
      
      public static const const_858:String = "RWUAM_BAN_USER";
      
      public static const const_642:String = "RWUAM_SEND_FRIEND_REQUEST";
      
      public static const const_703:String = "RWUAM_RESPECT_USER";
      
      public static const const_644:String = "RWUAM_GIVE_RIGHTS";
      
      public static const const_821:String = "RWUAM_TAKE_RIGHTS";
      
      public static const const_688:String = "RWUAM_START_TRADING";
      
      public static const const_907:String = "RWUAM_OPEN_HOME_PAGE";
      
      public static const const_575:String = "RWUAM_KICK_BOT";
      
      public static const const_816:String = "RWUAM_REPORT";
      
      public static const const_491:String = "RWUAM_PICKUP_PET";
      
      public static const const_1545:String = "RWUAM_TRAIN_PET";
      
      public static const const_457:String = " RWUAM_RESPECT_PET";
      
      public static const const_405:String = "RWUAM_REQUEST_PET_UPDATE";
      
      public static const const_638:String = "RWUAM_START_NAME_CHANGE";
       
      
      private var _userId:int = 0;
      
      public function RoomWidgetUserActionMessage(param1:String, param2:int = 0)
      {
         super(param1);
         this._userId = param2;
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
   }
}
