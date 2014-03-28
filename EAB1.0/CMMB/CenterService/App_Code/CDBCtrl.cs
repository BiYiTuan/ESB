using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.Odbc;
//using Oracle.DataAccess.Client;
//using Oracle.DataAccess.Types;

namespace zlLib
{
    class CDBCtrl
    {
        public string m_strDBConn;
        public string m_strLastError;

        public virtual void SetDBProgram(string strDBSvr, string strDBName, string strDBUser, string strDBPwd)
        {

        }

        public virtual bool OpenDB() { return true; }

        public virtual bool CloseDB() { return true; }


        public virtual bool ExecuteSQL(string strSQL) { return true; }

        public bool DeleteTaskWithFilter(string strDelTskFilter)
        {
            bool bSuc1 = DeleteWithFilter("T_FCVSTask", strDelTskFilter);
            bool bSuc2 = DeleteWithFilter("T_FCVSFileInfo", strDelTskFilter);
            bool bSuc3 = DeleteWithFilter("T_FCVSClipInfo", strDelTskFilter);

            return (bSuc1 && bSuc2 && bSuc3);
        }

        public bool DeleteWithFilter(string strTabName, string strDelFilter)
        {
            string strDelSQL = "delete from ";
            strDelSQL += strTabName;
            strDelSQL += " where ";
            strDelSQL += strDelFilter;

            return ExecuteSQL(strDelSQL);
        }

        public bool ResetFCVSTask(long nTaskID, string strTskID)
        {
            string strSQL = "delete from T_FCVSFileInfo where strTaskID='";
            strSQL += strTskID;
            strSQL += "'";
            ExecuteSQL(strSQL);

            strSQL = "delete from T_FCVSClipInfo where strTaskID='";
            strSQL += strTskID;
            strSQL += "'";
            ExecuteSQL(strSQL);

            strSQL = "update T_FCVSTask set nStatus=0 where nTaskID=";
            strSQL += nTaskID.ToString();

            return ExecuteSQL(strSQL);
        }

        public void SetDBConnectString(string strDBCon)
        {
            m_strDBConn = strDBCon;
        }
    }

    class CSQLDBCtrl : CDBCtrl
    {
        OdbcConnection m_conn; // 数据库连接

        public CSQLDBCtrl()
        {
            
        }

        override public bool OpenDB()
        {
            try
            {
                m_conn = new OdbcConnection(m_strDBConn);
                m_conn.Open();
            }
            catch (Exception ex)
            {
                m_strLastError = ex.ToString();
                return false;
            }

            return true;
        }

        override public void SetDBProgram(string strDBSvr, string strDBName, string strDBUser, string strDBPwd)
        {
            m_strDBConn = "Driver={SQL Server};Server=";
            m_strDBConn += strDBSvr;
            m_strDBConn += ";Database=";
            m_strDBConn += strDBName;
            m_strDBConn += ";Uid=";
            m_strDBConn += strDBUser;
            m_strDBConn += ";Pwd=";
            m_strDBConn += strDBPwd;
            m_strDBConn += ";";
        }

        override public bool CloseDB()
        {
            try
            {
                m_conn.Close();
            }
            catch (Exception ex)
            {
                m_strLastError = ex.ToString();
                return false;
            }

            return true;
        }

        override public bool ExecuteSQL(string strSQL)
        {
            try
            {
                if (m_conn == null)
                    return false;
                OdbcCommand command = new OdbcCommand(strSQL, m_conn);
                command.ExecuteNonQuery();
            }
            catch (InvalidOperationException ex)
            {
                m_strLastError = "数据库连接没有打开：   " + ex.ToString();
                return false;
            }
            catch (Exception ex)
            {
                m_strLastError = "执行SQL语句失败:   " + strSQL;
                log.WriteErrLog(m_strLastError);
                log.WriteErrLog(ex.ToString());

                return false;
            }

            return true;
        }

        public DataSet GetDataset(string strSQL)
        {
            DataSet OracleData = new DataSet();
            OdbcCommand cmd = new OdbcCommand(strSQL, m_conn);

            OdbcDataAdapter adapter = new OdbcDataAdapter(cmd);
            adapter.Fill(OracleData);

            return OracleData;
        }

    }

    /*class COracleDBCtrl : CDBCtrl
    {
        OracleConnection m_conn; // 数据库连接

        public COracleDBCtrl()
        {
            
        }

        override public bool OpenDB()
        {
            try
            {
                m_conn = new OracleConnection(m_strDBConn);
                m_conn.Open();
            }
            catch (Exception ex)
            {
                m_strLastError = ex.ToString();
                return false;
            }

            return true;
        }

        override public void SetDBProgram(string strDBSvr, string strDBName, string strDBUser, string strDBPwd)
        {
            m_strDBConn = "user id=" + strDBUser + ";data source=" + strDBSvr + ";password=" + strDBPwd;

        }

        override public bool CloseDB()
        {
            try
            {
                m_conn.Close();
            }
            catch (Exception ex)
            {
                m_strLastError = ex.ToString();
                return false;
            }

            return true;
        }

        override public bool ExecuteSQL(string strSQL)
        {
            try
            {
                if (m_conn == null)
                    return false;

                OracleCommand command = new OracleCommand(strSQL, m_conn);
                command.ExecuteNonQuery();
            }
            catch (InvalidOperationException ex)
            {
                m_strLastError = "数据库连接没有打开：   " + ex.ToString();
                return false;
            }
            catch (Exception ex)
            {
                m_strLastError = "执行SQL语句失败:   " + strSQL;
                log.WriteErrLog(m_strLastError);
                log.WriteErrLog(ex.ToString());

                return false;
            }

            return true;
        }

        public DataSet GetDataset(string strSQL)
        {
            DataSet OracleData = new DataSet();
            OracleCommand cmd = new OracleCommand(strSQL, m_conn);

            OracleDataAdapter adapter = new OracleDataAdapter(cmd);
            adapter.Fill(OracleData);

            return OracleData;
        }
    }*/
}
