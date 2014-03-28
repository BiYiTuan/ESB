package eab.console.events
{
	import eab.framework.control.EABFrameworkEvent;

	public class FlowListViewAppEvent extends EABFrameworkEvent
	{	

		public static const OPEN_FLOW_EDIT :String = "flow_Edit_open_FlowListView";

		public function FlowListViewAppEvent(type : String, dataParameter:Object = null ,
											  bubbles : Boolean = false, cancelable : Boolean = false)
		{
			super(type, dataParameter, bubbles, cancelable);
		}

	}
}