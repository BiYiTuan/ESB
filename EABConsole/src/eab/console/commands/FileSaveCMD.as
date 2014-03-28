package eab.console.commands
{
	import mx.controls.Alert;
	import mx.messaging.Producer;
	import mx.messaging.messages.AsyncMessage;
	import mx.messaging.messages.IMessage;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.remoting.RemoteObject;
	
	import eab.framework.commands.EABCommand;
	import eab.framework.control.EABFrameworkEvent;
	import eab.framework.view.ViewLocator;
	import eab.console.figure.ProcessFigure;
	import eab.console.model.EditorNavigatorModel;
	import eab.console.model.EABConsoleModelLocator;
	import eab.console.view.EditorNavigatorChild;
	import eab.console.viewhelper.EditorNavigatorVH;
	import eab.console.viewhelper.FigureEditorVH;
	import eab.console.business.EABConsoleServiceLocator;
	/**
	 * Save the active file
	 */ 
	public class FileSaveCMD extends EABCommand
	{
		private var figureEditorNavigatorVH :EditorNavigatorVH;
		private var figureEditorNavigatorModel :EditorNavigatorModel;
		private var producer :Producer = new Producer;
		private var _fileID :String;
		private var _filePath :String;
		private var _fileName :String;
		public function FileSaveCMD(){
			figureEditorNavigatorVH = ViewLocator.getInstance().getViewHelper(EditorNavigatorVH.VH_KEY) as EditorNavigatorVH;
			figureEditorNavigatorModel = EABConsoleModelLocator.getInstance().editorNavigatorModel;
		}
		/**
		 * 
		 * @param event {}
		 * 
		 */
		override public function execute(event :EABFrameworkEvent) :void{
//			var activeFeNavChild :EditorNavigatorChild = figureEditorNavigatorVH.getSelectedChildOfNavigator();
//			if(activeFeNavChild.type == EditorNavigatorChild.FIGURE_EDITOR_TYPE){
////				modifier  likexin
////				figureEditorNavigatorModel.activeFigureEditorModel.updateCanvasXML();
//				figureEditorNavigatorModel.activeFigureEditorModel.saveCanvasXML();
//				var xml :XML = new XML;
//				xml = ProcessFigure(figureEditorNavigatorModel.activeFigureEditorModel.rootFigure).outputAllInformation();
//				
//				//add by lu 2009-09-24
//				xml.@maxId = figureEditorNavigatorModel.activeFigureEditorModel.idManager.getAvailabelId();
//				
//				
//				this._fileID = figureEditorNavigatorModel.activeFigureEditorModel.fileID;
//				var figureEditorVH :FigureEditorVH = ViewLocator.getInstance().getViewHelper(FigureEditorVH.getViewHelperKey(this._fileID)) as FigureEditorVH;
//				this._filePath = figureEditorVH.filePath;
//				this._fileName = this._filePath.substring(this._filePath.lastIndexOf("\\", this._filePath.length) + 1, this._filePath.length);
//				
//				var remote :RemoteObject = EABConsoleServiceLocator.getInstance().GetRemoteObject("navigator");
//				remote.saveFile(this._filePath, xml.toString());
//				remote.addEventListener(ResultEvent.RESULT, saveFileResult);
//				remote.addEventListener(FaultEvent.FAULT, fault);
//			}
//			else if(activeFeNavChild.type == EditorNavigatorChild.BPEL_EDITOR_TYPE){
//				figureEditorNavigatorModel.activeBpelEditorModel.updateBpelTextByBpelText(figureEditorNavigatorModel.activeBpelEditorModel.getcurrentbpelText());
//			}
		}
		private function saveFileResult(event :ResultEvent):void{
//			producer.destination = "cooperation";
//			var message :AsyncMessage = new AsyncMessage();
//			message.body.fileID = this._fileID;
//			message.body.filePath = this._filePath;
//			message.body.fileName = this._fileName;
//			producer.send(message);
		}
		private function fault(event :FaultEvent):void{
        	Alert.show("Remote invoke error: "+event.message);
        }
	}
}