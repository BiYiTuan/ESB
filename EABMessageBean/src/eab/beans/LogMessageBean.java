package eab.beans;

import javax.annotation.Resource;
import javax.jbi.messaging.DeliveryChannel;
import javax.jbi.messaging.ExchangeStatus;
import javax.jbi.messaging.MessageExchange;
import javax.jbi.messaging.MessagingException;
import javax.jbi.messaging.NormalizedMessage;

import org.apache.servicemix.jbi.jaxp.SourceTransformer;
import org.apache.servicemix.jbi.listener.MessageExchangeListener;

import eab.logger.dao.SoapMessageDao;
import eab.logger.dao.SoapMessageLog;

public class LogMessageBean implements MessageExchangeListener {

	@Resource
	private DeliveryChannel channel;

	public void onMessageExchange(MessageExchange exchange)
			throws MessagingException {
		if (exchange.getStatus() == ExchangeStatus.ACTIVE) {

			NormalizedMessage message = exchange.getMessage("in");

			try {
				String body = (new SourceTransformer()).toString(message.getContent());
				String type = (String) message.getProperty("c");
				SoapMessageLog domain = new SoapMessageLog(body, "", type, 202);
				SoapMessageDao dao = new SoapMessageDao();
				dao.saveMsg(domain);
			} catch (Exception e) {
				e.printStackTrace();
			}

			exchange.setStatus(ExchangeStatus.DONE);
			channel.send(exchange);
		}
	}

}
