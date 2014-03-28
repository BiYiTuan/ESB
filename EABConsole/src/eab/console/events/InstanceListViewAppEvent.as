package eab.console.events
{
	import eab.framework.control.EABFrameworkEvent;

	public class InstanceListViewAppEvent extends EABFrameworkEvent
	{	

		public static const OPEN_INSTANCE_MONITOR :String = "instance_Monitor_open_InstanceListView";

		public function InstanceListViewAppEvent(type : String, dataParameter:Object = null ,
											  bubbles : Boolean = false, cancelable : Boolean = false)
		{
			super(type, dataParameter, bubbles, cancelable);
		}

	}
}