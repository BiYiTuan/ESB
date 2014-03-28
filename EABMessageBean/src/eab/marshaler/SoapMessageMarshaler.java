package eab.marshaler;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

import javax.jbi.messaging.MessageExchange;
import javax.jbi.messaging.NormalizedMessage;

import org.apache.servicemix.http.endpoints.HttpSoapProviderMarshaler;
import org.apache.servicemix.http.jetty.SmxHttpExchange;

import org.mortbay.jetty.HttpHeaders;
import org.mortbay.jetty.HttpStatus;

import eab.logger.SoapMessageLogger;

public class SoapMessageMarshaler extends HttpSoapProviderMarshaler {

	private String type;

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public void createRequest(final MessageExchange exchange,
			final NormalizedMessage inMsg, final SmxHttpExchange httpExchange)
			throws Exception {		
		
		super.createRequest(exchange, inMsg, httpExchange);
		
		httpExchange.setRequestHeader(HttpHeaders.CONTENT_TYPE, "text/xml;charset=UTF-8");				
	}

	public void handleResponse(MessageExchange exchange,
			SmxHttpExchange httpExchange) throws Exception {
		
		logHttpMessage(httpExchange);
		
		super.handleResponse(exchange, httpExchange);		
	}

	public void handleException(MessageExchange exchange,
			SmxHttpExchange httpExchange, Throwable ex) {
		
		logHttpMessage(httpExchange);
		
		super.handleException(exchange, httpExchange, ex);		
	}

	public void logHttpMessage(SmxHttpExchange httpExchange) {
		try {
			String preFixString = "<?xml version=\"1.0\" encoding=\"utf-8\"?>";
			String inMsg = new String(httpExchange.getRequestContent().array());
			String outMsg = "";
			int resultCode = httpExchange.getResponseStatus();
			
			if(resultCode == HttpStatus.ORDINAL_200_OK){
				outMsg = inputStreamToString(httpExchange.getResponseStream());
			}
			
			SoapMessageLogger.LogMessage(preFixString + inMsg, outMsg, type, resultCode);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	String inputStreamToString(InputStream is) {
		BufferedReader in = new BufferedReader(new InputStreamReader(is));
		StringBuffer buffer = new StringBuffer();
		String line = null;

		try {
			while ((line = in.readLine()) != null) {
				buffer.append(line);
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				is.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		return buffer.toString();
	}

}
