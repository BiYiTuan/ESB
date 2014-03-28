package eab.console.commands
{
	import mx.collections.ICollectionView;
	import mx.controls.Alert;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.remoting.RemoteObject;
	
	import eab.framework.commands.EABCommand;
	import eab.framework.control.EABFrameworkEvent;
	import eab.framework.view.ViewLocator;
	import eab.console.model.FigureEditorModel;
	import eab.console.model.EABConsoleModelLocator;
	import eab.console.view.EditorNavigatorChild;
	import eab.console.viewhelper.BpelEditorVH;
	import eab.console.viewhelper.FunctionNavigatorViewVH;
	import eab.console.business.EABConsoleServiceLocator;
	
	/**
	 * Rename a file.
	 */ 
	public class FileRenameCMD extends EABCommand
	{

		private var fileNavigatorViewVH :FunctionNavigatorViewVH = 
					ViewLocator.getInstance().getViewHelper(FunctionNavigatorViewVH.VH_KEY) as FunctionNavigatorViewVH;
		private var newName :String;
		private var oldName :String;
					
		private var bpelEditorVH :BpelEditorVH;
					
		public function FileRenameCMD(){
			super();
		}
		/**
		 * 
		 * @param event {fileName}
		 * 
		 */
		override public function execute(event :EABFrameworkEvent) :void{
			
			newName = event.data.fileName;
			oldName = fileNavigatorViewVH.getSelectedItem().@name;
			
			var newNameWithoutExtension :String;
			var currentName :String;
			var currentNameWithoutExtension :String;
			var path :String = fileNavigatorViewVH.getSelectedItemPath();
			
			var exist:Boolean = false;
//			var xmlList :XMLList = XMLList(fileNavigatorViewVH.getParentItem(fileNavigatorViewVH.getSelectedItem())).elements();
			
//			if(newName.indexOf(".", 0) != -1)
//				newNameWithoutExtension = newName.substring(0, newName.indexOf(".", 0));
//			else
//				newNameWithoutExtension = newName;
//			for(var i :int = 0; i < xmlList.length(); i++){
//				currentName = xmlList[i].@name;
//				if(currentName.indexOf(".", 0) != -1)
//					currentNameWithoutExtension = currentName.substring(0, currentName.indexOf(".", 0));
//				else
//					currentNameWithoutExtension = currentName;
//				if(newNameWithoutExtension == currentNameWithoutExtension)
//					exist = true;
//			}
//			if(exist)
//				Alert.show("This file name is exist.");
//			else{
//				fileNavigatorViewVH.reName(newName);
				
//				var remote :RemoteObject = EABConsoleServiceLocator.getInstance().GetRemoteObject("navigator");
//				remote.renameFile(path, newName);
//				remote.addEventListener(FaultEvent.FAULT,fault);
//			}
			this.Traversing(fileNavigatorViewVH.getSelectedItem());
		}

		private function Traversing(theParentItem:Object):void{
//			var registration :Boolean;
//			if(fileNavigatorViewVH.getDataDescriptor().isBranch(theParentItem)){
//				var children :ICollectionView = fileNavigatorViewVH.getDataDescriptor().getChildren(theParentItem);
//				var i:int;
//				for(i = 0; i < children.length; i++){
//					Traversing(children[i]);
//				}
//			}else if(theParentItem.@type == EditorNavigatorChild.FIGURE_EDITOR_TYPE)
//			{
//				registration = ViewLocator.getInstance().registrationExistsFor(FigureEditorVH.getViewHelperKey(theParentItem.@ID));
//				if(registration){
//					figureEditorVH = ViewLocator.getInstance().getViewHelper(FigureEditorVH.getViewHelperKey(theParentItem.@ID)) as FigureEditorVH;
//					figureEditorVH.filePath = fileNavigatorViewVH.getSelectedItemPath();
//				}
//			}else if(theParentItem.@type == EditorNavigatorChild.BPEL_EDITOR_TYPE)
//			{
//				registration = ViewLocator.getInstance().registrationExistsFor(BpelEditorVH.getViewHelperKey(theParentItem.@ID));
//				if(registration){
//					bpelEditorVH = ViewLocator.getInstance().getViewHelper(BpelEditorVH.getViewHelperKey(theParentItem.@ID)) as BpelEditorVH;
//					bpelEditorVH.filePath = fileNavigatorViewVH.getSelectedItemPath();
//				}
//				var grandparent :Object = fileNavigatorViewVH.getParentItem(theParentItem);
//				var xmlList :XMLList = XML(grandparent).elements();
//				for(var index :int = 0; index < xmlList.length(); index++){
//					var message1 :String = XML(xmlList[index]).@name;
//					var message2 :String = oldName.substring(0, newName.length - 5) + ".xml";
//					if(XML(xmlList[index]).@name == oldName.substring(0, newName.length - 5) + ".xml")
//						break;
//				}
//				var figureFileID :String = XML(xmlList[index]).@ID;
//				var feModel :FigureEditorModel = EABConsoleModelLocator.getInstance().figureEditorNavigatorModel.getFigureEditorModel(figureFileID);
//				if(feModel != null)
//				feModel.relativeBpelID = null;
//			}
		}
 		private function fault(event :FaultEvent):void{
        	Alert.show("Remote invoke error: "+event.message);
        } 
	}
}