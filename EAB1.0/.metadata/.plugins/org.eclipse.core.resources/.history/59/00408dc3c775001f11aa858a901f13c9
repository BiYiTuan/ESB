package eab.parser;

import java.io.File;
import java.util.Map;
import java.util.Map.Entry;

import javax.wsdl.Binding;
import javax.wsdl.BindingOperation;
import javax.wsdl.Definition;
import javax.wsdl.OperationType;
import javax.wsdl.Port;
import javax.wsdl.Service;
import javax.wsdl.WSDLException;
import javax.wsdl.factory.WSDLFactory;
import javax.wsdl.xml.WSDLReader;
import javax.xml.namespace.QName;

@SuppressWarnings("unchecked")
public class WSDLProtocolParser {
	
	public WSDLProtocolParser(){		
	}
	
	public Boolean parse(String wsdlFilePath){
		try {			
			File wsdlFile = new File(wsdlFilePath);
			if(!wsdlFile.exists())
				return false;
			
			// set absoluteWSDLFilePath
			this.absoluteWSDLFilePath = wsdlFile.getAbsolutePath().replaceAll("\\\\", "/");
			
			try {
				WSDLReader wsdlReader = WSDLFactory.newInstance().newWSDLReader();
				wsdlReader.setFeature("javax.wsdl.verbose", false);
				wsdlReader.setFeature("javax.wsdl.importDocuments", true);
				Definition def = wsdlReader.readWSDL(wsdlFilePath);			
			
				Service srv = parseService(def);
				parseOperation(srv);
			} catch (WSDLException e) {
				e.printStackTrace();
				return false;
			}
		} catch (Exception e) {
			return false;
		}
		
		return true;
	}	
	
	// set serviceNamespace, serviceName	
	protected Service parseService(Definition def){
		Map services = def.getServices();
		Service srv = null;
		for(Object obj : services.entrySet()){
			if(! (obj instanceof Entry))
				continue;
			Entry entry = (Entry) obj;
			
			Object val = entry.getValue();
			if(val instanceof Service){
				srv = (Service)val;
				break;
			}
		}
		
		QName qn = srv.getQName();
		this.serviceNamespace = qn.getNamespaceURI();
		this.serviceName = qn.getLocalPart();
		
		return srv;
	}
	
	// set serviceEndpoint, serviceBindingName, soapAction and is sync
	protected void parseOperation(Service srv){
		Map ports = srv.getPorts();
		Port pt = null;
		
		for(Object obj : ports.entrySet()){
			if(! (obj instanceof Entry))
				continue;
			Entry entry = (Entry) obj;
			
			Object val = entry.getValue();
			if(val instanceof Port){
				pt = (Port)val;
				break;
			}
		}
		
		this.serviceEndpoint = pt.getName();
		
		Binding bd = pt.getBinding();		
		QName qn = bd.getQName();
		
		this.serviceBindingName = qn.getLocalPart();
		
		BindingOperation bdo = null;
		
		for(Object obj : bd.getBindingOperations()){
			if(obj instanceof BindingOperation){
				bdo = (BindingOperation) obj;
				break;
			}
		}
		
		QName soapOperationName = new QName(qn.getNamespaceURI(), bdo.getName());
		
		this.serviceSoapAction = soapOperationName.getNamespaceURI();
		this.serviceSoapAction += this.serviceSoapAction.endsWith("/") ? "" : "/";
		this.serviceSoapAction += soapOperationName.getLocalPart();
		
		this.isSync = bdo.getOperation().getStyle() != OperationType.ONE_WAY;
	}
	
	public String getAbsoluteWSDLFilePath() {
		return absoluteWSDLFilePath;
	}
	
	public String getServiceNamespace() {
		return serviceNamespace;
	}
	
	public String getServiceName() {
		return serviceName;
	}
	
	public String getServiceBindingName() {
		return serviceBindingName;
	}
	
	public String getServiceEndpoint() {
		return serviceEndpoint;
	}
	
	public String getServiceSoapAction() {
		return serviceSoapAction;
	}
	
	public boolean isSync() {
		return isSync;
	}
	
	private String absoluteWSDLFilePath;
	
	private String serviceNamespace;
	
	private String serviceName;
	
	private String serviceBindingName;
	
	private String serviceEndpoint;	
	
	private String serviceSoapAction;	
	
	private boolean isSync;
}
