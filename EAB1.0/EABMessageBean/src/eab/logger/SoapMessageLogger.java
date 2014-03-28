package eab.logger;

import eab.logger.dao.SoapMessageDao;
import eab.logger.dao.SoapMessageLog;

public class SoapMessageLogger {
	
	public static void LogMessage(String inMsg, String outMsg, String type, int resultCode){
		SoapMessageLog domain = new SoapMessageLog(inMsg, outMsg, type, resultCode);
		SoapMessageDao dao = new SoapMessageDao();
		dao.saveMsg(domain);
	}
}
