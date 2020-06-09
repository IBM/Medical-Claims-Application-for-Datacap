using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Diagnostics;
using System.Reflection;


namespace MC_Identify
{
    public class RRX : iRRX.iRRXnet
    {

        #region iRRXnet Members

        public string Code
        {
            get
            {
                FileVersionInfo fvi = System.Diagnostics.FileVersionInfo.GetVersionInfo(Assembly.GetExecutingAssembly().Location);

                string rrxCode = Properties.Resources.MC_Identify;

                return rrxCode.Replace(@"dll_AssemblyVersion", fvi.FileVersion.ToString());
            }

        }

        public string Help
        {
            get { return Properties.Resources.help; }
        }

        public string LoadString(string strStringName, string strDefValue)
        {
            string result = strDefValue;
            try
            {
                result = Properties.Resources.ResourceManager.GetString(strStringName);
            }
            catch (Exception ex)
            {
                result = strDefValue;
            }
            return result;
            
        }

        private long mKeyPairLeft = 0;
        private long mKeyPairRight = 0;
        public bool RRSID(object sender, long n64KeyPairLeft)
        {
            if (!(sender is dcrroLib.IRRState))
                return false;

            Random rnd = new Random(n64KeyPairLeft.GetHashCode());
            int n1 = rnd.Next();
            int n2 = rnd.Next();
            Int64 n64 = n1;
            n64 <<= 32;
            n64 += n2;

            dcrroLib.IRRState iRRSState = sender as dcrroLib.IRRState;
            //Int64 n64KeyPairRight = 0;
            mKeyPairLeft = n64KeyPairLeft;
            mKeyPairRight = n64;
            return iRRSState.RRXDLLID(n64KeyPairLeft, n64);
        }

        public bool SecureCall(long n64KeyPairLeft, long n64KeyPairRight, string strIn, out string strOut)
        {
            strOut = "";
            if (0 == mKeyPairLeft ||
                0 == mKeyPairRight ||
                mKeyPairLeft != n64KeyPairLeft ||
                mKeyPairRight != n64KeyPairRight)
                return false;

            strOut = strIn;
            return true;
        }

        #endregion
    }
}
