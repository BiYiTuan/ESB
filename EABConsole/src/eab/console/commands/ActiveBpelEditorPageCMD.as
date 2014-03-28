package eab.console.commands
{
	import eab.framework.commands.EABCommand;
	import eab.framework.control.EABFrameworkEvent;
	import eab.framework.view.ViewLocator;
	import eab.console.model.BpelEditorModel;
	import eab.console.model.FigureEditorModel;
	import eab.console.model.EditorNavigatorModel;
	import eab.console.model.EABConsoleModelLocator;
	import eab.console.view.Microimage;
	import eab.console.viewhelper.BpelEditorVH;
	import eab.console.viewhelper.EditorNavigatorVH;

	public class ActiveBpelEditorPageCMD extends EABCommand{
		
		
		public function ActiveBpelEditorPageCMD(){
			super();
		}
		
		
		/**
		 * 
		 * @param event { fileID, filePath, fileName, bpelEditorModel }
		 * 
		 */
		override public function execute(event :EABFrameworkEvent) :void{
			
//			var viewLoc :ViewLocator =  ViewLocator.getInstance();
//			
//			var feNavVH :EditorNavigatorVH = 
//					ViewLocator.getInstance().getViewHelper(EditorNavigatorVH.VH_KEY) as EditorNavigatorVH;
//					
//			var feNavModel :EditorNavigatorModel = 
//					EABConsoleModelLocator.getInstance().getEditorNavigatorModel();
//					
//			var activeFEModel :FigureEditorModel = feNavModel.activeFigureEditorModel;
//			
//			var beVH :BpelEditorVH;
//			
//			var beModel :BpelEditorModel = event.data.bpelEditorModel as BpelEditorModel;
//			//1. find if the bpelEditorPage exist		
//			if( viewLoc.registrationExistsFor(BpelEditorVH.getViewHelperKey(event.data.fileID)) ){
//				beVH = viewLoc.getViewHelper(BpelEditorVH.getViewHelperKey(event.data.fileID)) as BpelEditorVH;
//				beVH.updateTextArea(beModel.bpelText);
//			}else{ 
//				//2. creat new bpelEditor
//				feNavVH.createNewBpelEditor(beModel, event.data.filePath, event.data.fileName);
//				
//				beVH = viewLoc.getViewHelper(BpelEditorVH.getViewHelperKey(event.data.fileID)) as BpelEditorVH;
//				
//				// init bpelTextArea
//				beVH.updateTextArea(beModel.bpelText);
//
//			}
//
//			//3. set the activeModel
//			feNavModel.activeBpelEditorModel = beModel;
//			
//			//4. swith tab of bpelEditorNavigator
//			feNavVH.SwithToGivenFileID(event.data.fileID);
		}

	}
}