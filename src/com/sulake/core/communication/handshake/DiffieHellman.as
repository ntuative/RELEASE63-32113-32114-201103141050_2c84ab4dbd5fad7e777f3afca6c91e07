package com.sulake.core.communication.handshake
{
   import com.hurlant.math.BigInteger;
   import com.sulake.core.utils.ErrorReportStorage;
   
   public class DiffieHellman implements IKeyExchange
   {
       
      
      private var var_909:BigInteger;
      
      private var var_2257:BigInteger;
      
      private var var_1644:BigInteger;
      
      private var var_2256:BigInteger;
      
      private var var_1322:BigInteger;
      
      private var var_1643:BigInteger;
      
      public function DiffieHellman(param1:BigInteger, param2:BigInteger)
      {
         super();
         this.var_1322 = param1;
         this.var_1643 = param2;
      }
      
      public function init(param1:String, param2:uint = 16) : Boolean
      {
         ErrorReportStorage.addDebugData("DiffieHellman","Prime: " + this.var_1322.toString() + ",generator: " + this.var_1643.toString() + ",secret: " + param1);
         this.var_909 = new BigInteger();
         this.var_909.fromRadix(param1,param2);
         this.var_2257 = this.var_1643.modPow(this.var_909,this.var_1322);
         return true;
      }
      
      public function generateSharedKey(param1:String, param2:uint = 16) : String
      {
         this.var_1644 = new BigInteger();
         this.var_1644.fromRadix(param1,param2);
         this.var_2256 = this.var_1644.modPow(this.var_909,this.var_1322);
         return this.method_8(param2);
      }
      
      public function getPublicKey(param1:uint = 16) : String
      {
         return this.var_2257.toRadix(param1);
      }
      
      public function method_8(param1:uint = 16) : String
      {
         return this.var_2256.toRadix(param1);
      }
   }
}
