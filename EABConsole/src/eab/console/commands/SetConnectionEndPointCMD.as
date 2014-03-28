package eab.console.commands
{
	import eab.console.figure.ConnectionFigure;
	import eab.console.figure.IFigure;
	import eab.console.model.EABConsoleModelLocator;
	import eab.console.model.FigureCanvasStateDomain;
	import eab.console.model.FigureEditorModel;
	import eab.console.model.ToolPanelModel;
	import eab.framework.control.EABFrameworkEvent;

	public class SetConnectionEndPointCMD extends EABEditorCommand{
		
		//model
		private var fcStateDomain : FigureCanvasStateDomain= EABConsoleModelLocator.getInstance().getFigureCanvasStateDomain();
		private var toolPanelModel : ToolPanelModel = EABConsoleModelLocator.getInstance().getToolPanelModel();
		
		//state information
		private var endFigure : IFigure;
		
		public function SetConnectionEndPointCMD(){
			super();
		}
		
		override public function execute(event : EABFrameworkEvent) : void {
			
			var endFigure : IFigure = event.data.endFigure as IFigure;
			var cf : ConnectionFigure = ConnectionFigure(toolPanelModel.selectedFigure);

			var feModel :FigureEditorModel = this.getActiveEditorModel();

			if(feModel == null)
				return;
			
			if(endFigure != null){
				
				this.endFigure = endFigure;
				
				cf.setEndFigure(endFigure);
				cf.autoSetAnchor();
				
				cf.setID(feModel.idManager.getAvailabelId());
				feModel.rootFigure.addchild(toolPanelModel.selectedFigure);
			}
		}
	}
}