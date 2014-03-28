package eab.console.commands
{
	import eab.framework.commands.EABCommand;
	import eab.framework.control.EABFrameworkEvent;
	import eab.framework.view.ViewLocator;
	import eab.console.model.EditorNavigatorModel;
	import eab.console.model.EABConsoleModelLocator;
	import eab.console.viewhelper.EditorNavigatorVH;

	public class ActiveFigureEditorPageCMD extends EABCommand{
		
		
		public function ActiveFigureEditorPageCMD(){
			super();
		}
		
		
		/**
		 * 
		 * @param event { fileID, filePath, fileName, figureEditorModel }
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
//			var feVH :FigureEditorVH;
//			
//			//1. find if the figureEditorPage exist		
//			if( viewLoc.registrationExistsFor(FigureEditorVH.getViewHelperKey(event.data.fileID)) ){
//				feVH = viewLoc.getViewHelper(FigureEditorVH.getViewHelperKey(event.data.fileID)) as FigureEditorVH;
//				feVH.loadGraphFile();
//				
//			}else{ //2. creat new figureEditor
//				feNavVH.createNewFigureEditor(event.data.figureEditorModel, event.data.filePath, event.data.fileName);
//				feVH = viewLoc.getViewHelper(FigureEditorVH.getViewHelperKey(event.data.fileID)) as FigureEditorVH;
//			}
//
//			//3. set the activeModel
//			feNavModel.activeFigureEditorModel = event.data.figureEditorModel;
//			
//			//4. swith tab of figureEditorNavigator
//			feNavVH.SwithToGivenFileID(event.data.fileID);
			
		}

	}
}