package com.sulake.habbo.communication.messages.incoming.handshake
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.handshake.DisconnectReasonParser;
   
   public class DisconnectReasonEvent extends MessageEvent implements IMessageEvent
   {
      
      public static const const_1755:int = 0;
      
      public static const const_1488:int = 1;
      
      public static const const_1553:int = 2;
      
      public static const const_1947:int = 3;
      
      public static const const_1773:int = 4;
      
      public static const const_1881:int = 5;
      
      public static const const_1654:int = 10;
      
      public static const const_1897:int = 11;
      
      public static const const_1936:int = 12;
      
      public static const const_1823:int = 13;
      
      public static const const_1857:int = 16;
      
      public static const const_1811:int = 17;
      
      public static const const_1790:int = 18;
      
      public static const const_1840:int = 19;
      
      public static const const_1848:int = 20;
      
      public static const const_1883:int = 22;
      
      public static const const_1735:int = 23;
      
      public static const const_1899:int = 24;
      
      public static const const_1856:int = 25;
      
      public static const const_1865:int = 26;
      
      public static const const_1955:int = 27;
      
      public static const const_1893:int = 28;
      
      public static const const_1772:int = 29;
      
      public static const const_1929:int = 100;
      
      public static const const_1740:int = 101;
      
      public static const const_1746:int = 102;
      
      public static const const_1738:int = 103;
      
      public static const const_1902:int = 104;
      
      public static const const_1769:int = 105;
      
      public static const const_1960:int = 106;
      
      public static const const_1749:int = 107;
      
      public static const const_1922:int = 108;
      
      public static const const_1787:int = 109;
      
      public static const const_1946:int = 110;
      
      public static const const_1791:int = 111;
      
      public static const const_1839:int = 112;
      
      public static const const_1821:int = 113;
      
      public static const const_1795:int = 114;
      
      public static const const_1888:int = 115;
      
      public static const const_1928:int = 116;
      
      public static const const_1768:int = 117;
      
      public static const const_1911:int = 118;
      
      public static const const_1780:int = 119;
       
      
      public function DisconnectReasonEvent(param1:Function)
      {
         super(param1,DisconnectReasonParser);
      }
      
      public function get reason() : int
      {
         return (this.var_10 as DisconnectReasonParser).reason;
      }
      
      public function get reasonString() : String
      {
         switch(this.reason)
         {
            case const_1488:
            case const_1654:
               return "banned";
            case const_1553:
               return "concurrentlogin";
            default:
               return "logout";
         }
      }
   }
}
