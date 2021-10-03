package com.sulake.habbo.widget.messages
{
   public class RoomWidgetChatTypingMessage extends RoomWidgetMessage
   {
      
      public static const const_715:String = "RWCTM_TYPING_STATUS";
       
      
      private var var_602:Boolean;
      
      public function RoomWidgetChatTypingMessage(param1:Boolean)
      {
         super(const_715);
         this.var_602 = param1;
      }
      
      public function get isTyping() : Boolean
      {
         return this.var_602;
      }
   }
}
