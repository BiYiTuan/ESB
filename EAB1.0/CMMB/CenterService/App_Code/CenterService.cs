using System;
using System.Collections.Generic;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using System.Data;
using System.Data.Odbc;
using System.Xml;
using System.IO;
using zlLib;

// 注意: 如果更改此处的类名“Service”，也必须更新 Web.config 和关联的 .svc 文件中对“Service”的引用。
[ServiceBehavior]
public class CenterService : DeviceInterface, MonitorObjInterface, MaintenanceInterface
{
    CSQLDBCtrl SQLDBCtrl = null;

    //构造函数
    public CenterService()
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

    //析构函数
    ~CenterService()
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
        public getDeviceTypesResponse getDeviceTypes(getDeviceTypesRequest request)
        {
            string strResponse = "";
            getDeviceTypesResponse devTypeResponse = null;
            try
            {
                //查询，生成服务地址
                string strUrl = GetServiceUrl("CenterService");
                if (strUrl[strUrl.Length - 1] != '/')
                    strUrl += "/";

                strUrl += "device";

                //设置服务地址
                DeviceInterfaceClient devClient = new DeviceInterfaceClient(new BasicHttpBinding(), new EndpointAddress(strUrl));

                //调用服务
                deviceTypeInfo[] devInfoTypes = devClient.getDeviceTypes(request.requestHead);

                //生成反馈结果
                devTypeResponse = new getDeviceTypesResponse(devInfoTypes);
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
                string strReqHeadXml = CreateInputText(request.requestHead);
                RecordLogIntoDB(strReqHeadXml, strResponse, "CenterService.GetDeviceTypes");
            }
            catch (Exception ex)
            {
                log.WriteErrLog("调用DeviceInterface.GetDeviceTypes 记录日志出错！");
                log.WriteErrLog(ex.ToString());
            }

            return devTypeResponse;
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

        public string RecordLogIntoDB(string strInMessage,string strOutMessage, string strServiceType)
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

        public string GetServiceUrl(string strServiceName)
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
                strUrl = Convert.ToString(data.Tables[0].Rows[0][0]);
                
                //SQLDBCtrl.CloseDB();

                return strUrl;
            }
            catch(Exception ex)
            {
                log.WriteErrLog("GetServiceUrl出错!");
                log.WriteErrLog(ex.ToString());

                return "";
            }

        }

        public getDeviceParameterDefinitionResponse getDeviceParameterDefinition(getDeviceParameterDefinitionRequest request)
        {
            string strResponse = "";
            getDeviceParameterDefinitionResponse devParamDef = null;

            try
            {
                //查询，生成服务地址
                string strUrl = GetServiceUrl("CenterService");
                if (strUrl[strUrl.Length - 1] != '/')
                    strUrl += "/";

                strUrl += "device";

                //设置服务地址
                DeviceInterfaceClient devClient = new DeviceInterfaceClient(new BasicHttpBinding(), new EndpointAddress(strUrl));

                deviceParameterList devParamList = devClient.getDeviceParameterDefinition(request.requestHead, request.deviceTypeCode);

                devParamDef = new getDeviceParameterDefinitionResponse(devParamList);
                strResponse = "调用成功";
            }
            catch (Exception ex)
            {
                log.WriteErrLog("调用DeviceInterface.GetDeviceParameterDefinition 出错！");
                log.WriteErrLog(ex.ToString());
                strResponse = "调用失败";
            }

            try
            {
                string strReqHeadXml = CreateInputText(request.requestHead);
                RecordLogIntoDB(strReqHeadXml, strResponse,"CenterService.GetDeviceParameterDefinition");
            }
            catch (Exception ex)
            {
                log.WriteErrLog("调用DeviceInterface.GetDeviceParameterDefinition 记录日志出错！");
                log.WriteErrLog(ex.ToString());
            }

            return devParamDef;
        }

        public notifyDataInfoResponse notifyDataInfo(notifyDataInfoRequest request)
        {
            string strResponse = "";
            notifyDataInfoResponse notifyResp = null;
            try
            {
                //查询，生成服务地址
                string strUrl = GetServiceUrl("CenterService");
                if (strUrl[strUrl.Length - 1] != '/')
                    strUrl += "/";

                strUrl += "device";
                //设置服务地址
                DeviceInterfaceClient devClient = new DeviceInterfaceClient(new BasicHttpBinding(), new EndpointAddress(strUrl));
                int nServiceReturn = devClient.notifyDataInfo(request.requestHead, request.notifyData);
                notifyResp = new notifyDataInfoResponse(nServiceReturn);

                strResponse = "调用成功";

            }
            catch (Exception ex)
            {
                log.WriteErrLog("调用DeviceInterface.NotifyDataInfo 出错！");
                log.WriteErrLog(ex.ToString());
                strResponse = "调用失败";
            }

            try
            {
                string strReqHeadXml = CreateInputText(request.requestHead);
                RecordLogIntoDB(strReqHeadXml, strResponse,"CenterService.NotifyDataInfo");
            }
            catch (Exception ex)
            {
                log.WriteErrLog("调用DeviceInterface.GetDeviceParameterDefinition 记录日志出错！");
                log.WriteErrLog(ex.ToString());
            }

            return notifyResp;
        }

        public getManufacturerInfoResponse getManufacturerInfo(getManufacturerInfoRequest request)
        {
            getManufacturerInfoResponse manuInfoResp = null;
            string strResponse = "";
 
            try
            {
                //查询，生成服务地址
                string strUrl = GetServiceUrl("CenterService");
                if (strUrl[strUrl.Length - 1] != '/')
                    strUrl += "/";

                strUrl += "device";

                //设置服务地址
                DeviceInterfaceClient devClient = new DeviceInterfaceClient(new BasicHttpBinding(), new EndpointAddress(strUrl));

                //调用服务
                manufacturerInfoType[] manuFactureInfoTypes = devClient.getManufacturerInfo(request.requestHead);

                //生成反馈结果
                manuInfoResp = new getManufacturerInfoResponse(manuFactureInfoTypes);
                strResponse = "调用成功";

            }
            catch (Exception ex)
            {
                strResponse = "调用失败";

                log.WriteErrLog("调用DeviceInterface.GetManufacturerInfo 出错！");
                log.WriteErrLog(ex.ToString());
            }

            try
            {
                string strReqHeadXml = CreateInputText(request.requestHead);
                RecordLogIntoDB(strReqHeadXml, strResponse, "CenterService.GetManufacturerInfo");
            }
            catch (Exception ex)
            {
                log.WriteErrLog("调用DeviceInterface.GetManufacturerInfo 记录日志出错！");
                log.WriteErrLog(ex.ToString());
            }

            return manuInfoResp;
        }

        public notifyUploadEventResponse notifyUploadEvent(notifyUploadEventRequest request)
        {
            string strResponse = "";
            notifyUploadEventResponse nuResponse = null;

            try
            {
                //查询，生成服务地址
                string strUrl = GetServiceUrl("CenterService");
                if (strUrl[strUrl.Length - 1] != '/')
                    strUrl += "/";

                strUrl += "device";

                //设置服务地址
                DeviceInterfaceClient devClient = new DeviceInterfaceClient(new BasicHttpBinding(), new EndpointAddress(strUrl));

                //调用服务
                int nServiceReturn = devClient.notifyUploadEvent(request.requestHead, request.uploadEventResult);

                //生成反馈结果
                nuResponse = new notifyUploadEventResponse(nServiceReturn);
                strResponse = "调用成功";

            }
            catch (Exception ex)
            {
                strResponse = "调用失败";

                log.WriteErrLog("调用DeviceInterface.NotifyUploadEvent 出错！");
                log.WriteErrLog(ex.ToString());
            }

            try
            {
                string strReqHeadXml = CreateInputText(request.requestHead);
                RecordLogIntoDB(strReqHeadXml, strResponse, "CenterService.NotifyUploadEvent");
            }
            catch (Exception ex)
            {
                log.WriteErrLog("调用DeviceInterface.NotifyUploadEvent 记录日志出错！");
                log.WriteErrLog(ex.ToString());
            }

            return nuResponse;
        }
    //}

    //public class monitorObj : MonitorObjInterface
    //{
        public getMonitorObjStatusResponse getMonitorObjStatus(getMonitorObjStatusRequest request)
        {
            string strResponse = "";
            getMonitorObjStatusResponse monObjResp = null;

            try
            {
                //查询，生成服务地址
                string strUrl = GetServiceUrl("CenterService");
                if (strUrl[strUrl.Length - 1] != '/')
                    strUrl += "/";

                strUrl += "monitorObj";

                //设置服务地址
                MonitorObjInterfaceClient monClient = new MonitorObjInterfaceClient(new BasicHttpBinding(), new EndpointAddress(strUrl));

                //调用服务
                int nServiceReturn = monClient.getMonitorObjStatus(request.requestHead, request.monitorObjCode);

                //生成反馈结果
                monObjResp = new getMonitorObjStatusResponse(nServiceReturn);
                strResponse = "调用成功";

            }
            catch (Exception ex)
            {
                strResponse = "调用失败";

                log.WriteErrLog("调用monitorObj.GetMonitorObjStatus 出错！");
                log.WriteErrLog(ex.ToString());
            }

            try
            {
                string strReqHeadXml = CreateInputText(request.requestHead);
                RecordLogIntoDB(strReqHeadXml, strResponse, "CenterService.GetMonitorObjStatus");
            }
            catch (Exception ex)
            {
                log.WriteErrLog("调用monitorObj.GetMonitorObjStatus 记录日志出错！");
                log.WriteErrLog(ex.ToString());
            }

            return monObjResp;
        }
    //}

    //public class mta : MaintenanceInterface
    //{
        public sendMTAMessageResponse sendMTAMessage(sendMTAMessageRequest request)
        {
            string strResponse = "";
            sendMTAMessageResponse sendMtaResp = null;

            try
            {
                //查询，生成服务地址
                string strUrl = GetServiceUrl("CenterService");
                if (strUrl[strUrl.Length - 1] != '/')
                    strUrl += "/";

                strUrl += "mta";

                //设置服务地址
                MaintenanceInterfaceClient MainClient = new MaintenanceInterfaceClient(new BasicHttpBinding(), new EndpointAddress(strUrl));

                //调用服务
                int nServiceReturn = MainClient.sendMTAMessage(request.requestHead, request.mtaMessageData);
                sendMtaResp = new sendMTAMessageResponse(nServiceReturn);

                strResponse = "调用成功";

            }
            catch (Exception ex)
            {
                strResponse = "调用失败";

                log.WriteErrLog("调用mta.SendMTAMessage 出错！");
                log.WriteErrLog(ex.ToString());
            }

            try
            {
                string strReqHeadXml = CreateInputText(request.requestHead);
                RecordLogIntoDB(strReqHeadXml, strResponse, "CenterService.SendMTAMessage");
            }
            catch (Exception ex)
            {
                log.WriteErrLog("调用mta.SendMTAMessage 记录日志出错！");
                log.WriteErrLog(ex.ToString());
            }

            return sendMtaResp;
        }

        public getMTAExtendableDefResponse getMTAExtendableDef(getMTAExtendableDefRequest request)
        {
            string strResponse = "";
            getMTAExtendableDefResponse defResp = null;

            try
            {
                //查询，生成服务地址
                string strUrl = GetServiceUrl("CenterService");
                if (strUrl[strUrl.Length - 1] != '/')
                    strUrl += "/";

                strUrl += "mta";

                //设置服务地址
                MaintenanceInterfaceClient MainClient = new MaintenanceInterfaceClient(new BasicHttpBinding(), new EndpointAddress(strUrl));

                //调用服务
                mtaDataExtenableDefType matDataType =  MainClient.getMTAExtendableDef(request.requestHead);
                defResp = new getMTAExtendableDefResponse(matDataType);

                strResponse = "调用成功";

            }
            catch (Exception ex)
            {
                strResponse = "调用失败";

                log.WriteErrLog("调用mta.GetMTAExtendableDef 出错！");
                log.WriteErrLog(ex.ToString());
            }

            try
            {
                string strReqHeadXml = CreateInputText(request.requestHead);
                RecordLogIntoDB(strReqHeadXml, strResponse, "CenterService.GetMTAExtendableDef");
            }
            catch (Exception ex)
            {
                log.WriteErrLog("调用mta.GetMTAExtendableDef 记录日志出错！");
                log.WriteErrLog(ex.ToString());
            }

            return defResp;
        }
    //}
}

