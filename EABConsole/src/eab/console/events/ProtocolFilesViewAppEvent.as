package eab.console.events
{
	import eab.framework.control.EABFrameworkEvent;

	public class ProtocolFilesViewAppEvent extends EABFrameworkEvent
	{	

		public static const OPEN_PROTOCOL_FILE :String = "protocol_File_open_ProtocolFilesView";

		public function ProtocolFilesViewAppEvent(type : String, dataParameter:Object = null ,
											  bubbles : Boolean = false, cancelable : Boolean = false)
		{
			super(type, dataParameter, bubbles, cancelable);
		}

	}
}