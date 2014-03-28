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
public class SubPlatformWebService : DeviceInterface, StuffInterface, MonitorObjInterface, MaintenanceInterface
{
    CSQLDBCtrl SQLDBCtrl = null;

    public SubPlatformWebService()
    {
        Config.ReadConfig();

        SQLDBCtrl = new CSQLDBCtrl();
        SQLDBCtrl.SetDBProgram(Config.DBServer, Config.DBName, Config.DBUser, Config.DBPasswd);
        if (!SQLDBCtrl.OpenDB())
        {
            SQLDBCtrl = null;
            log.WriteErrLog("open数据库失败");
            return;
        }
    }

    ~SubPlatformWebService()
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

    public string CreateInputText(requestHead reqHead)
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
            requestChildNd.InnerText = reqHead.sourceSysID;
            requestHeadNd.AppendChild(requestChildNd);

            requestChildNd = (XmlNode)xmlDoc.CreateElement("TargetSysID");
            requestChildNd.InnerText = reqHead.targetSysID;
            requestHeadNd.AppendChild(requestChildNd);

            requestChildNd = (XmlNode)xmlDoc.CreateElement("TargetServiceName");
            requestChildNd.InnerText = reqHead.targetServiceName;
            requestHeadNd.AppendChild(requestChildNd);

            requestChildNd = (XmlNode)xmlDoc.CreateElement("TimeStamp");
            requestChildNd.InnerText = reqHead.timeStamp.ToString();
            requestHeadNd.AppendChild(requestChildNd);

            requestChildNd = (XmlNode)xmlDoc.CreateElement("DataType");
            requestChildNd.InnerText = reqHead.dataType.ToString();
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

    public string GetServiceUrl(string strServiceName, requestHead requestHeadInfo)
    {

        if (SQLDBCtrl == null)
            return "";
        try
        {
            string strUrl = "";

            string strSQL = "select service_url from eab_service where service_name='";
            strSQL += strServiceName;
            strSQL += "_";
            strSQL += requestHeadInfo.targetSysID;
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
    public getDeviceListResponse getDeviceList(getDeviceListRequest request)
    {
        string strResponse = "";
        getDeviceListResponse getDevListResp = null;

        try
        {
            //查询，生成服务地址
            string strUrl = GetServiceUrl("SubPlateform", request.deviceListRequest.requestHead);
            if (strUrl[strUrl.Length - 1] != '/')
                strUrl += "/";

            strUrl += "device";

            //设置服务地址
            DeviceInterfaceClient devClient = new DeviceInterfaceClient(new BasicHttpBinding(), new EndpointAddress(strUrl));

            //调用服务
            deviceListResponse devInfoTypes = devClient.getDeviceList(request.deviceListRequest);

            //生成反馈结果
            getDevListResp = new getDeviceListResponse(devInfoTypes);
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
            string strReqHeadXml = CreateInputText(request.deviceListRequest.requestHead);
            RecordLogIntoDB(strReqHeadXml, strResponse, "ProvinceService.GetDeviceList_" + request.deviceListRequest.requestHead.sourceSysID);
        }
        catch (Exception ex)
        {
            log.WriteErrLog("调用DeviceInterface.GetDeviceTypes 记录日志出错！");
            log.WriteErrLog(ex.ToString());
        }

        return getDevListResp;
    }

    public getParamValueResponse getDeviceParameterValue(getParamValueRequest request)
    {
        string strResponse = "";
        getParamValueResponse getDevParamValueResp = null;

        try
        {
            //查询，生成服务地址
            string strUrl = GetServiceUrl("SubPlateform", request.getParamValRequest.requestHead);
            if (strUrl[strUrl.Length - 1] != '/')
                strUrl += "/";

            strUrl += "device";

            //设置服务地址
            DeviceInterfaceClient devClient = new DeviceInterfaceClient(new BasicHttpBinding(), new EndpointAddress(strUrl));

            //调用服务
            getParamValResponse getValResp = devClient.getDeviceParameterValue(request.getParamValRequest);

            //生成反馈结果
            getDevParamValueResp = new getParamValueResponse(getValResp);
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
            string strReqHeadXml = CreateInputText(request.getParamValRequest.requestHead);
            RecordLogIntoDB(strReqHeadXml, strResponse, "ProvinceService.GetDeviceParameterValue_" + request.getParamValRequest.requestHead.sourceSysID);
        }
        catch (Exception ex)
        {
            log.WriteErrLog("调用DeviceInterface.GetDeviceParameterValue 记录日志出错！");
            log.WriteErrLog(ex.ToString());
        }

        return getDevParamValueResp;
    }

    public getProductDataResponse1 getProductDataset(getProductDataRequest1 request)
    {
        string strResponse = "";
        getProductDataResponse1 getProductDataSetResp = null;

        try
        {
            //查询，生成服务地址
            string strUrl = GetServiceUrl("SubPlateform", request.getProductDataRequest.requestHead);
            if (strUrl[strUrl.Length - 1] != '/')
                strUrl += "/";

            strUrl += "device";

            //设置服务地址
            DeviceInterfaceClient devClient = new DeviceInterfaceClient(new BasicHttpBinding(), new EndpointAddress(strUrl));

            //调用服务
            getProductDataResponse getProResp = devClient.getProductDataset(request.getProductDataRequest);
            //生成反馈结果
            getProductDataSetResp = new getProductDataResponse1(getProResp);
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
            string strReqHeadXml = CreateInputText(request.getProductDataRequest.requestHead);
            RecordLogIntoDB(strReqHeadXml, strResponse, "ProvinceService.GetDeviceParameterValue_" + request.getProductDataRequest.requestHead.sourceSysID);
        }
        catch (Exception ex)
        {
            log.WriteErrLog("调用DeviceInterface.GetDeviceParameterValue 记录日志出错！");
            log.WriteErrLog(ex.ToString());
        }

        return getProductDataSetResp;
    }

    public getDeviceTopologyResponse getDeviceTopology(getDeviceTopologyRequest request)
    {
        string strResponse = "";
        getDeviceTopologyResponse getDevTopolResp = null;

        try
        {
            //查询，生成服务地址
            string strUrl = GetServiceUrl("SubPlateform", request.deviceTopologyRequest.requestHead);
            if (strUrl[strUrl.Length - 1] != '/')
                strUrl += "/";

            strUrl += "device";

            //设置服务地址
            DeviceInterfaceClient devClient = new DeviceInterfaceClient(new BasicHttpBinding(), new EndpointAddress(strUrl));

            //调用服务
            deviceTopologyResponse devTopType = devClient.getDeviceTopology(request.deviceTopologyRequest);

            //生成反馈结果
            getDevTopolResp = new getDeviceTopologyResponse(devTopType);
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
            string strReqHeadXml = CreateInputText(request.deviceTopologyRequest.requestHead);
            RecordLogIntoDB(strReqHeadXml, strResponse, "ProvinceService.GetDeviceTopology_" + request.deviceTopologyRequest.requestHead.sourceSysID);
        }
        catch (Exception ex)
        {
            log.WriteErrLog("调用DeviceInterface.GetDeviceTopology 记录日志出错！");
            log.WriteErrLog(ex.ToString());
        }

        return getDevTopolResp;
    }

    public notifyParamDefResponse notifyDeviceParamDefChange(notifyParamDefChangeRequest request)
    {
        string strResponse = "";
        notifyParamDefResponse notifyDefResp = null;

        try
        {
            //查询，生成服务地址
            string strUrl = GetServiceUrl("SubPlateform", request.deviceParameterListRequest.requestHead);
            if (strUrl[strUrl.Length - 1] != '/')
                strUrl += "/";

            strUrl += "device";

            //设置服务地址
            DeviceInterfaceClient devClient = new DeviceInterfaceClient(new BasicHttpBinding(), new EndpointAddress(strUrl));

            //调用服务
            int nServiceReturn = devClient.notifyDeviceParamDefChange(request.deviceParameterListRequest);
            notifyDefResp = new notifyParamDefResponse(nServiceReturn);
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
            string strReqHeadXml = CreateInputText(request.deviceParameterListRequest.requestHead);
            RecordLogIntoDB(strReqHeadXml, strResponse, "ProvinceService.NotifyDeviceParamDefChange_" + request.deviceParameterListRequest.requestHead.sourceSysID);
        }
        catch (Exception ex)
        {
            log.WriteErrLog("调用DeviceInterface.NotifyDeviceParamDefChange 记录日志出错！");
            log.WriteErrLog(ex.ToString());
        }

        return notifyDefResp;
    }

    public notifyDeviceTypeChangeResponse notifyDeviceTypeChange(notifyDeviceTypeChangeRequest request)
    {
        string strResponse = "";
        notifyDeviceTypeChangeResponse notifyDevResp = null;

        try
        {
            //查询，生成服务地址
            string strUrl = GetServiceUrl("SubPlateform", request.deviceTypeChangeRequest.requestHead);
            if (strUrl[strUrl.Length - 1] != '/')
                strUrl += "/";

            strUrl += "device";

            //设置服务地址
            DeviceInterfaceClient devClient = new DeviceInterfaceClient(new BasicHttpBinding(), new EndpointAddress(strUrl));

            //调用服务
            int nServiceReturn = devClient.notifyDeviceTypeChange(request.deviceTypeChangeRequest);
            notifyDevResp = new notifyDeviceTypeChangeResponse(nServiceReturn);
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
            string strReqHeadXml = CreateInputText(request.deviceTypeChangeRequest.requestHead);
            RecordLogIntoDB(strReqHeadXml, strResponse, "ProvinceService.NotifyDeviceTypeChange_" + request.deviceTypeChangeRequest.requestHead.sourceSysID);
        }
        catch (Exception ex)
        {
            log.WriteErrLog("调用DeviceInterface.NotifyDeviceTypeChange 记录日志出错！");
            log.WriteErrLog(ex.ToString());
        }

        return notifyDevResp;
    }

    public notifyManufatureCHGResponse notifyManufacturerInfoChange(notifyManufactCHGRequest request)
    {
        string strResponse = "";
        notifyManufatureCHGResponse notifyManuResp = null;

        try
        {
            //查询，生成服务地址
            string strUrl = GetServiceUrl("SubPlateform", request.manufacturerChangeRequest.requestHead);
            if (strUrl[strUrl.Length - 1] != '/')
                strUrl += "/";

            strUrl += "device";

            //设置服务地址
            DeviceInterfaceClient devClient = new DeviceInterfaceClient(new BasicHttpBinding(), new EndpointAddress(strUrl));

            //调用服务
            int nServiceReturn = devClient.notifyManufacturerInfoChange(request.manufacturerChangeRequest);
            notifyManuResp = new notifyManufatureCHGResponse(nServiceReturn);
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
            string strReqHeadXml = CreateInputText(request.manufacturerChangeRequest.requestHead);
            RecordLogIntoDB(strReqHeadXml, strResponse, "ProvinceService.NotifyManufacturerInfoChange_" + request.manufacturerChangeRequest.requestHead.sourceSysID);
        }
        catch (Exception ex)
        {
            log.WriteErrLog("调用DeviceInterface.NotifyManufacturerInfoChange 记录日志出错！");
            log.WriteErrLog(ex.ToString());
        }

        return notifyManuResp;
    }

    public getParamTrackBackValResponse getParamValTrackBack(getParamTrackBackValRequest request)
    {
        string strResponse = "";
        getParamTrackBackValResponse getParamValTrackBackResp = null;

        try
        {
            //查询，生成服务地址
            string strUrl = GetServiceUrl("SubPlateform", request.getParamValTrackRequest.requestHead);
            if (strUrl[strUrl.Length - 1] != '/')
                strUrl += "/";

            strUrl += "device";

            //设置服务地址
            DeviceInterfaceClient devClient = new DeviceInterfaceClient(new BasicHttpBinding(), new EndpointAddress(strUrl));

            //调用服务
            getParamValTrackResponse getParamResp = devClient.getParamValTrackBack(request.getParamValTrackRequest);
            getParamValTrackBackResp = new getParamTrackBackValResponse(getParamResp);

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
            string strReqHeadXml = CreateInputText(request.getParamValTrackRequest.requestHead);
            RecordLogIntoDB(strReqHeadXml, strResponse, "ProvinceService.GetParamValTrackBack_" + request.getParamValTrackRequest.requestHead.sourceSysID);
        }
        catch (Exception ex)
        {
            log.WriteErrLog("调用DeviceInterface.GetParamValTrackBack 记录日志出错！");
            log.WriteErrLog(ex.ToString());
        }

        return getParamValTrackBackResp;
    }

    public setUploadTimeResponse setUploadTime(setUploadTimeRequest request)
    {
        string strResponse = "";
        setUploadTimeResponse setUploadTimeResp = null;

        try
        {
            //查询，生成服务地址
            string strUrl = GetServiceUrl("SubPlateform", request.uploadTimeRequest.requestHead);
            if (strUrl[strUrl.Length - 1] != '/')
                strUrl += "/";

            strUrl += "device";

            //设置服务地址
            DeviceInterfaceClient devClient = new DeviceInterfaceClient(new BasicHttpBinding(), new EndpointAddress(strUrl));

            //调用服务
            uploadTimeResponse uploadResp = devClient.setUploadTime(request.uploadTimeRequest);
            setUploadTimeResp = new setUploadTimeResponse(uploadResp);

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
            string strReqHeadXml = CreateInputText(request.uploadTimeRequest.requestHead);
            RecordLogIntoDB(strReqHeadXml, strResponse, "ProvinceService.SetUploadTime_" + request.uploadTimeRequest.requestHead.sourceSysID);
        }
        catch (Exception ex)
        {
            log.WriteErrLog("调用DeviceInterface.SetUploadTime 记录日志出错！");
            log.WriteErrLog(ex.ToString());
        }

        return setUploadTimeResp;
    }

    //StuffInterface
    public getStuffInfoResponse getStuffInfo(getStuffInfoRequest request)
    {
        string strResponse = "";
        getStuffInfoResponse getStuffInfoResp = null;

        try
        {
            //查询，生成服务地址
            string strUrl = GetServiceUrl("SubPlateform", request.stuffInfoRequest.requestHead);
            if (strUrl[strUrl.Length - 1] != '/')
                strUrl += "/";

            strUrl += "Stuff";

            //设置服务地址
            StuffInterfaceClient stuffClient = new StuffInterfaceClient(new BasicHttpBinding(), new EndpointAddress(strUrl));

            //调用服务
            stuffInfoResponse stuffTypes = stuffClient.getStuffInfo(request.stuffInfoRequest);
            getStuffInfoResp = new getStuffInfoResponse(stuffTypes);

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
            string strReqHeadXml = CreateInputText(request.stuffInfoRequest.requestHead);
            RecordLogIntoDB(strReqHeadXml, strResponse, "ProvinceService.GetStuffInfo_" + request.stuffInfoRequest.requestHead.sourceSysID);
        }
        catch (Exception ex)
        {
            log.WriteErrLog("调用Stuff.GetStuffInfo 记录日志出错！");
            log.WriteErrLog(ex.ToString());
        }

        return getStuffInfoResp;
    }

    //MonitorObjInterface 
    public getMonitorCatalogResponse getCatalog(getMonitorCatalogRequest request)
    {
        string strResponse = "";
        getMonitorCatalogResponse getCatalogResp = null;

        try
        {
            //查询，生成服务地址
            string strUrl = GetServiceUrl("SubPlateform", request.monitorObjCatalogRequest.requestHead);
            if (strUrl[strUrl.Length - 1] != '/')
                strUrl += "/";

            strUrl += "MonitorObj";

            //设置服务地址
            MonitorObjInterfaceClient monClient = new MonitorObjInterfaceClient(new BasicHttpBinding(), new EndpointAddress(strUrl));

            //调用服务
            monitorObjCatalogResponse monObjType = monClient.getCatalog(request.monitorObjCatalogRequest);
            getCatalogResp = new getMonitorCatalogResponse(monObjType);

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
            string strReqHeadXml = CreateInputText(request.monitorObjCatalogRequest.requestHead);
            RecordLogIntoDB(strReqHeadXml, strResponse, "MonitorObjInterface.GetCatalog_" + request.monitorObjCatalogRequest.requestHead.sourceSysID);
        }
        catch (Exception ex)
        {
            log.WriteErrLog("调用MonitorObjInterface.GetCatalog 记录日志出错！");
            log.WriteErrLog(ex.ToString());
        }

        return getCatalogResp;
    }

    public setStatusResponse1 setMonitorObjStatus(setStatusRequest1 request)
    {
        string strResponse = "";
        setStatusResponse1 setMonStatusResp = null;

        try
        {
            //查询，生成服务地址
            string strUrl = GetServiceUrl("SubPlateform", request.setStatusRequest.requestHead);
            if (strUrl[strUrl.Length - 1] != '/')
                strUrl += "/";

            strUrl += "MonitorObj";

            //设置服务地址
            MonitorObjInterfaceClient monClient = new MonitorObjInterfaceClient(new BasicHttpBinding(), new EndpointAddress(strUrl));

            //调用服务
            setStatusResponse nReturn = monClient.setMonitorObjStatus(request.setStatusRequest);
            setMonStatusResp = new setStatusResponse1(nReturn);

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
            string strReqHeadXml = CreateInputText(request.setStatusRequest.requestHead);
            RecordLogIntoDB(strReqHeadXml, strResponse, "MonitorObjInterface.SetMonitorObjStatus_" + request.setStatusRequest.requestHead.sourceSysID);
        }
        catch (Exception ex)
        {
            log.WriteErrLog("调用MonitorObjInterface.SetMonitorObjStatus 记录日志出错！");
            log.WriteErrLog(ex.ToString());
        }

        return setMonStatusResp;
    }

    public getStatusResponse1 getMonitorObjStatus(getStatusRequest1 request)
    {
        string strResponse = "";
        getStatusResponse1 getMonStatusResp = null;

        try
        {
            //查询，生成服务地址
            string strUrl = GetServiceUrl("SubPlateform", request.getStatusRequest.requestHead);
            if (strUrl[strUrl.Length - 1] != '/')
                strUrl += "/";

            strUrl += "MonitorObj";

            //设置服务地址
            MonitorObjInterfaceClient monClient = new MonitorObjInterfaceClient(new BasicHttpBinding(), new EndpointAddress(strUrl));

            //调用服务
            getStatusResponse gReturn = monClient.getMonitorObjStatus(request.getStatusRequest);
            getMonStatusResp = new getStatusResponse1(gReturn);

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
            string strReqHeadXml = CreateInputText(request.getStatusRequest.requestHead);
            RecordLogIntoDB(strReqHeadXml, strResponse, "MonitorObjInterface.GetMonitorObjStatus_" + request.getStatusRequest.requestHead.sourceSysID);
        }
        catch (Exception ex)
        {
            log.WriteErrLog("调用MonitorObjInterface.GetMonitorObjStatus 记录日志出错！");
            log.WriteErrLog(ex.ToString());
        }


        return getMonStatusResp;
    }

    //MaintenanceInterface
    public getMaintenanceLogResponse getMaintenanceLog(getMaintenanceLogRequest request)
    {
        string strResponse = "";
        getMaintenanceLogResponse getMainLogResp = null;

        try
        {
            //查询，生成服务地址
            string strUrl = GetServiceUrl("SubPlateform", request.mtaLogRequest.requestHead);
            if (strUrl[strUrl.Length - 1] != '/')
                strUrl += "/";

            strUrl += "Maintenance";

            //设置服务地址
            MaintenanceInterfaceClient mainClient = new MaintenanceInterfaceClient(new BasicHttpBinding(), new EndpointAddress(strUrl));

            //调用服务
            mtaLogResponse serviceReturn = mainClient.getMaintenanceLog(request.mtaLogRequest);
            getMainLogResp = new getMaintenanceLogResponse(serviceReturn);

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
            string strReqHeadXml = CreateInputText(request.mtaLogRequest.requestHead);
            RecordLogIntoDB(strReqHeadXml, strResponse, "MaintenanceInterface.GetMaintenanceLog_" + request.mtaLogRequest.requestHead.sourceSysID);
        }
        catch (Exception ex)
        {
            log.WriteErrLog("调用MaintenanceInterface.GetMaintenanceLog 记录日志出错！");
            log.WriteErrLog(ex.ToString());
        }

        return getMainLogResp;
    }

    public messageResponse sendMTAMessage(messageRequest request)
    {
        string strResponse = "";
        messageResponse messageResp = null;

        try
        {
            //查询，生成服务地址
            string strUrl = GetServiceUrl("SubPlateform", request.mtaMessageRequest.requestHead);
            if (strUrl[strUrl.Length - 1] != '/')
                strUrl += "/";

            strUrl += "Maintenance";

            //设置服务地址
            MaintenanceInterfaceClient mainClient = new MaintenanceInterfaceClient(new BasicHttpBinding(), new EndpointAddress(strUrl));

            //调用服务
            int nReturn = mainClient.sendMTAMessage(request.mtaMessageRequest);
            messageResp = new messageResponse(nReturn);

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
            string strReqHeadXml = CreateInputText(request.mtaMessageRequest.requestHead);
            RecordLogIntoDB(strReqHeadXml, strResponse, "MaintenanceInterface.SendMTAMessage_" + request.mtaMessageRequest.requestHead.sourceSysID);
        }
        catch (Exception ex)
        {
            log.WriteErrLog("调用MaintenanceInterface.SendMTAMessage 记录日志出错！");
            log.WriteErrLog(ex.ToString());
        }

        return messageResp;
    }

    public mtaExtenableDefResponse notifyMTAExtendableDef(mtaExtendableDefRequest1 request)
    {
        string strResponse = "";
        mtaExtenableDefResponse mtaExtenResp = null;

        try
        {
            //查询，生成服务地址
            string strUrl = GetServiceUrl("SubPlateform", request.mtaExtendableDefRequest.requestHead);
            if (strUrl[strUrl.Length - 1] != '/')
                strUrl += "/";

            strUrl += "Maintenance";

            //设置服务地址
            MaintenanceInterfaceClient mainClient = new MaintenanceInterfaceClient(new BasicHttpBinding(), new EndpointAddress(strUrl));

            //调用服务
            int nReturn  = mainClient.notifyMTAExtendableDef(request.mtaExtendableDefRequest);
            mtaExtenResp = new mtaExtenableDefResponse(nReturn);

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
            string strReqHeadXml = CreateInputText(request.mtaExtendableDefRequest.requestHead);
            RecordLogIntoDB(strReqHeadXml, strResponse, "MaintenanceInterface.NotifyMTAExtendableDef_" + request.mtaExtendableDefRequest.requestHead.sourceSysID);
        }
        catch (Exception ex)
        {
            log.WriteErrLog("调用MaintenanceInterface.NotifyMTAExtendableDef 记录日志出错！");
            log.WriteErrLog(ex.ToString());
        }

        return mtaExtenResp;
    }

    public getMonitorObjVersionResponse getMonitorObjVersion(getMonitorObjVersionRequest request)
    {
        string strResponse = "";
        getMonitorObjVersionResponse getMonObjVersion = null;

        try
        {
            //查询，生成服务地址
            string strUrl = GetServiceUrl("SubPlateform", request.dataVersionRequest.requestHead);
            if (strUrl[strUrl.Length - 1] != '/')
                strUrl += "/";

            strUrl += "Maintenance";

            //设置服务地址
            MaintenanceInterfaceClient mainClient = new MaintenanceInterfaceClient(new BasicHttpBinding(), new EndpointAddress(strUrl));

            //调用服务
            dataVersionResponse serviceReturn = mainClient.getMonitorObjVersion(request.dataVersionRequest);
            getMonObjVersion = new getMonitorObjVersionResponse(serviceReturn);

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
            string strReqHeadXml = CreateInputText(request.dataVersionRequest.requestHead);
            RecordLogIntoDB(strReqHeadXml, strResponse, "MaintenanceInterface.GetMonitorObjVersion_" + request.dataVersionRequest.requestHead.sourceSysID);
        }
        catch (Exception ex)
        {
            log.WriteErrLog("调用MaintenanceInterface.GetMonitorObjVersion 记录日志出错！");
            log.WriteErrLog(ex.ToString());
        }

        return getMonObjVersion;
    }
}
