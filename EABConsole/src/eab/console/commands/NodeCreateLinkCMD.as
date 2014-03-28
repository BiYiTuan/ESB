package eab.console.commands
{
	import eab.framework.commands.EABCommand;
	import eab.framework.control.EABFrameworkEvent;
	import eab.console.events.FigureCanvasAppEvent;
	import eab.console.events.ToolPanelAppEvent;
	import eab.console.figure.FigureFactory;
	import eab.console.figure.IFigure;
	import eab.console.model.FigureCanvasStateDomain;
	import eab.console.model.EditorNavigatorModel;
	import eab.console.model.EABConsoleModelLocator;

	public class NodeCreateLinkCMD extends EABCommand
	{
		public function NodeCreateLinkCMD(){
			super();
		}

		override public function execute(event:EABFrameworkEvent):void{
			
			var selectedFigId : int = FigureFactory.LINK_FIGURE_ID;
			
			new ToolPanelAppEvent( ToolPanelAppEvent.SELECT_FIGURE,
				{selectedFigureId :selectedFigId} ).dispatch();
				
			var startFigure : IFigure = event.data.startFigure as IFigure;
			new FigureCanvasAppEvent(FigureCanvasAppEvent.CREATE_CONNECTION_START,
				{startFigure :startFigure} ).dispatch();			
		}		
	}
}