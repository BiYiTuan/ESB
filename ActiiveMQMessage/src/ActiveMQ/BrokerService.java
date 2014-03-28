package ActiveMQ;

import org.apache.activemq.broker.*;
import org.apache.activemq.broker.BrokerContext;


public class BrokerService {
	
	public static void main( String[] args) throws Exception
	{
		BrokerService broker = new BrokerService();
		broker.setBrokerName("localhost");
		
		broker.addConnector();
		
	}

}
