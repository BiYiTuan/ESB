package eab.console.events
{
	import eab.framework.control.EABFrameworkEvent;
	/**
	 * This class define the events raised by the UDDIRefView.
	 */
	public class UDDIRefViewAppEvent extends EABFrameworkEvent
	{
		/**
		 * Get a reference from server.
		 */
		public static const GET_REF_FROM_SERVER : String = "get_ref_from_server_UDDIRefView";
		/**
		 * Constructor, takes the event name (type) and data object (defaults to null)
		 * and also defaults the standard Flex event properties bubbles and cancelable
		 * to true and false respectively.
		 */ 
		public function UDDIRefViewAppEvent(type : String, dataParameter:Object = null ,
											  bubbles : Boolean = false, cancelable : Boolean = false)
		{
			super(type, dataParameter, bubbles, cancelable);
		}

	}
}