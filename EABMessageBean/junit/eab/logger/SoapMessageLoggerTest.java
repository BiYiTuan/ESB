package eab.logger;

public class SoapMessageLoggerTest {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		System.out.println(SoapMessageLogger.class.getResource("/"));
		SoapMessageLogger.LogMessage("inmsg", "outmsg", "type", 200);
	}

}
