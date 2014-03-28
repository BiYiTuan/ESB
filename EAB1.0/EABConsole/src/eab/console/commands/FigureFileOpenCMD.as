package eab.console.commands
{
	import eab.console.business.EABConsoleServiceLocator;
	import eab.console.events.FigureEditorNavigatorAppEvent;
	import eab.console.model.EABConsoleModelLocator;
	import eab.console.model.FigureEditorModel;
	import eab.console.model.EditorNavigatorModel;
	import eab.framework.commands.SequenceCommand;
	import eab.framework.control.EABFrameworkEvent;
	
	import mx.controls.Alert;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.remoting.RemoteObject;
	
	public class FigureFileOpenCMD extends SequenceCommand{
		
		private var _fileID :String;
		private var _filePath :String;
		private var _fileName :String;
		private var _figureEditorModel :FigureEditorModel;
		
		public function FigureFileOpenCMD(){
			super();
		}

		/**
		 * @param event {fileID, filePath, fileName }
		 */
		override public function execute(event :EABFrameworkEvent) :void{
			
//			//1. creat the figureEditorModel, if already exist, return the old one
//			var feNavModel :EditorNavigatorModel = 
//					EABConsoleModelLocator.getInstance().getEditorNavigatorModel();
//			this._fileID = event.data.fileID;
//			this._filePath = event.data.filePath;
//			this._fileName = event.data.fileName;
//			this._figureEditorModel = feNavModel.addFigureEditorModel(this._fileID);
//			
//			var remote :RemoteObject = EABConsoleServiceLocator.getInstance().GetRemoteObject("navigator");
//			remote.openFile(event.data.filePath);
//			
//			remote.addEventListener(ResultEvent.RESULT, openFileResult);
//			remote.addEventListener(FaultEvent.FAULT, fault);
//		}
//		private function openFileResult(event :ResultEvent):void{
//			var str:String=event.result.valueOf();
//			var xml:XML=XML(str);
//			this._figureEditorModel.rootFigure.readInformationToFigure(xml);
//			
//			this._figureEditorModel.idManager.setAvailabelId(int(xml.@maxId));
//			
//			this._figureEditorModel.updateCanvasXML();
//			
//			//2. active the figureEditorpage
//			this.nextEvent = new FigureEditorNavigatorAppEvent(FigureEditorNavigatorAppEvent.ACTIVE_FIGUREEDITOR_PAGE,
//					{ fileID:this._fileID, filePath:this._filePath, 
//					  fileName:this._fileName, figureEditorModel:this._figureEditorModel }
//					);
//			
//			this.executeNextCommand();
		}
		private function fault(event :FaultEvent):void{
        	Alert.show("Remote invoke error: "+event.message);
        }

	}
}