package eab.beans;

import javax.annotation.Resource;
import javax.jbi.messaging.DeliveryChannel;
import javax.jbi.messaging.ExchangeStatus;
import javax.jbi.messaging.MessageExchange;
import javax.jbi.messaging.MessagingException;
import javax.jbi.messaging.NormalizedMessage;

import org.apache.servicemix.jbi.listener.MessageExchangeListener;

public class EnrichMessageBean implements MessageExchangeListener {
	@Resource
    private DeliveryChannel channel;
	
	private String type;

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public void onMessageExchange(MessageExchange exchange)
			throws MessagingException {
		 if (exchange.getStatus() == ExchangeStatus.ACTIVE) {

	            NormalizedMessage message = exchange.getMessage("in");

		        message.setProperty("type", type);

	           exchange.setMessage(message, "out");
	           
	            channel.send(exchange);
		 }
	}
}
