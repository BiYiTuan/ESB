package eab.console.viewhelper
{
	import mx.events.FlexEvent;
	
	import eab.framework.view.ViewHelper;
	import eab.console.events.UDDIRefViewAppEvent;
	import eab.console.model.EABConsoleModelLocator;
	import eab.console.model.UDDIReferenceModel;
	import eab.console.view.UDDIReferenceView;
	/**
	 * The ViewHelper of UDDIReference.
	 * Used to isolate command classes from the implementation details of a view.
	 */
	public class UDDIReferenceVH extends ViewHelper{

		/**
		 * The key of UDDIReferenceVH
		 */
		public static const VH_KEY:String = "UDDIReferenceViewH";		

		/**
		 * Initialize UDDIReference with UDDIReferenceVH
		 */
		public function UDDIReferenceVH(document : Object, id : String){
			super();
			initialized(document, id);
		}
		/**
		 * Return UDDIReferenceView
		 */
		private function get uddiReferenceView() :UDDIReferenceView{
			return this.view as UDDIReferenceView;
		}
		
		/**
		 * Initialize the content 
		 * @param event
		 * 
		 */
		public function initContent(event : FlexEvent) : void {
			new UDDIRefViewAppEvent(UDDIRefViewAppEvent.GET_REF_FROM_SERVER).dispatch();
		}
	}
}