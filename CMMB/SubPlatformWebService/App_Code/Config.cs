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

namespace zlLib
{
    public class Config
    {
        // ��־
        static public string inputLogDir;
        static public string outputLogDir;
        static public string errorLogDir;

        // ���ݿ�
        static public string DBServer;
        static public string DBName;
        static public string DBUser;
        static public string DBPasswd;
        static public string DBType;
        static public string strDBConn;

        /* ���� */


        static public bool ReadConfig()
        {
            XmlDocument xmlDoc = new XmlDocument();
            XmlNode nd = null;
            try
            {
                //string strFilePath = System.Environment.CurrentDirectory;
                //strFilePath += "\\config.xml";

                //string strPath = HttpContext.Current.Server.MapPath("config.xml");
                string strFilePath = AppDomain.CurrentDomain.SetupInformation.ApplicationBase;
                strFilePath += "config.xml";

                xmlDoc.Load(strFilePath);

                // ��־
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

                // ���ݿ�
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
                log.WriteErrLog("��ȡ�����ļ�����" + e.ToString());
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
                string strFilePath = AppDomain.CurrentDomain.SetupInformation.ApplicationBase;
                strFilePath += "\\strDirPath";
                return strFilePath;
                //return System.Environment.CurrentDirectory + "\\strDirPath";
            }
            else
            {
                return strDirPath;
            }
        }

        static public int PlusPlusLastFourNumber()
        {
            XmlDocument xmlDoc = new XmlDocument();
            xmlDoc.Load(HttpContext.Current.Server.MapPath("config.xml"));
            // ��������8λID�ĺ���λ�� 0000~FFFF  0~65535
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
