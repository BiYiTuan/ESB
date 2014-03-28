package eab.console.commands
{
	import mx.controls.Alert;
	
	import eab.framework.commands.EABCommand;
	import eab.framework.control.EABFrameworkEvent;
	import eab.framework.view.ViewLocator;
	import eab.console.model.FigureEditorModel;
	import eab.console.model.EditorNavigatorModel;
	import eab.console.model.EABConsoleModelLocator;
	import eab.console.viewhelper.EditorNavigatorVH;

	/**
	 * Close the FigureEditor page and then cancel it.
	 */ 
	public class CancleCloseFigureEditorCMD extends EABCommand
	{
		public function CancleCloseFigureEditorCMD()
		{
			super();
		}

		override public function execute(event :EABFrameworkEvent) :void{
//			var closedFigureEditor : FigureEditor = event.data.closedFigureEditor as FigureEditor;
//			
//			if(closedFigureEditor == null)
//				Alert.show("closedFigureEditor null in CancleCloseFigureEditorCMD");
//			else {
//				var closedFEModel : FigureEditorModel = closedFigureEditor.figureEditorModel;
//				
//				//readd cancled-closing figure editor
//				var viewLoc : ViewLocator =  ViewLocator.getInstance();
//				var feNavModel :EditorNavigatorModel = 
//					EABConsoleModelLocator.getInstance().getFigureEditorNavigatorModel();
//				var feNavVH : EditorNavigatorVH = 
//					ViewLocator.getInstance().getViewHelper(EditorNavigatorVH.VH_KEY) as EditorNavigatorVH;
//				feNavVH.createNewFigureEditor(closedFEModel, closedFigureEditor.filePath, closedFigureEditor.label);
//				var feVH : FigureEditorVH = viewLoc.getViewHelper(FigureEditorVH.getViewHelperKey(closedFEModel.fileID)) as FigureEditorVH;
//				
//				//reset current state and active figure editor model
//				feNavModel.activeFigureEditorModel = closedFigureEditor.figureEditorModel;
//				
//				feNavVH.SwithToGivenFileID(closedFEModel.fileID);
//			}
		}
		
	}
}