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
	 * Create a new BPELfile in fileNavigator.
	 */ 
	public class NewBPELFileCMD extends EABCommand
	{
		public function NewBPELFileCMD(){
			super();
		}
		/**
		 * 
		 * @param event {fileID, filePath, fileName}
		 * 
		 */
		override public function execute(event :EABFrameworkEvent) :void{
//			var fileNavigatorViewVH :FunctionNavigatorViewVH = 
//					ViewLocator.getInstance().getViewHelper(FunctionNavigatorViewVH.VH_KEY) as FunctionNavigatorViewVH;
//			var fileNavigatorViewModel :FunctionNavigatorViewModel =
//					EABConsoleModelLocator.getInstance().getFileNavigatorViewModel();
//			
//			var bpelFilePath: String = event.data.filePath;
//			var bpelFileName: String = event.data.fileName;	
//			var figureFileName :String = bpelFileName.substring(0 ,bpelFileName.length - 5) + ".xml";
//			
//			var newBpelFileNode:XML=<file/>;
//			newBpelFileNode.@ID = event.data.fileID;
//			newBpelFileNode.@name = bpelFileName;
//			newBpelFileNode.@type = EditorNavigatorChild.BPEL_EDITOR_TYPE;
//			var theParentItem:Object;
//			theParentItem=fileNavigatorViewModel.xmlList.children();
//			var startIndex:int=0;
//			var endIndex:int=0;
//			var path:Array=new Array;
//			while(bpelFilePath.indexOf("\\",startIndex)>0){
//				endIndex=bpelFilePath.indexOf("\\",startIndex);
//				path.push(bpelFilePath.substring(startIndex,endIndex));
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
//			for(i = 0; i < temp.length(); i++)
//				if( XML(temp[i]).@name == figureFileName)
//					break;
//			var tag:Boolean = temp.contains(newBpelFileNode);
//			if(!tag){
//				fileNavigatorViewVH.addAndExpandItem(thisXmlList[j], newBpelFileNode, i + 1, true);
//				
//				var remote :RemoteObject = EABConsoleServiceLocator.getInstance().GetRemoteObject("navigator");
//				remote.createNewFile(event.data.fileName, bpelFilePath.substring(0, bpelFilePath.lastIndexOf("\\", bpelFilePath.length)));
//				remote.addEventListener(FaultEvent.FAULT,fault);
//			}
		}
		private function fault(event :FaultEvent):void{
        	Alert.show("Remote invoke error: "+event.message);
        }
	}
}