package eab.console.viewhelper
{
	import mx.events.DataGridEvent;
	
	import eab.framework.view.ViewHelper;
	import eab.console.events.AttributeViewAppEvent;
	import eab.console.model.AttributeViewModel;
	import eab.console.model.EABConsoleModelLocator;
	import eab.console.view.AttributeItemTextRenderer;
	import eab.console.view.AttributeView;
	
	/**
	 * The ViewHelper of AttributeView.
	 * Used to isolate command classes from the implementation details of a view.
	 */
	public class AttributeViewVH extends ViewHelper{
		/**
		 * The key of AttributeViewVH
		 */
		public static const VH_KEY:String = "AttributeVH";
		
		/**
		 * Initialize AttributeView with AttributeViewVH
		 */
		public function AttributeViewVH(document : Object, id : String){
			super();
			initialized(document, id);
		}
		
		/**
		 * Return AttributeView.
		 */
		private function get attributeView() :AttributeView{
			return this.view as AttributeView;
		}

		/**
		 * Update the selected figure's attribute.
		 */
		public function onEditEnd(event:DataGridEvent):void {

			var rowIndexT :int = event.rowIndex;
			
			var newValueT: String = AttributeItemTextRenderer(this.view.itemEditorInstance).newValue;	
			
			new AttributeViewAppEvent(AttributeViewAppEvent.CHANGE_ATTRIBUTE, 
					{rowIndex:rowIndexT, newValue:newValueT}
					).dispatch();
		}
	}
}