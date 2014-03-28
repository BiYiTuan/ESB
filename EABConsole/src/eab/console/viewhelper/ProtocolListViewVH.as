package eab.console.viewhelper
{
	import eab.console.model.EABConsoleModelLocator;
	import eab.console.model.ProtocolListModel;
	import eab.console.view.ProtocolListView;
	import eab.framework.view.ViewHelper;
	
	import flash.events.ContextMenuEvent;

	public class ProtocolListViewVH extends ViewHelper
	{
		public static const VH_KEY :String = "ProtocolListViewVH";
		
		private var protocolListModel:ProtocolListModel;
      	
		public function ProtocolListViewVH(document : Object, id : String){
			super();
			
			initialized(document, id);
			this.protocolListModel = EABConsoleModelLocator.getInstance().getProtocolListModel();
		}

		public static function getViewHelperKey() :String{
			return VH_KEY;
		}

		public function get protocolListView() : ProtocolListView{
			return this.view as ProtocolListView;
		}
	}
}
