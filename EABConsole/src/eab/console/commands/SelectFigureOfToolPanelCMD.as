package eab.console.commands
{
	import eab.console.figure.*;
	import eab.console.model.EABConsoleModelLocator;
	import eab.console.model.ToolPanelModel;
	import eab.console.state.CreateConnectionStartState;
	import eab.console.state.CreationState;
	import eab.framework.commands.EABCommand;
	import eab.framework.control.EABFrameworkEvent;
	import mx.collections.ArrayCollection;

	public class SelectFigureOfToolPanelCMD extends EABCommand{
		
		
		public function SelectFigureOfToolPanelCMD(){
			super();
		}

		override public function execute(event : EABFrameworkEvent) :void{
			
			var consoleModelLocator : EABConsoleModelLocator = EABConsoleModelLocator.getInstance();
			
			var model : ToolPanelModel = consoleModelLocator.getToolPanelModel();
			
//			var activeFEModel : FigureEditorModel = orDesModelLoc.getEditorNavigatorModel().activeFigureEditorModel;
			
			var selectedFigureId : int = event.data.selectedFigureId as int;
			
			//if selected figure not null, then change the tool panel model's selectedFigure attribute value
			if(selectedFigureId != -1) {
			
				var selectedFigure : IFigure = FigureFactory.createFigure(selectedFigureId);
				
				if(selectedFigure is Activityow2Figure && event.data.figureData != null){
					Activityow2Figure(selectedFigure).figureName = event.data.figureData.name;
					var new_atts:ArrayCollection = new ArrayCollection();
					new_atts.addItem({name: "Service: ", value: event.data.figureData.name});
					Activityow2Figure(selectedFigure).setAttribute(new_atts);
				}
				
//				selectedFigure.setMultiple(activeFEModel._showingMultiple);
				
				model.selectedFigure = selectedFigure;
			
				if(selectedFigure is ConnectionFigure){
					consoleModelLocator.getFigureCanvasStateDomain().setFCActiveState(new CreateConnectionStartState());
					
				}else if(selectedFigure is GraphicalFigure){
					consoleModelLocator.getFigureCanvasStateDomain().setFCActiveState(new CreationState());
				}			
			}
		}
	}
}