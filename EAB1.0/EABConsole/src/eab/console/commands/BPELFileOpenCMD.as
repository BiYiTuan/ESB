package eab.console.commands
{
	import eab.framework.commands.SequenceCommand;
	import eab.framework.control.EABFrameworkEvent;
	import eab.console.events.FigureEditorNavigatorAppEvent;
	import eab.console.model.BpelEditorModel;
	import eab.console.model.EditorNavigatorModel;
	import eab.console.model.EABConsoleModelLocator;
	
	/**
	 * Open the selected BPEL file.
	 */ 
	public class BPELFileOpenCMD extends SequenceCommand{
		
		
		public function BPELFileOpenCMD(){
			super();
		}
		
		
		/**
		 * 
		 * @param event {fileID, filePath, fileName, relativeFigureFileID}
		 * 
		 */
		override public function execute(event :EABFrameworkEvent) :void{
			
			//1. creat the bpelEditorModel, if already exist, return the old one
//			var feNavModel :EditorNavigatorModel = 
//					EABConsoleModelLocator.getInstance().getFigureEditorNavigatorModel();
//			
//			var beModel :BpelEditorModel = feNavModel.addBpelEditorModel(
//					event.data.fileID, event.data.relativeFigureFileID);
//			
//			//2. active the bpelEditorpage
//			this.nextEvent = new FigureEditorNavigatorAppEvent(FigureEditorNavigatorAppEvent.ACTIVE_BPELEDITOR_PAGE,
//					{ fileID:event.data.fileID, filePath:event.data.filePath, 
//					  fileName:event.data.fileName, bpelEditorModel:beModel }
//					);
//			this.executeNextCommand();
		}

	}
}