package eab.console.state
{
	
	import flash.display.DisplayObject;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	import eab.framework.view.ViewLocator;
	import eab.console.events.FigureCanvasAppEvent;
	import eab.console.figure.*;
	import eab.console.model.EABConsoleModelLocator;
	import eab.console.model.ToolPanelModel;
	import eab.console.events.ToolPanelAppEvent;
	
	public class CreateConnectionEndState extends AbstractState{
		
		private var toolPanelModel :ToolPanelModel;
				
		public function CreateConnectionEndState(){
			
			super();
			this.toolPanelModel = EABConsoleModelLocator.getInstance().getToolPanelModel();
		}

		override public function mouseMove(point:Point,event:MouseEvent):void{

			var ox : Number = point.x;
			var oy : Number = point.y;
			var cf : ConnectionFigure = ConnectionFigure(toolPanelModel.selectedFigure);

			//repaint while dragging
			cf.drawclear();
			cf.setTailposition(ox,oy);
			
			var p:Point=new Point(ox,oy);
			
			cf.setposition(GraphicalFigure(cf.getStartFigure()).getEdgePoint(p).x,
				GraphicalFigure(cf.getStartFigure()).getEdgePoint(p).y);
				
			cf.drawpicture();
			
			//and the connection to canvas again, for rollout reason, 
			super.getActiveEditorViewHelper().addFigureToCanvas( cf.getuic());
		}

		override public function mouseDown(point:Point,event:MouseEvent):void{

			var ox : Number = point.x;
			var oy : Number = point.y;
			var cf : ConnectionFigure = ConnectionFigure(toolPanelModel.selectedFigure);
			
			var endFigureT : IFigure = super.getActiveEditorModel().rootFigure.getupperfigure(ox,oy);
						
			if(endFigureT && (endFigureT is GraphicalFigure) && endFigureT != cf.getStartFigure() ){
						
				new FigureCanvasAppEvent(FigureCanvasAppEvent.CREATE_CONNECTION_END,
					{endFigure :endFigureT}).dispatch();
				
			}else{
				cf.setStartFigure(null);
			
				super.getActiveEditorViewHelper().removeFiguresFromCanvas(cf);
			}
			
			var selectedFigureName:String="Link";
			var selectedFigId : int = FigureFactory.nametoid(selectedFigureName);
			
			new ToolPanelAppEvent( ToolPanelAppEvent.SELECT_FIGURE,
				{selectedFigureId :selectedFigId} ).dispatch();

//			this.fcStateDomain.setFCActiveState(new SelectionState());
		}

		override public function RollOut(event:MouseEvent):void{			
			super.getActiveEditorViewHelper().removeFiguresFromCanvas(DisplayObject(toolPanelModel.selectedFigure));			
		}
	}
}