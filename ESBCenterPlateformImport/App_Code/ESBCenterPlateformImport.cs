using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Services;
using System.Data;
using System.Data.Odbc;
//using ESBCenterPlateformImport;
using zlLib;
using System.ServiceModel;

[ServiceBehavior]
public class ESBCenterPlateformImport : DeviceInterface
{
    public ESBCenterPlateformImport()
    {

        //如果使用设计的组件，请取消注释以下行 
        //InitializeComponent(); 
    }

    public GetDeviceTypesResponse GetDeviceTypes(GetDeviceTypesRequest request)
    {
        GetDeviceTypesResponse devTypes = new GetDeviceTypesResponse();
        string strUrl = GetServiceUrl("CenterService");
        


        return devTypes;
    }

    public string GetServiceUrl(string strServiceName)
    {
        CSQLDBCtrl SQLDBCtrl = null;

        try
        {
            string strFilePath = "";

            Config.ReadConfig();
            

                SQLDBCtrl = new CSQLDBCtrl();
                SQLDBCtrl.SetDBProgram(Config.DBServer, Config.DBName, Config.DBUser, Config.DBPasswd);
                if (!SQLDBCtrl.OpenDB())
                {
                    log.WriteErrLog("open数据库失败");
                    return "打开数据库失败";
                }


            string strSQL = "select strVideoFile, strFCVSXml from T_FILETYPESTORAGE where strClipLogicID = '";
            DataSet data = new DataSet();
            
            data = SQLDBCtrl.GetDataset(strSQL);
            strFilePath = Convert.ToString(data.Tables[0].Rows[0][0]);
            string strFCVSXml = Convert.ToString(data.Tables[0].Rows[0][1]);
            if (strFCVSXml.Length > 0)
            {
                strFilePath += "|" + strFCVSXml;
            }

            
                SQLDBCtrl.CloseDB();

            return strFilePath;
        }
        catch
        {
            
            {
                if (SQLDBCtrl != null)
                    SQLDBCtrl.CloseDB();
            }

            return "";
        }
    }

    public GetDeviceParameterDefinitionResponse GetDeviceParameterDefinition(GetDeviceParameterDefinitionRequest request)
    {
        GetDeviceParameterDefinitionResponse devParamDef = new GetDeviceParameterDefinitionResponse();

        return devParamDef;
    }

    public void NotifyDataInfo(NotifyDataInfo request)
    {

    }

    public GetManufacturerInfoResponse GetManufacturerInfo(GetManufacturerInfoRequest request)
    {
        GetManufacturerInfoResponse manuInfoResp = new GetManufacturerInfoResponse();

        return manuInfoResp;
    }
}
