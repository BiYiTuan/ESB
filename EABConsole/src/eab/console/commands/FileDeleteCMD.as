package eab.console.commands
{
	import mx.controls.Alert;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.remoting.RemoteObject;
	
	import eab.framework.commands.EABCommand;
	import eab.framework.control.EABFrameworkEvent;
	import eab.framework.view.ViewLocator;
	import eab.console.model.EditorNavigatorModel;
	import eab.console.model.EABConsoleModelLocator;
	import eab.console.view.EditorNavigatorChild;
	import eab.console.viewhelper.EditorNavigatorVH;
	import eab.console.viewhelper.FunctionNavigatorViewVH;
	import eab.console.business.EABConsoleServiceLocator;
	/**
	 * Delete the selected file.
	 */ 
	public class FileDeleteCMD extends EABCommand{
		
		public function FileDeleteCMD(){
			super();
		}
		/**
		 * 
		 * @param event {fileID, type}
		 * 
		 */
		override public function execute(event :EABFrameworkEvent) :void{
			
//			var fileNavigatorViewVH :FunctionNavigatorViewVH = 
//					ViewLocator.getInstance().getViewHelper(FunctionNavigatorViewVH.VH_KEY) as FunctionNavigatorViewVH;
//					
//			var figureEditorNavigatorVH :FigureEditorNavigatorVH =
//					ViewLocator.getInstance().getViewHelper(FigureEditorNavigatorVH.VH_KEY) as FigureEditorNavigatorVH;
//					
//			var theParentItem :Object = fileNavigatorViewVH.getParentItem(fileNavigatorViewVH.getSelectedItem());
//			var xmlList :XMLList = XMLList(theParentItem).elements();
//			for(var i :int = 0; i < xmlList.length(); i++){
//				if(xmlList[i].@ID == event.data.fileID)
//					break;
//			}
//			var path :String = fileNavigatorViewVH.getSelectedItemPath();
//			
//			fileNavigatorViewVH.getDataDescriptor().removeChildAt(theParentItem, fileNavigatorViewVH.getSelectedItem(), i);
//			figureEditorNavigatorVH.CloseTabelByGivenFileID(event.data.fileID);
//			
//			var figureEditorNavigatorModel :FigureEditorNavigatorModel = EABConsoleModelLocator.getInstance().figureEditorNavigatorModel;
//			
//			if(event.data.type == EditorNavigatorChild.FIGURE_EDITOR_TYPE)
//				figureEditorNavigatorModel.deleteFigureEditorModel(event.data.fileID);
//			else if(event.data.type == EditorNavigatorChild.BPEL_EDITOR_TYPE)
//				figureEditorNavigatorModel.deleteBpelEditorModel(event.data.fileID);
//			
//			var remote :RemoteObject = EABConsoleServiceLocator.getInstance().GetRemoteObject("navigator");
//			remote.deleteFile(path);
//			remote.addEventListener(FaultEvent.FAULT,fault);
		}
		
		private function fault(event :FaultEvent):void{
        	Alert.show("Remote invoke error: "+event.message);
        }
	}
}