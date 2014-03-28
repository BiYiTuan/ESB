package eab.console.commands
{
	import mx.events.CloseEvent;
	import mx.managers.PopUpManager;
	
	import eab.framework.commands.SequenceCommand;
	import eab.framework.control.EABFrameworkEvent;
	import eab.console.business.BpelCreator;
	import eab.console.events.FigureEditorNavigatorAppEvent;
	import eab.console.events.FunctionNavigatorViewAppEvent;
	import eab.console.figure.ProcessFigure;
	import eab.console.model.BpelEditorModel;
	import eab.console.model.FigureEditorModel;
	import eab.console.model.EditorNavigatorModel;
	import eab.console.model.FileIDManager;
	import eab.console.model.EABConsoleModelLocator;
	import eab.console.view.BPELFileOverWriteWarning;
	
	/**
	 * Create a new BPEL file, bpelEditorModel and bpelEditorpage by the active activeFigureEditorModel
	 */ 
	public class BPELCreatCMD extends SequenceCommand{
		
		private var relBpelFileID :String;
		private var bpelFileName :String;
		private var bpelFilePath :String;
		private var beModel :BpelEditorModel;
		
		public function BPELCreatCMD(){
			super();
		}
		/**
		 * 
		 * @param event {figureFilePath}
		 * 
		 */
		override public function execute(event :EABFrameworkEvent) :void{
			
//			var orDesModelLoc :EABConsoleModelLocator = EABConsoleModelLocator.getInstance();
//		
//			var feNavModel :EditorNavigatorModel = orDesModelLoc.getEditorNavigatorModel();
//			
//			var activeFEModel :FigureEditorModel = feNavModel.activeFigureEditorModel;
//			
//			relBpelFileID = activeFEModel.relativeBpelID;
//			
//			//1. creat bpel file
//			if(relBpelFileID == null){
//				relBpelFileID = FileIDManager.getAvailabelFileId();
//				activeFEModel.relativeBpelID = relBpelFileID;
//			}
//			activeFEModel.updateCanvasXML();
//			
//			var figureFilePath :String = event.data.figureFilePath;
//			
//			bpelFilePath = figureFilePath.substring(0, figureFilePath.length-4) + ".bpel";
//
//			bpelFileName = bpelFilePath.substring( bpelFilePath.lastIndexOf("\\")+1,  bpelFilePath.length);
//
////			new FunctionNavigatorViewAppEvent(FunctionNavigatorViewAppEvent.NEW_BPEL_FILE,
////					{fileID :relBpelFileID, filePath :bpelFilePath, fileName :bpelFileName}).dispatch();
//			
//			
//			//2. creat the bpelEditorModel, if already exist, return the old one
//			
//			beModel = feNavModel.addBpelEditorModel(relBpelFileID, activeFEModel.fileID);
//			
//			//3. active the bpelEditorpage
//			if(beModel.bpelText == null){
//				beModel.updateBpelTextByActiveFEModel();
//				new FigureEditorNavigatorAppEvent(FigureEditorNavigatorAppEvent.ACTIVE_BPELEDITOR_PAGE,
//					{fileID :relBpelFileID, filePath:bpelFilePath, fileName:bpelFileName, bpelEditorModel:beModel }
//					).dispatch();
//			}
//			else{
//				var currentBPELText :String = beModel.bpelText;
//				var newBPELText :String;
//				var bpelCreator :BpelCreator = new BpelCreator();
//				
//				newBPELText = bpelCreator.outBpelStirng(ProcessFigure(orDesModelLoc.getEditorNavigatorModel().activeFigureEditorModel.rootFigure) );
//				if(currentBPELText.localeCompare(newBPELText) != 0){
//					var isOverWrite :BPELFileOverWriteWarning = BPELFileOverWriteWarning(PopUpManager.createPopUp(EABConsoleModelLocator.getInstance().getEABConsole(), BPELFileOverWriteWarning,true));
//					isOverWrite.setText(bpelFileName);
//					PopUpManager.centerPopUp(isOverWrite);
//					isOverWrite.addEventListener(CloseEvent.CLOSE, onBpelHandelResult);
//					new FigureEditorNavigatorAppEvent(FigureEditorNavigatorAppEvent.ACTIVE_BPELEDITOR_PAGE,
//							{fileID :relBpelFileID, filePath:bpelFilePath, fileName:bpelFileName, bpelEditorModel:beModel }
//							).dispatch();
//				}
//			}
		}
		private function onBpelHandelResult(event :CloseEvent) :void{
			beModel.updateBpelTextByActiveFEModel();
			new FigureEditorNavigatorAppEvent(FigureEditorNavigatorAppEvent.ACTIVE_BPELEDITOR_PAGE,
					{fileID :relBpelFileID, filePath:bpelFilePath, fileName:bpelFileName, bpelEditorModel:beModel }
					).dispatch();
		}
	}
}