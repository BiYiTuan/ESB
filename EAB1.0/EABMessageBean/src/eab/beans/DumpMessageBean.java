package eab.beans;

import javax.annotation.Resource;
import javax.jbi.messaging.DeliveryChannel;
import javax.jbi.messaging.ExchangeStatus;
import javax.jbi.messaging.MessageExchange;
import javax.jbi.messaging.MessagingException;

import org.apache.servicemix.jbi.listener.MessageExchangeListener;


public class DumpMessageBean implements MessageExchangeListener {
	
	@Resource
    private DeliveryChannel channel;
    
	public void onMessageExchange(MessageExchange exchange)
			throws MessagingException {
		 if (exchange.getStatus() == ExchangeStatus.ACTIVE) {
	            
	            exchange.setStatus(ExchangeStatus.DONE);
	            channel.send(exchange);
		 }
	}
}
