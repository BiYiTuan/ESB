package eab.console.viewhelper
{
	import eab.console.events.FunctionNavigatorViewAppEvent;
	import eab.console.model.EABConsoleModelLocator;
	import eab.console.model.FunctionNavigatorModel;
	import eab.console.view.FunctionNavigatorView;
	import eab.framework.view.ViewHelper;
	
	import flash.events.MouseEvent;	
	import mx.messaging.Consumer;

	public class FunctionNavigatorViewVH extends ViewHelper
	{
		public static const VH_KEY :String = "FunctionNavigatorViewVH";
		
		private var functionNavigatorModel:FunctionNavigatorModel;

       	private var consumer :Consumer = new Consumer;
       	
		public function FunctionNavigatorViewVH(document : Object, id : String){
			super();
			
			initialized(document, id);
			this.functionNavigatorModel=EABConsoleModelLocator.getInstance().getFunctionNavigatorModel();
		}

		public static function getViewHelperKey() :String{
			return VH_KEY;
		}

		private function get fileNavigatorView() :FunctionNavigatorView{
			return this.view as FunctionNavigatorView;
		}
		
		public function getSelectedItem():Object{
			return this.fileNavigatorView.selectedItem;
		}

		public function getSelectedItemPath():String{
			var theParentItem:Object;
			var str:String;
			var path:String;
			if(this.fileNavigatorView.selectedItem != null)
				path = this.fileNavigatorView.selectedItem.@name;			
			else
				return "";
			theParentItem=this.fileNavigatorView.selectedItem;
			while(theParentItem != null){
				theParentItem=this.fileNavigatorView.getParentItem(theParentItem);
				if(theParentItem!=null){
                	str=theParentItem.@name+"\\"+path;
                	path=str;
                }
			}
			return path;
		}
		
		public function tree_itemDoubleClick(event :MouseEvent):void {
			
			var node:XML = this.fileNavigatorView.selectedItem as XML;
            var isOpen:Boolean = this.fileNavigatorView.isItemOpen(node);
   			if(node != null){
   				if(node.@type == "group" || node.@type == "folder")
   					this.fileNavigatorView.expandItem(node, !isOpen);
   				else{
   					switch(String(node.@ID)){
   						case "protocolFiles":
   							new FunctionNavigatorViewAppEvent(FunctionNavigatorViewAppEvent.OPEN_PROTOCOL_FILES).dispatch();
   							break;
   						case "protocolList":
   							new FunctionNavigatorViewAppEvent(FunctionNavigatorViewAppEvent.OPEN_PROTOCOL_LIST).dispatch();
   							break;
   						case "serviceList":
   							new FunctionNavigatorViewAppEvent(FunctionNavigatorViewAppEvent.OPEN_SERVICE_LIST).dispatch();
   							break;
   						case "serviceLog":
   							new FunctionNavigatorViewAppEvent(FunctionNavigatorViewAppEvent.OPEN_LOG_LIST).dispatch();
   							break;
   						case "flowList":
   							new FunctionNavigatorViewAppEvent(FunctionNavigatorViewAppEvent.OPEN_FLOW_LIST).dispatch();
   							break;
   						case "flowMonitor":
   							new FunctionNavigatorViewAppEvent(FunctionNavigatorViewAppEvent.OPEN_INSTANCE_LIST).dispatch();
   							break;
   						default:
   							break;
   					}
   				}
   			}
        }       
	}
}