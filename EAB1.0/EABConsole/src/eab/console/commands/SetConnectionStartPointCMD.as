package eab.console.commands
{
	import eab.console.figure.ConnectionFigure;
	import eab.console.figure.IFigure;
	import eab.console.model.EABConsoleModelLocator;
	import eab.console.model.FigureCanvasStateDomain;
	import eab.console.model.FigureEditorModel;
	import eab.console.model.ToolPanelModel;
	import eab.console.state.CreateConnectionEndState;
	import eab.console.viewhelper.FlowEditViewVH;
	import eab.framework.control.EABFrameworkEvent;
	import eab.framework.view.ViewLocator;

	public class SetConnectionStartPointCMD extends EABEditorCommand{
		
		
		public function SetConnectionStartPointCMD(){
			super();
		}

		override public function execute(event : EABFrameworkEvent) : void {
			
			//model
			var fcStateDomain : FigureCanvasStateDomain = EABConsoleModelLocator.getInstance().getFigureCanvasStateDomain();
			var toolPanelModel : ToolPanelModel = EABConsoleModelLocator.getInstance().getToolPanelModel();
			var figureEditorModel : FigureEditorModel = getActiveEditorModel();		
			var flowEditorVH : FlowEditViewVH = getActiveEditorViewHelper();	
		
			if(figureEditorModel == null)
				return;
		
			//state information
			var startFigure : IFigure = event.data.startFigure as IFigure;
				
			var curConnection : ConnectionFigure = ConnectionFigure(toolPanelModel.selectedFigure);

			curConnection.setStartFigure(startFigure);
			
			curConnection.setposition(startFigure.getrx(),startFigure.getry());
				
			//add connection figure to active figure canvas
			if(flowEditorVH == null)
				throw new Error("activeFEViewHelper null");
			else				
				flowEditorVH.addFigureToCanvas(curConnection);
				
				
			var i:int;
			for(i = 0; i < figureEditorModel.selectedFigures.length; i++){
				IFigure(figureEditorModel.selectedFigures[i]).hideContextPanel();
			}
			fcStateDomain.setFCActiveState(new CreateConnectionEndState());
			
			//!!!can consider write putting this command into stack here, because if the start figure
			//is null, there's no need to put this command into command stack
		}
	}
}