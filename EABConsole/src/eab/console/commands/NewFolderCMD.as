package eab.console.commands
{
	import mx.controls.Alert;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.remoting.RemoteObject;
	
	import eab.framework.commands.EABCommand;
	import eab.framework.control.EABFrameworkEvent;
	import eab.framework.view.ViewLocator;
	import eab.console.model.FunctionNavigatorModel;
	import eab.console.model.EABConsoleModelLocator;
	import eab.console.view.EditorNavigatorChild;
	import eab.console.viewhelper.FunctionNavigatorViewVH;
	import eab.console.business.EABConsoleServiceLocator;
	/**
	 * Create a new folder in fileNavigator.
	 */ 
	public class NewFolderCMD extends EABCommand
	{
		public function NewFolderCMD(){
			super();
		}
		/**
		 * @param event {folderName}
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
//					if(event.data.folderName == xmlList[i].@name)
//						exist = true;
//				}
//				if(exist)
//					Alert.show("This folder name is exist.");
//				else{
//					var remote :RemoteObject = EABConsoleServiceLocator.getInstance().GetRemoteObject("navigator");
//					remote.createNewFolder(event.data.folderName, fileNavigatorViewVH.getSelectedItemPath());
//					remote.addEventListener(FaultEvent.FAULT,fault);
//					
//					var newFolderNode:XML = <folder/>;
//					newFolderNode.@ID= "0"
//					newFolderNode.@name=event.data.folderName;
//					newFolderNode.@type="folder";
////					fileNavigatorViewVH.addAndExpandItem(fileNavigatorViewVH.getSelectedItem(), newFolderNode, 0, true);
//				}
//			}
		}
		private function fault(event :FaultEvent):void{
        	Alert.show("Remote invoke error: "+event.message);
        }
	}
}