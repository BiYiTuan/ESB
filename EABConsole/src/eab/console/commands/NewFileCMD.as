package eab.console.commands
{
	import mx.controls.Alert;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.remoting.RemoteObject;
	
	import eab.framework.commands.EABCommand;
	import eab.framework.control.EABFrameworkEvent;
	import eab.framework.view.ViewLocator;
	import eab.console.business.EABConsoleServiceLocator;
	import eab.console.model.FileIDManager;
	import eab.console.model.FunctionNavigatorModel;
	import eab.console.model.EABConsoleModelLocator;
	import eab.console.view.EditorNavigatorChild;
	import eab.console.viewhelper.FunctionNavigatorViewVH;
	import eab.console.business.EABConsoleServiceLocator;
	/**
	 * Create a new xmlFile in fileNavigator.
	 */ 
	public class NewFileCMD extends EABCommand
	{
		public function NewFileCMD(){
			super();
		}
		/**
		 * @param event {fileName}
		 */
		override public function execute(event :EABFrameworkEvent) :void{
			
//			var fileNavigatorViewVH :FunctionNavigatorViewVH = 
//					ViewLocator.getInstance().getViewHelper(FunctionNavigatorViewVH.VH_KEY) as FunctionNavigatorViewVH;
//			var fileNavigatorViewModel :FunctionNavigatorViewModel =
//					EABConsoleModelLocator.getInstance().getFileNavigatorViewModel();
//
//			if(fileNavigatorViewVH.getSelectedItem() != null 
//				&& fileNavigatorViewVH.getSelectedItem().@type != EditorNavigatorChild.FIGURE_EDITOR_TYPE 
//				&& fileNavigatorViewVH.getSelectedItem().@type != EditorNavigatorChild.BPEL_EDITOR_TYPE){
//					
//				var exist:Boolean = false;
//				var xmlList :XMLList = XMLList(fileNavigatorViewVH.getSelectedItem()).elements();
//				for(var i :int = 0; i < xmlList.length(); i++){
//					if(event.data.fileName == xmlList[i].@name)
//						exist = true;
//				}
//				if(exist)
//					Alert.show("This file name is exist.");
//				else{
//					var newFileNode:XML=<file/>;
//					newFileNode.@ID = FileIDManager.getAvailabelFileId();
//					newFileNode.@name=event.data.fileName;
//					newFileNode.@type=EditorNavigatorChild.FIGURE_EDITOR_TYPE;
////					fileNavigatorViewVH.addAndExpandItem(fileNavigatorViewVH.getSelectedItem(), newFileNode, 0, true);
//				
//					var remote :RemoteObject = EABConsoleServiceLocator.getInstance().GetRemoteObject("navigator");
//					remote.createNewFile(event.data.fileName, fileNavigatorViewVH.getSelectedItemPath());
//					remote.addEventListener(FaultEvent.FAULT,fault);
//				}
//				
//			}else{
//				Alert.show("Please select a  project or folder first.");
//			}
		}
		private function fault(event :FaultEvent):void{
        	Alert.show("Remote invoke error: "+event.message);
        }
	}
}