package eab.console.state{
	
	import eab.console.cursor.LinkCursor;
	import eab.console.events.FigureCanvasAppEvent;
	import eab.console.figure.ConnectionFigure;
	import eab.console.figure.GraphicalFigure;
	import eab.console.figure.IFigure;
	import eab.console.model.EABConsoleModelLocator;
	import eab.console.model.FigureEditorModel;
	import eab.console.model.ToolPanelModel;
	import eab.console.viewhelper.EditorNavigatorVH;
	import eab.console.viewhelper.FlowEditViewVH;
	import eab.framework.view.ViewLocator;
	
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	import mx.managers.CursorManager;
	
	
	/**
	 * CreateConnectionStartState
	 * 
	 */
	public class CreateConnectionStartState extends AbstractState{	
		
		private var toolPanelModel : ToolPanelModel;
		private var figureEditorModel :FigureEditorModel;
		private var figureEditorVH : FlowEditViewVH;

		public function CreateConnectionStartState(){
			super();
			toolPanelModel = EABConsoleModelLocator.getInstance().getToolPanelModel();
			figureEditorModel = getActiveEditorModel();			
			figureEditorVH = getActiveEditorViewHelper();
		}		
		
		override public function mouseDown(point:Point, event:MouseEvent):void{
						
			CursorManager.removeAllCursors();
			var ox : Number = point.x;
			var oy : Number = point.y;
			var startFigureT : IFigure = figureEditorModel.rootFigure.getupperfigure(ox,oy);
			
			var connection : ConnectionFigure = ConnectionFigure(toolPanelModel.selectedFigure);

			if( startFigureT && (startFigureT is GraphicalFigure) ){
				new FigureCanvasAppEvent(FigureCanvasAppEvent.CREATE_CONNECTION_START,
					{startFigure :startFigureT} ).dispatch();
				
			}else{
				this.fcStateDomain.setFCActiveState(new SelectionState());

// TODO
//				getActiveEditorView().toolPanel.resetAllSelections();

			}
		}
		
		override public function mouseMove(point:Point, event:MouseEvent):void{
			
			//add new figure to figure canvas(VIEW)
			if(figureEditorVH == null)
				throw new Error("no binding with existed figure editor model");
			else {
				CursorManager.setCursor(LinkCursor);
			}
		}
		
		override public function RollOver(event :MouseEvent) :void{

			//add new figure to figure canvas(VIEW)
			if(figureEditorVH == null)
				throw new Error("no binding with existed figure editor model");
			else {
				CursorManager.setCursor(LinkCursor);
			}
		}
		
		override public function RollOut(event :MouseEvent) :void{						
			CursorManager.removeAllCursors();
		}
		
	}
}