package eab.console.events
{
	import eab.framework.control.EABFrameworkEvent;

	public class FunctionNavigatorViewAppEvent extends EABFrameworkEvent
	{	

		public static const OPEN_SERVICE_LIST :String = "serviceList_open_FunctionNavigatorView";
		
		public static const OPEN_FLOW_LIST :String = "flowList_open_FunctionNavigatorView";
		
		public static const OPEN_LOG_LIST :String = "logList_open_FunctionNavigatorView";
		
		public static const OPEN_INSTANCE_LIST :String = "instanceList_open_FunctionNavigatorView";
		
		public static const OPEN_PROTOCOL_FILES :String = "protocolFiles_open_FunctionNavigatorView";

		public static const OPEN_PROTOCOL_LIST :String = "protocolList_open_FunctionNavigatorView";

		public function FunctionNavigatorViewAppEvent(type : String, dataParameter:Object = null ,
											  bubbles : Boolean = false, cancelable : Boolean = false)
		{
			super(type, dataParameter, bubbles, cancelable);
		}

	}
}