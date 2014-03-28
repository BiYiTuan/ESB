package eab.console.commands
{
	import mx.controls.Alert;
	import mx.events.CloseEvent;
	import mx.managers.PopUpManager;
	
	import eab.framework.commands.EABCommand;
	import eab.framework.control.EABFrameworkEvent;
	import eab.framework.view.ViewLocator;
	import eab.console.figure.SubProcessow2Figure;
	import eab.console.model.FileIDManager;
	import eab.console.model.FunctionNavigatorModel;
	import eab.console.model.EABConsoleModelLocator;
	import eab.console.view.EditorNavigatorChild;
	import eab.console.view.SaveFileWindow;
	import eab.console.viewhelper.FunctionNavigatorViewVH;
	
	/**
	 * Create a sub process.
	 */ 
	public class CreateSubProcessCMD extends EABCommand
	{
		private var subProcessFigure : SubProcessow2Figure;
		
		public function CreateSubProcessCMD(){
			super();
		}
		/**
		 * 
		 * @param event {subProcessFigure}
		 * 
		 */
		override public function execute(event :EABFrameworkEvent) :void{
			subProcessFigure = event.data.subProcessFigure as SubProcessow2Figure;
			var fileName : String = event.data.fileName;
			
			var newFile : SaveFileWindow = SaveFileWindow(PopUpManager.createPopUp(EABConsoleModelLocator.getInstance().getEABConsole(), SaveFileWindow,true));
			newFile.setTitle("File");
			PopUpManager.centerPopUp(newFile);
			newFile.addEventListener(CloseEvent.CLOSE,newFileResult);
		}
		
		private function newFileResult(event : CloseEvent):void{
			var fileName : String = SaveFileWindow(event.currentTarget).getText();
			if(fileName != "") {
				fileName = fileName + ".xml";
				subProcessFigure.setSubProcessFileName(fileName);
				createNewProcessFile(subProcessFigure);
			}
		}
		
		private function createNewProcessFile(subProcessFigure : SubProcessow2Figure) : void {
//			var subProcessFileName : String = subProcessFigure.getSubProcessFileName();
//			var filePath : String = subProcessFigure.filePath;
//			var fileNavigatorViewVH :FunctionNavigatorViewVH = 
//					ViewLocator.getInstance().getViewHelper(FunctionNavigatorViewVH.VH_KEY) as FunctionNavigatorViewVH;
////			var fileNavigatorViewModel :FunctionNavigatorModel =
////					EABConsoleModelLocator.getInstance().getFileNavigatorModel();
//			
//			var theParentItem:Object;
//			theParentItem=fileNavigatorViewModel.xmlList.children();
//			var startIndex:int=0;
//			var endIndex:int=0;
//			var path:Array=new Array;
//			while(filePath.indexOf("\\",startIndex)>0){
//				endIndex=filePath.indexOf("\\",startIndex);
//				path.push(filePath.substring(startIndex,endIndex));
//				startIndex = endIndex+1;
//			}
//			var i:int,j:int;
//			var thisXmlList:XMLList = fileNavigatorViewModel.xmlList;
//			for(i = 0; i < path.length-1; i++)
//				for(j = 0; j<thisXmlList.length(); j++)
//				{
//					if(XML(thisXmlList[j]).@name == path[i]){
//						thisXmlList = XML(thisXmlList[j]).elements();
//						break;	
//					}
//				}
//			for(j = 0; j < thisXmlList.length(); j++)
//				if(XML(thisXmlList[j]).@name == path[i])
//					break;
//			var temp:XMLList=XML(thisXmlList[j]).elements();
//			var exist:Boolean = false;
//			for(i = 0; i < temp.length(); i++)
//				if( XML(temp[i]).@name == subProcessFileName){
//					exist = true;
//					break;
//				}
//			if(exist)
//				Alert.show("This file name is exist.");
//			else{
////				var newFileNode:XML=<file/>;
////				newFileNode.@ID = FileIDManager.getAvailabelFileId();
////				newFileNode.@name=subProcessFileName;
////				newFileNode.@type=EditorNavigatorChild.FIGURE_EDITOR_TYPE;
//////				fileNavigatorViewVH.addAndExpandItem(thisXmlList[j], newFileNode, i + 1, true);
////				subProcessFigure.setSubProcessFileID(newFileNode.@ID);
//			}
		}
	}
}