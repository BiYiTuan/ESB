package eab.console.events
{
	import eab.framework.control.EABFrameworkEvent;

	public class DesignerToolBarAppEvent extends EABFrameworkEvent
	{
		public static const FLOW_SAVE_LOCAL :String = "flowSave_Local_DesignerToolBar";

		public static const FLOW_SAVE_DB :String = "fileSave_DB_DesignerToolBar";

		public static const FLOW_DEPLOY :String = "flow_Deploy_DesignerToolBar";

		public function DesignerToolBarAppEvent(type : String, dataParameter:Object = null,
											  bubbles : Boolean = false, cancelable : Boolean = false)
		{
			super(type, dataParameter, bubbles, cancelable);
		}

	}
}