package eab.console.commands
{
	import eab.framework.commands.EABCommand;
	import eab.framework.control.EABFrameworkEvent;
	import eab.framework.view.ViewLocator;
	import eab.console.figure.ProcessFigure;
	import eab.console.model.FigureEditorModel;
	import eab.console.model.EditorNavigatorModel;
	import eab.console.model.EABConsoleModelLocator;

	public class ChangeToXMLViewCMD extends EABCommand{
		
		
		public function ChangeToXMLViewCMD(){
			super();
		}
		/**
		 * 
		 * @param event
		 * 
		 */
		override public function execute(event :EABFrameworkEvent) :void{
			
//			var feNavModel :EditorNavigatorModel = 
//				EABConsoleModelLocator.getInstance().getEditorNavigatorModel();
//			
//			var processFigure :ProcessFigure = ProcessFigure(feNavModel.activeFigureEditorModel.rootFigure);
//			var activeFEModel :FigureEditorModel = feNavModel.activeFigureEditorModel;
//			
//			var feVH :FigureEditorVH = ViewLocator.getInstance().getViewHelper(
//					FigureEditorVH.getViewHelperKey(activeFEModel.fileID) ) as FigureEditorVH;
//	
//			if(feVH == null)
//				throw new Error("no binding with existed figure editor model");
//			else
//				feVH.setFEXMLContent(processFigure.outputAllInformation().toXMLString());
			
		}

	}
}