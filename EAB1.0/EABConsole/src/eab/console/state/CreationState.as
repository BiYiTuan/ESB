package eab.console.state{
	
	
	import eab.console.figure.AbstractFigure;
	import eab.console.model.EABConsoleModelLocator;
	import eab.console.model.ToolPanelModel;
	import eab.console.viewhelper.FlowEditViewVH;
	import eab.framework.view.ViewLocator;
	
	import flash.display.DisplayObject;
	import flash.events.MouseEvent;
	import flash.geom.Point;

	/**
	 * when click figure of the toolPanel, then switch to this state
	 */
	public class CreationState extends AbstractState{
		
		private var toolPanelModel :ToolPanelModel;
				
		public function CreationState(){
			super();
			this.toolPanelModel = EABConsoleModelLocator.getInstance().getToolPanelModel();
		}

		override public function mouseDown(point :Point, event :MouseEvent) :void{
			this.fcStateDomain.setFCActiveState(new CreatingState());
			this.fcStateDomain.mouseDown(point,event);
			
		}

		override public function mouseMove(point :Point,event :MouseEvent):void{
			
			var x:Number=point.x;
			var y:Number=point.y;
			
			var absFigure:AbstractFigure = AbstractFigure(toolPanelModel.selectedFigure);
			
			if(absFigure){ //redraw the figure
//				absFigure.drawclear();
				absFigure.setposition(x,y);
//				absFigure.drawpicture();
				absFigure.updateDraw();
			}
		}

		override public function RollOver(event :MouseEvent) :void{
			
			var flowEditVH : FlowEditViewVH = getActiveEditorViewHelper();
			
			var absFigure:AbstractFigure = AbstractFigure(toolPanelModel.selectedFigure);
			
			//add new figure to figure canvas(VIEW)
			if(flowEditVH == null)
				throw new Error("no binding with existed figure editor model");
			else {
				flowEditVH.addFigureToCanvas(absFigure.getuic());
			}
		}
	
		override public function RollOut(event :MouseEvent) :void{			
			var flowEditVH : FlowEditViewVH = getActiveEditorViewHelper();
						
			flowEditVH.removeFiguresFromCanvas( DisplayObject(toolPanelModel.selectedFigure) );
			
			//if rollOut, then out of this state. 
			EABConsoleModelLocator.getInstance().getFigureCanvasStateDomain().setFCActiveState(new SelectionState());			
		}
				
	}
}