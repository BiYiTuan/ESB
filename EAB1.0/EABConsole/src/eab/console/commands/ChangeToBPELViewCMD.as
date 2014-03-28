package eab.console.commands
{
	import eab.framework.commands.EABCommand;
	import eab.framework.control.EABFrameworkEvent;
	import eab.framework.view.ViewLocator;
	import eab.console.business.BpelCreator;
	import eab.console.figure.ProcessFigure;
	import eab.console.model.FigureEditorModel;
	import eab.console.model.EditorNavigatorModel;
	import eab.console.model.EABConsoleModelLocator;

	/**
	 * Show the flow chart in the BPEL view.
	 */ 
	public class ChangeToBPELViewCMD extends EABCommand
	{
		public function ChangeToBPELViewCMD(){
			super();
		}
		
		/**
		 * 
		 * @param event 
		 * 
		 */
		override public function execute(event : EABFrameworkEvent) :void{
			//added by zjn
//			var figureEditorNavigatorModel :EditorNavigatorModel = EABConsoleModelLocator.getInstance().getEditorNavigatorModel();
//			var activeFEModel :FigureEditorModel = figureEditorNavigatorModel.activeFigureEditorModel;
//			var figureEditor : FigureEditor;
//			var figureEditorVH :FigureEditorVH;
//			var relBpelFileID :String;
//			
//			if(activeFEModel != null){
//				activeFEModel.updateCanvasXML();
//				figureEditorVH = ViewLocator.getInstance().getViewHelper(FigureEditorVH.getViewHelperKey(activeFEModel.fileID)) as FigureEditorVH;
//				var bpelCreator :BpelCreator = new BpelCreator();
//				var bpelText :String = bpelCreator.outBpelStirng(ProcessFigure(activeFEModel.rootFigure));
//				figureEditorVH.setFEXMLContent(bpelText);
//			}
		}
	}
}