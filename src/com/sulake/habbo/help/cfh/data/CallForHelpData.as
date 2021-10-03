package com.sulake.habbo.help.cfh.data
{
   public class CallForHelpData
   {
       
      
      private var var_2498:int;
      
      private var var_1401:int;
      
      private var var_1776:String = "";
      
      public function CallForHelpData()
      {
         super();
      }
      
      public function get topicIndex() : int
      {
         return this.var_2498;
      }
      
      public function get reportedUserId() : int
      {
         return this.var_1401;
      }
      
      public function get reportedUserName() : String
      {
         return this.var_1776;
      }
      
      public function set topicIndex(param1:int) : void
      {
         this.var_2498 = param1;
      }
      
      public function set reportedUserId(param1:int) : void
      {
         this.var_1401 = param1;
      }
      
      public function set reportedUserName(param1:String) : void
      {
         this.var_1776 = param1;
      }
      
      public function get userSelected() : Boolean
      {
         return this.var_1401 > 0;
      }
      
      public function getTopicKey(param1:int) : String
      {
         return (!!this.userSelected ? "help.cfh.topicwithharasser." : "help.cfh.topic.") + param1;
      }
      
      public function flush() : void
      {
         this.var_1401 = 0;
         this.var_1776 = "";
      }
   }
}
