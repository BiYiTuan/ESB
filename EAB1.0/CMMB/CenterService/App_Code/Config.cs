using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml;
using System.IO;
using System.Collections;
using System.Diagnostics;

namespace zlLib
{
    public class Config
    {
        // 日志
        static public string inputLogDir;
        static public string outputLogDir;
        static public string errorLogDir;

        // 数据库
        static public string DBServer;
        static public string DBName;
        static public string DBUser;
        static public string DBPasswd;
        static public string DBType;
        static public string strDBConn;

        /* 其他 */


        static public bool ReadConfig()
        {
            XmlDocument xmlDoc = new XmlDocument();
            XmlNode nd = null;
            try
            {
                /*strFilePath = HttpContext.Current.Server.MapPath("config.xml");
                string strFilePath = System.Environment.CurrentDirectory;
                string str1 = Process.GetCurrentProcess().MainModule.FileName;//可获得当前执行的exe的文件名
                log.WriteToFile("C:\\DCM\\CMM1.txt","str1 :" + str1);

                string str3 = Directory.GetCurrentDirectory();//获取应用程序的当前工作目录
                log.WriteToFile("C:\\DCM\\CMM1.txt", "str3 :" + str3);

                string str4=AppDomain.CurrentDomain.BaseDirectory;//获取基目录，它由程序集冲突解决程序用来探测程序集。
                log.WriteToFile("C:\\DCM\\CMM1.txt", "str4 :" + str4);
                string str7=AppDomain.CurrentDomain.SetupInformation.ApplicationBase;//获取或设置包含该应用程序的目录的名称
                log.WriteToFile("C:\\DCM\\CMM1.txt", "str7 :" + str7);*/
                string strFilePath = AppDomain.CurrentDomain.SetupInformation.ApplicationBase;
                strFilePath += "config.xml";

                xmlDoc.Load(strFilePath);

                // 日志
                inputLogDir = xmlDoc.SelectSingleNode("config/log/inputLogDir").InnerText;
                if (inputLogDir.Length == 0)
                {
                    return false;
                }
                inputLogDir = GenDirPath(inputLogDir);

                outputLogDir = xmlDoc.SelectSingleNode("config/log/outputLogDir").InnerText;
                if (inputLogDir.Length == 0)
                {
                    return false;
                }
                outputLogDir = GenDirPath(outputLogDir);

                errorLogDir = xmlDoc.SelectSingleNode("config/log/errorLogDir").InnerText;
                if (inputLogDir.Length == 0)
                {
                    return false;
                }
                errorLogDir = GenDirPath(errorLogDir);

                // 数据库
                DBServer = xmlDoc.SelectSingleNode("config/DB/DBServer").InnerText;
                DBName = xmlDoc.SelectSingleNode("config/DB/DBName").InnerText;
                DBUser = xmlDoc.SelectSingleNode("config/DB/DBUser").InnerText;
                DBPasswd = xmlDoc.SelectSingleNode("config/DB/DBPasswd").InnerText;
                nd = xmlDoc.SelectSingleNode("config/DB/DBType");
                if (nd == null)
                    DBType = "SQL";
                else
                    DBType = nd.InnerText;

                if (DBType.ToUpper() == "ORACLE")
                    strDBConn = "user id=" + DBUser + ";data source=" + DBServer + ";password=" + DBPasswd;
                else
                    strDBConn = "Driver={SQL Server};Server=" + DBServer + ";DataSource = " + DBServer + ";Database=" + DBName + ";Uid=" + DBUser + ";Pwd=" + DBPasswd + ";";

                
            }
            catch (Exception e)
            {
                log.WriteErrLog("读取配置文件出错" + e.ToString());
                return false;
            }

            return true;
        }

        static private string GenDirPath(string strDirPath)
        {
            if (strDirPath.Length == 0)
            {
                return "";
            }

            int index = strDirPath.IndexOf(":");
            if (-1 == index)
            {
                //return System.Environment.CurrentDirectory + "\\strDirPath";
                return AppDomain.CurrentDomain.SetupInformation.ApplicationBase + "\\strDirPath";
            }
            else
            {
                return strDirPath;
            }
        }

        static public int PlusPlusLastFourNumber()
        {
            XmlDocument xmlDoc = new XmlDocument();
            string strFilePath = AppDomain.CurrentDomain.SetupInformation.ApplicationBase;
            strFilePath += "config.xml";
            xmlDoc.Load(strFilePath);
            //xmlDoc.Load(HttpContext.Current.Server.MapPath("config.xml"));
            // 用于生成8位ID的后四位数 0000~FFFF  0~65535
            int nlastFourNumberForClipID = Convert.ToInt32(xmlDoc.SelectSingleNode("config/other/lastFourNumberForClipID").InnerText);

            if (nlastFourNumberForClipID >= 65535)
            {
                nlastFourNumberForClipID = 0;
            }
            else
            {
                ++nlastFourNumberForClipID;
            }

            xmlDoc.SelectSingleNode("config/other/lastFourNumberForClipID").InnerText = nlastFourNumberForClipID.ToString();
            xmlDoc.Save(HttpContext.Current.Server.MapPath("config.xml"));

            return nlastFourNumberForClipID;
        }
    }
}
