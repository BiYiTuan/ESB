package eab.console.events
{
	import eab.framework.control.EABFrameworkEvent;
	/**
	 * This class define the events raised by the DesignerMenuBar.
	 */
	public class DesignerMenuBarAppEvent extends EABFrameworkEvent
	{
		public static const FLOW_SAVE_LOCAL :String = "flowSave_Local_DesignerMenuBar";

		public static const FLOW_SAVE_DB :String = "flowSave_DB_DesignerMenuBar";

		public static const FLOW_DEPLOY :String = "flow_Deploy_DesignerMenuBar";

		public static const ABOUT_DESIGNER :String = "about_designer_DesignerMenuBar";

		public function DesignerMenuBarAppEvent(type : String, dataParameter:Object = null ,
											  bubbles : Boolean = false, cancelable : Boolean = false)
		{
			super(type, dataParameter, bubbles, cancelable);
		}

	}
}