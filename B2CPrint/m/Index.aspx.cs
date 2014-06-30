using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace B2CPrint.m
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            OS.InnerText = getOS();//获取操作系统

            HttpBrowserCapabilities bc = new HttpBrowserCapabilities();
            bc = Request.Browser;
            browers.InnerText = bc.Type;//获取浏览器

            time.InnerText = DateTime.Now.ToString();//获取时间

            resinfo.InnerText = getIP();//获取IP
            

            


        }

        private string getOS()
        {
            string strSysVersion = "其他";
            string strAgentInfo = Request.ServerVariables["HTTP_USER_AGENT"];

            if (strAgentInfo.Contains("NT 6.3"))
            {
                strSysVersion = "Windows 8.1";
            }

            if (strAgentInfo.Contains("NT 6.2"))
            {
                strSysVersion = "Windows 8";
            }

            if (strAgentInfo.Contains("NT 6.1"))
            {
                strSysVersion = "Windows 7";
            }

            if (strAgentInfo.Contains("NT 5.2"))
            {
                strSysVersion = "Windows 2003";
            }
            else if (strAgentInfo.Contains("NT 5.1"))
            {
                strSysVersion = "Windows XP";
            }
            else if (strAgentInfo.Contains("NT 5"))
            {
                strSysVersion = "Windows 2000";
            }
            else if (strAgentInfo.Contains("NT 4.9"))
            {
                strSysVersion = "Windows ME";
            }
            else if (strAgentInfo.Contains("NT 4"))
            {
                strSysVersion = "Windows NT4";
            }
            else if (strAgentInfo.Contains("NT 98"))
            {
                strSysVersion = "Windows 98";
            }
            else if (strAgentInfo.Contains("NT 95"))
            {
                strSysVersion = "Windows 95";
            }
            else if (strSysVersion.ToLower().Contains("Mac"))
            {
                strSysVersion = "Mac";
            }
            else if (strSysVersion.ToLower().Contains("unix"))
            {
                strSysVersion = "UNIX";
            }
            else if (strSysVersion.ToLower().Contains("linux"))
            {
                strSysVersion = "Linux";
            }
            else if (strSysVersion.Contains("SunOS"))
            {
                strSysVersion = "SunOS";
            }

            return strSysVersion;
        }

        private string getIP()
        {
            string ipv4 = String.Empty;

            foreach (IPAddress ip in Dns.GetHostAddresses(GetClientIP()))
            {
                if (ip.AddressFamily.ToString() == "InterNetwork")
                {
                    ipv4 = ip.ToString();
                    break;
                }
            }

            if (ipv4 != String.Empty)
            {
                return ipv4;
            }

            // 原作使用 Dns.GetHostName 方法取回的是 Server 端信息，非 Client 端。
            // 改写为利用 Dns.GetHostEntry 方法，由获取的 IPv6 位址反查 DNS 纪录，
            // 再逐一判断何者为 IPv4 协议，即可转为 IPv4 位址。
            foreach (IPAddress ip in Dns.GetHostEntry(GetClientIP()).AddressList)
            //foreach (IPAddress ip in Dns.GetHostAddresses(Dns.GetHostName()))
            {
                if (ip.AddressFamily.ToString() == "InterNetwork")
                {
                    ipv4 = ip.ToString();
                    break;
                }
            }

            return ipv4;
        }

        public static string GetClientIP()
        {
            if (null == HttpContext.Current.Request.ServerVariables["HTTP_VIA"])
            {
                return HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
            }
            else
            {
                return HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
            }
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            time.InnerText = DateTime.Now.ToString();//获取时间
        }
    }

}