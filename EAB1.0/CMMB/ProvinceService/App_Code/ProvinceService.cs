using System;
using System.Collections.Generic;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using System.Xml;
using System.Data;
using System.Data.Odbc;
using zlLib;

[ServiceBehavior]
public class ProvinceService : DeviceInterface, StuffInterface, MonitorObjInterface, MaintenanceInterface
{
    CSQLDBCtrl SQLDBCtrl = null;

    public ProvinceService()
    {
        Config.ReadConfig();

        SQLDBCtrl = new CSQLDBCtrl();
        SQLDBCtrl.SetDBProgram(Config.DBServer, Config.DBName, Config.DBUser, Config.DBPasswd);
        if (!SQLDBCtrl.OpenDB())
        {
            log.WriteErrLog("open数据库失败");
            return;
        }
    }

    ~ProvinceService()
    {
        try
        {
            if (SQLDBCtrl != null)
                SQLDBCtrl.CloseDB();
        }
        catch
        {
        }
    }

    public string CreateInputText(RequestHead reqHead)
    {
        string strXml = "";
        try
        {
            XmlDocument xmlDoc = new XmlDocument();

            XmlDeclaration xmlDecl;
            xmlDecl = xmlDoc.CreateXmlDeclaration("1.0", "GB2312", null);
            xmlDoc.AppendChild(xmlDecl);

            XmlNode xmlRoot = (XmlNode)xmlDoc.CreateElement("ESB");
            xmlDoc.AppendChild(xmlRoot);

            XmlNode requestHeadNd = (XmlNode)xmlDoc.CreateElement("RequestHead");

            XmlNode requestChildNd = (XmlNode)xmlDoc.CreateElement("SourceSysID");
            requestChildNd.InnerText = reqHead.SourceSysID;
            requestHeadNd.AppendChild(requestChildNd);

            requestChildNd = (XmlNode)xmlDoc.CreateElement("TargetSysID");
            requestChildNd.InnerText = reqHead.TargetSysID;
            requestHeadNd.AppendChild(requestChildNd);

            requestChildNd = (XmlNode)xmlDoc.CreateElement("TargetServiceName");
            requestChildNd.InnerText = reqHead.TargetServiceName;
            requestHeadNd.AppendChild(requestChildNd);

            requestChildNd = (XmlNode)xmlDoc.CreateElement("TimeStamp");
            requestChildNd.InnerText = reqHead.TimeStamp.ToString();
            requestHeadNd.AppendChild(requestChildNd);

            requestChildNd = (XmlNode)xmlDoc.CreateElement("DataType");
            requestChildNd.InnerText = reqHead.DataType.ToString();
            requestHeadNd.AppendChild(requestChildNd);

            xmlRoot.AppendChild(requestHeadNd);

            strXml = xmlRoot.InnerXml;
        }
        catch (Exception ex)
        {
            log.WriteErrLog("CenterService.CreateInputText error!");
            log.WriteErrLog(ex.ToString());
        }

        return strXml;
    }

    public string RecordLogIntoDB(string strInMessage, string strOutMessage, string strServiceType)
    {
        string strSQL = "";
        string strReturn = "";
        if (SQLDBCtrl == null)
            return strReturn;

        try
        {
            strSQL = "insert into eab_service_log(ID,InvokeTime,Type,InMessage,OutMessage,Result) values('";

            strSQL += Guid.NewGuid().ToString();
            strSQL += "','";

            strSQL += DateTime.Now.ToString();
            strSQL += "','";

            strSQL += strServiceType;
            strSQL += "','";

            strSQL += strInMessage;
            strSQL += "','";

            strSQL += strOutMessage;
            strSQL += "',";

            strSQL += "200";
            strSQL += ")";

            if (SQLDBCtrl.ExecuteSQL(strSQL) == false)
            {
                log.WriteErrLog("执行SQL语句失败,SQL: " + strSQL);
                strReturn = "执行SQL语句失败!";
            }
        }
        catch (Exception ex)
        {
            log.WriteErrLog("CenterService.RecordLogIntoDB error!");
            log.WriteErrLog("SQL String : " + strSQL);
            log.WriteErrLog(ex.ToString());
        }
        return strReturn;
    }

    public string GetServiceUrl(string strServiceName,RequestHead requestHeadInfo)
    {

        if (SQLDBCtrl == null)
            return "";
        try
        {
            string strUrl = "";

            string strSQL = "select service_url from eab_service where service_name='";
            strSQL += strServiceName;
            strSQL += "'";

            DataSet data = new DataSet();

            data = SQLDBCtrl.GetDataset(strSQL);
            if (data.Tables[0].Rows.Count == 0)
            {
                log.WriteErrLog("没有找到对应服务!，SQL： " + strSQL);
                return "";
            }
            strUrl = Convert.ToString(data.Tables[0].Rows[0][0]);

            //SQLDBCtrl.CloseDB();

            return strUrl;
        }
        catch (Exception ex)
        {
            log.WriteErrLog("GetServiceUrl出错!");
            log.WriteErrLog(ex.ToString());

            return "";
        }

    }

    //Device
    public GetDeviceListResponse GetDeviceList(GetDeviceListRequest request)
    {
        string strResponse = "";
        GetDeviceListResponse getDevListResp = null;

        try
        {
            //查询，生成服务地址
            string strUrl = GetServiceUrl("ProvinceData",request.RequestHead);
            if (strUrl[strUrl.Length - 1] != '/')
                strUrl += "/";

            strUrl += "device";

            //设置服务地址
            DeviceInterfaceClient devClient = new DeviceInterfaceClient(new BasicHttpBinding(), new EndpointAddress(strUrl));

            //调用服务
            DeviceInstanceList devInfoTypes = devClient.GetDeviceList(request.RequestHead, request.MonitorObjCode);

            //生成反馈结果
            getDevListResp = new GetDeviceListResponse(devInfoTypes);
            strResponse = "调用成功";

        }
        catch (Exception ex)
        {
            strResponse = "调用失败";

            log.WriteErrLog("调用DeviceInterface.GetDeviceTypes 出错！");
            log.WriteErrLog(ex.ToString());
        }

        try
        {
            string strReqHeadXml = CreateInputText(request.RequestHead);
            RecordLogIntoDB(strReqHeadXml, strResponse, "ProvinceService.GetDeviceList_" + request.RequestHead.SourceSysID);
        }
        catch (Exception ex)
        {
            log.WriteErrLog("调用DeviceInterface.GetDeviceTypes 记录日志出错！");
            log.WriteErrLog(ex.ToString());
        }

        return getDevListResp;
    }

    public GetDeviceParameterValueResponse GetDeviceParameterValue(GetDeviceParameterValueRequest request)
    {
        string strResponse = "";
        GetDeviceParameterValueResponse getDevParamValueResp = null;

        try
        {
            //查询，生成服务地址
            string strUrl = GetServiceUrl("ProvinceData", request.RequestHead);
            if (strUrl[strUrl.Length - 1] != '/')
                strUrl += "/";

            strUrl += "device";

            //设置服务地址
            DeviceInterfaceClient devClient = new DeviceInterfaceClient(new BasicHttpBinding(), new EndpointAddress(strUrl));

            //调用服务
            GetParamValResponse getValResp = devClient.GetDeviceParameterValue(request.RequestHead, request.GetParamValRequest);

            //生成反馈结果
            getDevParamValueResp = new GetDeviceParameterValueResponse(getValResp);
            strResponse = "调用成功";

        }
        catch (Exception ex)
        {
            strResponse = "调用失败";

            log.WriteErrLog("调用DeviceInterface.GetDeviceParameterValue 出错！");
            log.WriteErrLog(ex.ToString());
        }

        try
        {
            string strReqHeadXml = CreateInputText(request.RequestHead);
            RecordLogIntoDB(strReqHeadXml, strResponse, "ProvinceService.GetDeviceParameterValue_" + request.RequestHead.SourceSysID);
        }
        catch (Exception ex)
        {
            log.WriteErrLog("调用DeviceInterface.GetDeviceParameterValue 记录日志出错！");
            log.WriteErrLog(ex.ToString());
        }

        return getDevParamValueResp;
    }

    public GetProductDataSetResponse GetProductDataSet(GetProductDataSetRequest request)
    {
        string strResponse = "";
        GetProductDataSetResponse getProductDataSetResp = null;

        try
        {
            //查询，生成服务地址
            string strUrl = GetServiceUrl("ProvinceData", request.RequestHead);
            if (strUrl[strUrl.Length - 1] != '/')
                strUrl += "/";

            strUrl += "device";

            //设置服务地址
            DeviceInterfaceClient devClient = new DeviceInterfaceClient(new BasicHttpBinding(), new EndpointAddress(strUrl));

            //调用服务
            int nServiceReturn = devClient.GetProductDataSet(request.RequestHead, request.MonitorObjCode, request.beginTime,request.endTime,request.dataFileFTPURL);

            //生成反馈结果
            getProductDataSetResp = new GetProductDataSetResponse(nServiceReturn);
            strResponse = "调用成功";

        }
        catch (Exception ex)
        {
            strResponse = "调用失败";

            log.WriteErrLog("调用DeviceInterface.GetDeviceParameterValue 出错！");
            log.WriteErrLog(ex.ToString());
        }

        try
        {
            string strReqHeadXml = CreateInputText(request.RequestHead);
            RecordLogIntoDB(strReqHeadXml, strResponse, "ProvinceService.GetDeviceParameterValue_" + request.RequestHead.SourceSysID);
        }
        catch (Exception ex)
        {
            log.WriteErrLog("调用DeviceInterface.GetDeviceParameterValue 记录日志出错！");
            log.WriteErrLog(ex.ToString());
        }

        return getProductDataSetResp;
    }

    public GetDeviceTopologyResponse GetDeviceTopology(GetDeviceTopologyRequest request)
    {
        string strResponse = "";
        GetDeviceTopologyResponse getDevTopolResp = null;

        try
        {
            //查询，生成服务地址
            string strUrl = GetServiceUrl("ProvinceData", request.RequestHead);
            if (strUrl[strUrl.Length - 1] != '/')
                strUrl += "/";

            strUrl += "device";

            //设置服务地址
            DeviceInterfaceClient devClient = new DeviceInterfaceClient(new BasicHttpBinding(), new EndpointAddress(strUrl));

            //调用服务
            DeviceTopologyType devTopType = devClient.GetDeviceTopology(request.RequestHead, request.MonitorObjCode);

            //生成反馈结果
            getDevTopolResp = new GetDeviceTopologyResponse(devTopType);
            strResponse = "调用成功";

        }
        catch (Exception ex)
        {
            strResponse = "调用失败";

            log.WriteErrLog("调用DeviceInterface.GetDeviceTopology 出错！");
            log.WriteErrLog(ex.ToString());
        }

        try
        {
            string strReqHeadXml = CreateInputText(request.RequestHead);
            RecordLogIntoDB(strReqHeadXml, strResponse, "ProvinceService.GetDeviceTopology_" + request.RequestHead.SourceSysID);
        }
        catch (Exception ex)
        {
            log.WriteErrLog("调用DeviceInterface.GetDeviceTopology 记录日志出错！");
            log.WriteErrLog(ex.ToString());
        }

        return getDevTopolResp;
    }

    public void NotifyDeviceParamDefChange(NotifyDeviceParamDefChange request)
    {
        string strResponse = "";

        try
        {
            //查询，生成服务地址
            string strUrl = GetServiceUrl("ProvinceData", request.RequestHead);
            if (strUrl[strUrl.Length - 1] != '/')
                strUrl += "/";

            strUrl += "device";

            //设置服务地址
            DeviceInterfaceClient devClient = new DeviceInterfaceClient(new BasicHttpBinding(), new EndpointAddress(strUrl));

            //调用服务
            devClient.NotifyDeviceParamDefChange(request.RequestHead, request.DeviceParameterList);

            //生成反馈结果
            strResponse = "调用成功";

        }
        catch (Exception ex)
        {
            strResponse = "调用失败";

            log.WriteErrLog("调用DeviceInterface.NotifyDeviceParamDefChange 出错！");
            log.WriteErrLog(ex.ToString());
        }

        try
        {
            string strReqHeadXml = CreateInputText(request.RequestHead);
            RecordLogIntoDB(strReqHeadXml, strResponse, "ProvinceService.NotifyDeviceParamDefChange_" + request.RequestHead.SourceSysID);
        }
        catch (Exception ex)
        {
            log.WriteErrLog("调用DeviceInterface.NotifyDeviceParamDefChange 记录日志出错！");
            log.WriteErrLog(ex.ToString());
        }
    }

    public void NotifyDeviceTypeChange(NotifyDeviceTypeChange request)
    {
        string strResponse = "";

        try
        {
            //查询，生成服务地址
            string strUrl = GetServiceUrl("ProvinceData", request.RequestHead);
            if (strUrl[strUrl.Length - 1] != '/')
                strUrl += "/";

            strUrl += "device";

            //设置服务地址
            DeviceInterfaceClient devClient = new DeviceInterfaceClient(new BasicHttpBinding(), new EndpointAddress(strUrl));

            //调用服务
            devClient.NotifyDeviceTypeChange(request.RequestHead, request.DeviceTypeList);

            //生成反馈结果
            strResponse = "调用成功";

        }
        catch (Exception ex)
        {
            strResponse = "调用失败";

            log.WriteErrLog("调用DeviceInterface.NotifyDeviceTypeChange 出错！");
            log.WriteErrLog(ex.ToString());
        }

        try
        {
            string strReqHeadXml = CreateInputText(request.RequestHead);
            RecordLogIntoDB(strReqHeadXml, strResponse, "ProvinceService.NotifyDeviceTypeChange_" + request.RequestHead.SourceSysID);
        }
        catch (Exception ex)
        {
            log.WriteErrLog("调用DeviceInterface.NotifyDeviceTypeChange 记录日志出错！");
            log.WriteErrLog(ex.ToString());
        }
    }

    public void NotifyManufacturerInfoChange(NotifyManufacturerInfoChange request)
    {
        string strResponse = "";

        try
        {
            //查询，生成服务地址
            string strUrl = GetServiceUrl("ProvinceData", request.RequestHead);
            if (strUrl[strUrl.Length - 1] != '/')
                strUrl += "/";

            strUrl += "device";

            //设置服务地址
            DeviceInterfaceClient devClient = new DeviceInterfaceClient(new BasicHttpBinding(), new EndpointAddress(strUrl));

            //调用服务
            devClient.NotifyManufacturerInfoChange(request.RequestHead,request.ManufacturerInfoList);

            //生成反馈结果
            strResponse = "调用成功";

        }
        catch (Exception ex)
        {
            strResponse = "调用失败";

            log.WriteErrLog("调用DeviceInterface.NotifyManufacturerInfoChange 出错！");
            log.WriteErrLog(ex.ToString());
        }

        try
        {
            string strReqHeadXml = CreateInputText(request.RequestHead);
            RecordLogIntoDB(strReqHeadXml, strResponse, "ProvinceService.NotifyManufacturerInfoChange_" + request.RequestHead.SourceSysID);
        }
        catch (Exception ex)
        {
            log.WriteErrLog("调用DeviceInterface.NotifyManufacturerInfoChange 记录日志出错！");
            log.WriteErrLog(ex.ToString());
        }
    }

    public GetParamValTrackBackResponse GetParamValTrackBack(GetParamValTrackBackRequest request)
    {
        string strResponse = "";
        GetParamValTrackBackResponse getParamValTrackBackResp = null;

        try
        {
            //查询，生成服务地址
            string strUrl = GetServiceUrl("ProvinceData", request.RequestHead);
            if (strUrl[strUrl.Length - 1] != '/')
                strUrl += "/";

            strUrl += "device";

            //设置服务地址
            DeviceInterfaceClient devClient = new DeviceInterfaceClient(new BasicHttpBinding(), new EndpointAddress(strUrl));

            //调用服务
            GetParamValTrackResponse getParamResp = devClient.GetParamValTrackBack(request.RequestHead, request.GetParamValTrackRequest);
            getParamValTrackBackResp = new GetParamValTrackBackResponse(getParamResp);

            //生成反馈结果
            strResponse = "调用成功";

        }
        catch (Exception ex)
        {
            strResponse = "调用失败";

            log.WriteErrLog("调用DeviceInterface.GetParamValTrackBack 出错！");
            log.WriteErrLog(ex.ToString());
        }

        try
        {
            string strReqHeadXml = CreateInputText(request.RequestHead);
            RecordLogIntoDB(strReqHeadXml, strResponse, "ProvinceService.GetParamValTrackBack_" + request.RequestHead.SourceSysID);
        }
        catch (Exception ex)
        {
            log.WriteErrLog("调用DeviceInterface.GetParamValTrackBack 记录日志出错！");
            log.WriteErrLog(ex.ToString());
        }

        return getParamValTrackBackResp;
    }

    public SetUploadTimeResponse SetUploadTime(SetUploadTimeRequest request)
    {
        string strResponse = "";
        SetUploadTimeResponse setUploadTimeResp = null;

        try
        {
            //查询，生成服务地址
            string strUrl = GetServiceUrl("ProvinceData", request.RequestHead);
            if (strUrl[strUrl.Length - 1] != '/')
                strUrl += "/";

            strUrl += "device";

            //设置服务地址
            DeviceInterfaceClient devClient = new DeviceInterfaceClient(new BasicHttpBinding(), new EndpointAddress(strUrl));

            //调用服务
            int nServiceReturn = devClient.SetUploadTime(request.RequestHead,request.time);
            setUploadTimeResp = new SetUploadTimeResponse(nServiceReturn);

            //生成反馈结果
            strResponse = "调用成功";

        }
        catch (Exception ex)
        {
            strResponse = "调用失败";

            log.WriteErrLog("调用DeviceInterface.SetUploadTime 出错！");
            log.WriteErrLog(ex.ToString());
        }

        try
        {
            string strReqHeadXml = CreateInputText(request.RequestHead);
            RecordLogIntoDB(strReqHeadXml, strResponse, "ProvinceService.SetUploadTime_" + request.RequestHead.SourceSysID);
        }
        catch (Exception ex)
        {
            log.WriteErrLog("调用DeviceInterface.SetUploadTime 记录日志出错！");
            log.WriteErrLog(ex.ToString());
        }

        return setUploadTimeResp;
    }

    //StuffInterface
    public GetStuffInfoResponse GetStuffInfo(GetStuffInfoRequest request)
    {
        string strResponse = "";
        GetStuffInfoResponse getStuffInfoResp = null;

        try
        {
            //查询，生成服务地址
            string strUrl = GetServiceUrl("ProvinceData", request.RequestHead);
            if (strUrl[strUrl.Length - 1] != '/')
                strUrl += "/";

            strUrl += "Stuff";

            //设置服务地址
            StuffInterfaceClient stuffClient = new StuffInterfaceClient(new BasicHttpBinding(), new EndpointAddress(strUrl));

            //调用服务
            StuffInfoType[] stuffTypes = stuffClient.GetStuffInfo(request.RequestHead,request.MonitorObjCode,request.stuffType);
            getStuffInfoResp = new GetStuffInfoResponse(stuffTypes);

            //生成反馈结果
            strResponse = "调用成功";

        }
        catch (Exception ex)
        {
            strResponse = "调用失败";

            log.WriteErrLog("调用Stuff.GetStuffInfo 出错！");
            log.WriteErrLog(ex.ToString());
        }

        try
        {
            string strReqHeadXml = CreateInputText(request.RequestHead);
            RecordLogIntoDB(strReqHeadXml, strResponse, "ProvinceService.GetStuffInfo_" + request.RequestHead.SourceSysID);
        }
        catch (Exception ex)
        {
            log.WriteErrLog("调用Stuff.GetStuffInfo 记录日志出错！");
            log.WriteErrLog(ex.ToString());
        }

        return getStuffInfoResp;
    }

    //MonitorObjInterface 
    public GetCatalogResponse GetCatalog(GetCatalogRequest request)
    {
        string strResponse = "";
        GetCatalogResponse getCatalogResp = null;

        try
        {
            //查询，生成服务地址
            string strUrl = GetServiceUrl("ProvinceData", request.RequestHead);
            if (strUrl[strUrl.Length - 1] != '/')
                strUrl += "/";

            strUrl += "MonitorObj";

            //设置服务地址
            MonitorObjInterfaceClient monClient = new MonitorObjInterfaceClient(new BasicHttpBinding(), new EndpointAddress(strUrl));

            //调用服务
            MonitorObjType monObjType = monClient.GetCatalog(request.RequestHead,request.MonitorObjCode);
            getCatalogResp = new GetCatalogResponse(monObjType);

            //生成反馈结果
            strResponse = "调用成功";

        }
        catch (Exception ex)
        {
            strResponse = "调用失败";

            log.WriteErrLog("调用MonitorObjInterface.GetCatalog 出错！");
            log.WriteErrLog(ex.ToString());
        }

        try
        {
            string strReqHeadXml = CreateInputText(request.RequestHead);
            RecordLogIntoDB(strReqHeadXml, strResponse, "MonitorObjInterface.GetCatalog_" + request.RequestHead.SourceSysID);
        }
        catch (Exception ex)
        {
            log.WriteErrLog("调用MonitorObjInterface.GetCatalog 记录日志出错！");
            log.WriteErrLog(ex.ToString());
        }

        return getCatalogResp;
    }

    public SetMonitorObjStatusResponse SetMonitorObjStatus(SetMonitorObjStatusRequest request)
    {
        string strResponse = "";
        SetMonitorObjStatusResponse setMonStatusResp = null;

        try
        {
            //查询，生成服务地址
            string strUrl = GetServiceUrl("ProvinceData", request.RequestHead);
            if (strUrl[strUrl.Length - 1] != '/')
                strUrl += "/";

            strUrl += "MonitorObj";

            //设置服务地址
            MonitorObjInterfaceClient monClient = new MonitorObjInterfaceClient(new BasicHttpBinding(), new EndpointAddress(strUrl));

            //调用服务
            int nReturn = monClient.SetMonitorObjStatus(request.RequestHead, request.MonitorObjCode, request.status);
            setMonStatusResp = new SetMonitorObjStatusResponse(nReturn);

            //生成反馈结果
            strResponse = "调用成功";

        }
        catch (Exception ex)
        {
            strResponse = "调用失败";

            log.WriteErrLog("调用MonitorObjInterface.SetMonitorObjStatus 出错！");
            log.WriteErrLog(ex.ToString());
        }

        try
        {
            string strReqHeadXml = CreateInputText(request.RequestHead);
            RecordLogIntoDB(strReqHeadXml, strResponse, "MonitorObjInterface.SetMonitorObjStatus_" + request.RequestHead.SourceSysID);
        }
        catch (Exception ex)
        {
            log.WriteErrLog("调用MonitorObjInterface.SetMonitorObjStatus 记录日志出错！");
            log.WriteErrLog(ex.ToString());
        }

        return setMonStatusResp;
    }

    public GetMonitorObjStatusResponse GetMonitorObjStatus(GetMonitorObjStatusRequest request)
    {
        string strResponse = "";
        GetMonitorObjStatusResponse getMonStatusResp = null;

        try
        {
            //查询，生成服务地址
            string strUrl = GetServiceUrl("ProvinceData", request.RequestHead);
            if (strUrl[strUrl.Length - 1] != '/')
                strUrl += "/";

            strUrl += "MonitorObj";

            //设置服务地址
            MonitorObjInterfaceClient monClient = new MonitorObjInterfaceClient(new BasicHttpBinding(), new EndpointAddress(strUrl));

            //调用服务
            int nReturn = monClient.GetMonitorObjStatus(request.RequestHead, request.MonitorObjCode);
            getMonStatusResp = new GetMonitorObjStatusResponse(nReturn);

            //生成反馈结果
            strResponse = "调用成功";

        }
        catch (Exception ex)
        {
            strResponse = "调用失败";

            log.WriteErrLog("调用MonitorObjInterface.GetMonitorObjStatus 出错！");
            log.WriteErrLog(ex.ToString());
        }

        try
        {
            string strReqHeadXml = CreateInputText(request.RequestHead);
            RecordLogIntoDB(strReqHeadXml, strResponse, "MonitorObjInterface.GetMonitorObjStatus_" + request.RequestHead.SourceSysID);
        }
        catch (Exception ex)
        {
            log.WriteErrLog("调用MonitorObjInterface.GetMonitorObjStatus 记录日志出错！");
            log.WriteErrLog(ex.ToString());
        }


        return getMonStatusResp;
    }

    //MaintenanceInterface
    public GetMaintenanceLogResponse GetMaintenanceLog(GetMaintenanceLogRequest request)
    {
        string strResponse = "";
        GetMaintenanceLogResponse getMainLogResp = null;

        try
        {
            //查询，生成服务地址
            string strUrl = GetServiceUrl("ProvinceData", request.RequestHead);
            if (strUrl[strUrl.Length - 1] != '/')
                strUrl += "/";

            strUrl += "Maintenance";

            //设置服务地址
            MaintenanceInterfaceClient mainClient = new MaintenanceInterfaceClient(new BasicHttpBinding(), new EndpointAddress(strUrl));

            //调用服务
            MaintenanceDataType[] serviceReturn = mainClient.GetMaintenanceLog(request.RequestHead,request.GetMTALogRequest);
            getMainLogResp = new GetMaintenanceLogResponse(serviceReturn);

            //生成反馈结果
            strResponse = "调用成功";

        }
        catch (Exception ex)
        {
            strResponse = "调用失败";

            log.WriteErrLog("调用MaintenanceInterface.GetMaintenanceLog 出错！");
            log.WriteErrLog(ex.ToString());
        }

        try
        {
            string strReqHeadXml = CreateInputText(request.RequestHead);
            RecordLogIntoDB(strReqHeadXml, strResponse, "MaintenanceInterface.GetMaintenanceLog_" + request.RequestHead.SourceSysID);
        }
        catch (Exception ex)
        {
            log.WriteErrLog("调用MaintenanceInterface.GetMaintenanceLog 记录日志出错！");
            log.WriteErrLog(ex.ToString());
        }

        return getMainLogResp;
    }

    public void SendMTAMessage(SendMTAMessage request)
    {
        string strResponse = "";

        try
        {
            //查询，生成服务地址
            string strUrl = GetServiceUrl("ProvinceData", request.RequestHead);
            if (strUrl[strUrl.Length - 1] != '/')
                strUrl += "/";

            strUrl += "Maintenance";

            //设置服务地址
            MaintenanceInterfaceClient mainClient = new MaintenanceInterfaceClient(new BasicHttpBinding(), new EndpointAddress(strUrl));

            //调用服务
            mainClient.SendMTAMessage(request.RequestHead,request.MTAMessageData);
            

            //生成反馈结果
            strResponse = "调用成功";

        }
        catch (Exception ex)
        {
            strResponse = "调用失败";

            log.WriteErrLog("调用MaintenanceInterface.SendMTAMessage 出错！");
            log.WriteErrLog(ex.ToString());
        }

        try
        {
            string strReqHeadXml = CreateInputText(request.RequestHead);
            RecordLogIntoDB(strReqHeadXml, strResponse, "MaintenanceInterface.SendMTAMessage_" + request.RequestHead.SourceSysID);
        }
        catch (Exception ex)
        {
            log.WriteErrLog("调用MaintenanceInterface.SendMTAMessage 记录日志出错！");
            log.WriteErrLog(ex.ToString());
        }

    }

    public void NotifyMTAExtendableDef(NotifyMTAExtendableDef request)
    {
        string strResponse = "";

        try
        {
            //查询，生成服务地址
            string strUrl = GetServiceUrl("ProvinceData", request.RequestHead);
            if (strUrl[strUrl.Length - 1] != '/')
                strUrl += "/";

            strUrl += "Maintenance";

            //设置服务地址
            MaintenanceInterfaceClient mainClient = new MaintenanceInterfaceClient(new BasicHttpBinding(), new EndpointAddress(strUrl));

            //调用服务
            mainClient.NotifyMTAExtendableDef(request.RequestHead,request.MTADataExtensionDef);

            //生成反馈结果
            strResponse = "调用成功";

        }
        catch (Exception ex)
        {
            strResponse = "调用失败";

            log.WriteErrLog("调用MaintenanceInterface.NotifyMTAExtendableDef 出错！");
            log.WriteErrLog(ex.ToString());
        }

        try
        {
            string strReqHeadXml = CreateInputText(request.RequestHead);
            RecordLogIntoDB(strReqHeadXml, strResponse, "MaintenanceInterface.NotifyMTAExtendableDef_" + request.RequestHead.SourceSysID);
        }
        catch (Exception ex)
        {
            log.WriteErrLog("调用MaintenanceInterface.NotifyMTAExtendableDef 记录日志出错！");
            log.WriteErrLog(ex.ToString());
        }
    }

    public GetMonitorObjVersionResponse GetMonitorObjVersion(GetMonitorObjVersionRequest request)
    {
        string strResponse = "";
        GetMonitorObjVersionResponse getMonObjVersion = null;

        try
        {
            //查询，生成服务地址
            string strUrl = GetServiceUrl("ProvinceData", request.RequestHead);
            if (strUrl[strUrl.Length - 1] != '/')
                strUrl += "/";

            strUrl += "Maintenance";

            //设置服务地址
            MaintenanceInterfaceClient mainClient = new MaintenanceInterfaceClient(new BasicHttpBinding(), new EndpointAddress(strUrl));

            //调用服务
            DataVersionType serviceReturn = mainClient.GetMonitorObjVersion(request.RequestHead,request.MonitorObjCode);
            getMonObjVersion = new GetMonitorObjVersionResponse(serviceReturn);

            //生成反馈结果
            strResponse = "调用成功";

        }
        catch (Exception ex)
        {
            strResponse = "调用失败";

            log.WriteErrLog("调用MaintenanceInterface.GetMonitorObjVersion 出错！");
            log.WriteErrLog(ex.ToString());
        }

        try
        {
            string strReqHeadXml = CreateInputText(request.RequestHead);
            RecordLogIntoDB(strReqHeadXml, strResponse, "MaintenanceInterface.GetMonitorObjVersion_" + request.RequestHead.SourceSysID);
        }
        catch (Exception ex)
        {
            log.WriteErrLog("调用MaintenanceInterface.GetMonitorObjVersion 记录日志出错！");
            log.WriteErrLog(ex.ToString());
        }

        return getMonObjVersion;
    }
}
