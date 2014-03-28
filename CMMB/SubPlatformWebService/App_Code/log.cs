using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Xml;

namespace zlLib
{
    public class log
    {
        // �洢����XML
        static public bool SaveInputXML(string inXml)
        {
            Directory.CreateDirectory(Config.inputLogDir);
            XmlDocument xmlDoc = new XmlDocument();
            try
            {
                xmlDoc.LoadXml(inXml);
                xmlDoc.Save(Config.inputLogDir + "\\" + GenCurrTimeStr() + ".xml");
            }
            catch (System.Exception e)
            {
                WriteErrLog("�洢����XML�������ļ�����" + e.ToString());
                return false;
            }

            return true;
        }

        // �洢���XML
        static public bool SaveOutputXML(string inXml)
        {
            Directory.CreateDirectory(Config.outputLogDir);
            XmlDocument xmlDoc = new XmlDocument();
            try
            {
                xmlDoc.LoadXml(inXml);
                xmlDoc.Save(Config.outputLogDir + "\\" + GenCurrTimeStr() + ".xml");
            }
            catch (System.Exception e)
            {
                WriteErrLog("�洢���XML������XML�ļ�����" + e.ToString());
                return false;
            }

            return true;
        }

        // ���������־��¼
        static public void WriteErrLog(string strErr)
        {
            Directory.CreateDirectory(Config.errorLogDir);
            string logFilePath = Config.errorLogDir + "\\" 
                                + DateTime.Now.Year.ToString()
                                + "��"
                                + DateTime.Now.Month.ToString()
                                + "��"
                                + DateTime.Now.Day.ToString()
                                + "��.log";

            if (!File.Exists(logFilePath))
            {
                using (StreamWriter fileWrite = new StreamWriter(logFilePath))
                {
                    fileWrite.WriteLine("/*************��¼��ʼ---" + DateTime.Now.ToString() + "*************/");
                    fileWrite.WriteLine(strErr);
                    fileWrite.WriteLine("/*************��¼����---" + DateTime.Now.ToString() + "*************/");
                }
            }
            else
            {
                using (StreamWriter fileWrite = File.AppendText(logFilePath))
                {
                    fileWrite.WriteLine("/*************��¼��ʼ---" + DateTime.Now.ToString() + "*************/");
                    fileWrite.WriteLine(strErr);
                    fileWrite.WriteLine("/*************��¼����---" + DateTime.Now.ToString() + "*************/");
                }
            }
        }

        static private string GenCurrTimeStr()
        {
            string currTime = DateTime.Now.Year.ToString("d02")
                              + "��"
                              + DateTime.Now.Month.ToString("d02")
                              + "��"
                              + DateTime.Now.Day.ToString("d02")
                              + "��"
                              + DateTime.Now.Hour.ToString("d02")
                              + "ʱ"
                              + DateTime.Now.Minute.ToString("d02")
                              + "��"
                              + DateTime.Now.Second.ToString("d02")
                              + "��";
            return currTime;
        }
    }
}
