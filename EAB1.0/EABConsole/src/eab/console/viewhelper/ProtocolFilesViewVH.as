package eab.console.viewhelper
{
	import eab.console.events.ProtocolFilesViewAppEvent;
	import eab.console.model.EABConsoleModelLocator;
	import eab.console.model.ProtocolFilesModel;
	import eab.console.view.ProtocolFilesView;
	import eab.framework.view.ViewHelper;
	
	import flash.events.MouseEvent;

	public class ProtocolFilesViewVH extends ViewHelper
	{
		public static const VH_KEY :String = "ProtocolFilesViewVH";
		
		private var protocolFilesModel:ProtocolFilesModel;
      	
		public function ProtocolFilesViewVH(document : Object, id : String){
			super();
			
			initialized(document, id);
			this.protocolFilesModel = EABConsoleModelLocator.getInstance().getProtocolFilesModel();
		}

		public static function getViewHelperKey() :String{
			return VH_KEY;
		}

		public function get protocolFilesView() : ProtocolFilesView {
			return this.view as ProtocolFilesView;
		}
		
		public function fileListTree_itemDoubleClick(event :MouseEvent):void {	
			var node:XML = this.protocolFilesView.fileListTree.selectedItem as XML;
            var isOpen:Boolean = this.protocolFilesView.fileListTree.isItemOpen(node);
   			if(node != null){
   				if(node.@isFolder == "true") {
   					this.protocolFilesView.fileListTree.expandItem(node, !isOpen);
   					this.protocolFilesModel.curFile = null;
   				}
   				else{
   					new ProtocolFilesViewAppEvent(ProtocolFilesViewAppEvent.OPEN_PROTOCOL_FILE, node).dispatch();
   				}
   			}
  		}
	}
}
