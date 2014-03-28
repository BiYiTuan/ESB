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
        // 存储输入XML
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
                WriteErrLog("存储输入XML到本地文件出错" + e.ToString());
                return false;
            }

            return true;
        }

        // 存储输出XML
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
                WriteErrLog("存储输出XML到本地XML文件出错" + e.ToString());
                return false;
            }

            return true;
        }

        // 程序出错日志记录
        static public void WriteErrLog(string strErr)
        {
            Directory.CreateDirectory(Config.errorLogDir);
            string logFilePath = Config.errorLogDir + "\\" 
                                + DateTime.Now.Year.ToString()
                                + "年"
                                + DateTime.Now.Month.ToString()
                                + "月"
                                + DateTime.Now.Day.ToString()
                                + "日.log";

            if (!File.Exists(logFilePath))
            {
                using (StreamWriter fileWrite = new StreamWriter(logFilePath))
                {
                    fileWrite.WriteLine("/*************记录开始---" + DateTime.Now.ToString() + "*************/");
                    fileWrite.WriteLine(strErr);
                    fileWrite.WriteLine("/*************记录结束---" + DateTime.Now.ToString() + "*************/");
                }
            }
            else
            {
                using (StreamWriter fileWrite = File.AppendText(logFilePath))
                {
                    fileWrite.WriteLine("/*************记录开始---" + DateTime.Now.ToString() + "*************/");
                    fileWrite.WriteLine(strErr);
                    fileWrite.WriteLine("/*************记录结束---" + DateTime.Now.ToString() + "*************/");
                }
            }
        }

        static private string GenCurrTimeStr()
        {
            string currTime = DateTime.Now.Year.ToString("d02")
                              + "年"
                              + DateTime.Now.Month.ToString("d02")
                              + "月"
                              + DateTime.Now.Day.ToString("d02")
                              + "日"
                              + DateTime.Now.Hour.ToString("d02")
                              + "时"
                              + DateTime.Now.Minute.ToString("d02")
                              + "分"
                              + DateTime.Now.Second.ToString("d02")
                              + "秒";
            return currTime;
        }

        static public void WriteToFile(string path, string contextToFile)
        {
            string filePath = path;
            if (!File.Exists(filePath))
            {
                using (StreamWriter fileWrite = new StreamWriter(filePath))
                {
                    fileWrite.WriteLine(contextToFile);
                    // Arbitrary objects can also be written to the file.
                    fileWrite.Write("The date is: ");
                    fileWrite.WriteLine(DateTime.Now);
                    fileWrite.WriteLine("-------------------");
                }
            }
            else
            {
                using (StreamWriter fileWrite = File.AppendText(filePath))
                {
                    fileWrite.WriteLine(contextToFile);
                    // Arbitrary objects can also be written to the file.
                    fileWrite.Write("The date is: ");
                    fileWrite.WriteLine(DateTime.Now);
                    fileWrite.WriteLine("-------------------");
                }
            }

         
        }
    }
}
