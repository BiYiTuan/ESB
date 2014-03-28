package eab.console.commands
{
	import mx.collections.ICollectionView;
	import mx.controls.Alert;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.remoting.RemoteObject;
	
	import eab.framework.commands.EABCommand;
	import eab.framework.control.EABFrameworkEvent;
	import eab.framework.view.ViewLocator;
	import eab.console.events.FunctionNavigatorViewAppEvent;
	import eab.console.model.FunctionNavigatorModel;
	import eab.console.model.EABConsoleModelLocator;
	import eab.console.view.EditorNavigatorChild;
	import eab.console.viewhelper.EditorNavigatorVH;
	import eab.console.viewhelper.FunctionNavigatorViewVH;
	import eab.console.business.EABConsoleServiceLocator;
	/**
	 * Delete the selected folder.
	 */ 
	public class FolderDeleteCMD extends EABCommand
	{
		private var fileNavigatorViewVH :FunctionNavigatorViewVH = 
				ViewLocator.getInstance().getViewHelper(FunctionNavigatorViewVH.VH_KEY) as FunctionNavigatorViewVH;
		public function FolderDeleteCMD(){
			super();
		}
		/**
		 * 
		 * @param event 
		 * 
		 */
		override public function execute(event :EABFrameworkEvent) :void{
		

			var figureEditorNavigatorVH :EditorNavigatorVH =
					ViewLocator.getInstance().getViewHelper(EditorNavigatorVH.VH_KEY) as EditorNavigatorVH;
			
//			var theParentItem :Object = theParentItem=fileNavigatorViewVH.getParentItem(fileNavigatorViewVH.getSelectedItem());
			var path :String = fileNavigatorViewVH.getSelectedItemPath();
			
			this.Traversing(fileNavigatorViewVH.getSelectedItem());
			
//			if(theParentItem != null){
//				fileNavigatorViewVH.getDataDescriptor().removeChildAt(theParentItem, fileNavigatorViewVH.getSelectedItem(), 0);
//			}
//			else{
//				var fileNavigatorViewModel :FunctionNavigatorViewModel = EABConsoleModelLocator.getInstance().getFileNavigatorViewModel();
//				fileNavigatorViewModel.xmlListCollection.removeItemAt(fileNavigatorViewModel.xmlListCollection.getItemIndex(fileNavigatorViewVH.getSelectedItem()));	
//			}
//			var remote :RemoteObject = EABConsoleServiceLocator.getInstance().GetRemoteObject("navigator");
//			remote.deleteFile(path);
//			remote.addEventListener(FaultEvent.FAULT,fault);
			
		}
		private function Traversing(theParentItem:Object):void{
//			if(fileNavigatorViewVH.getDataDescriptor().isBranch(theParentItem)){
//				var children :ICollectionView = fileNavigatorViewVH.getDataDescriptor().getChildren(theParentItem);
//				var i:int;
//				for(i = 0; i < children.length; i++){
//					Traversing(children[i]);
//				}
//			}
//			else if(theParentItem.@type == EditorNavigatorChild.FIGURE_EDITOR_TYPE || theParentItem.@type == EditorNavigatorChild.BPEL_EDITOR_TYPE){
//				
//				new FileNavigatorViewAppEvent(FileNavigatorViewAppEvent.FILE_DELETE,
//        			{fileID :theParentItem.@ID}).dispatch();
//			}
		}
		private function fault(event :FaultEvent):void{
        	Alert.show("Remote invoke error: "+event.message);
        }
	}
}