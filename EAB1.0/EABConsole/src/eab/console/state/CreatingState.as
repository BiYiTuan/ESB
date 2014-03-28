package eab.console.state{

	
	import flash.display.DisplayObject;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	import mx.core.UIComponent;
	import mx.managers.PopUpManager;
	
	import eab.framework.view.ViewLocator;
	import eab.console.figure.Endow2Figure;
	import eab.console.figure.Startow2Figure;
	import eab.console.model.FigureEditorModel;
	import eab.console.model.EABConsoleModelLocator;
	import eab.console.model.ToolPanelModel;
	import eab.console.view.FigureCreateFailedWarning;
	import eab.console.viewhelper.FlowEditViewVH;

	/**
	 * process of drag creating
	 */
	public class CreatingState extends AbstractState{
	
		private var ox:Number=0;
		private var oy:Number=0;
		
		private var toolPanelModel :ToolPanelModel;
		
		public function CreatingState(){
			super();

			this.toolPanelModel = EABConsoleModelLocator.getInstance().getToolPanelModel();
		}

		override public function mouseDown(point:Point,event:MouseEvent):void{			
			ox=point.x;
			oy=point.y;			
		}

		override public function mouseUp(point:Point,event:MouseEvent):void{	
			this.fcStateDomain.setFCActiveState(new SelectionState());
			
			var activeModel : FigureEditorModel = getActiveEditorModel();
			if(activeModel == null)
				return;	
			
			var i:int;
			var arr:Array;
			var fcfw :FigureCreateFailedWarning;
			var flowEditVH : FlowEditViewVH;
			if(this.toolPanelModel.selectedFigure is Startow2Figure){
				arr=new Array();
				activeModel.rootFigure.ifiguretoarray(arr);
				for(i=0;i<arr.length;i++){
					if(arr[i] is Startow2Figure){
						fcfw = PopUpManager.createPopUp(EABConsoleModelLocator.getInstance().getEABConsole(),
															 FigureCreateFailedWarning, true) as FigureCreateFailedWarning;

						PopUpManager.centerPopUp(fcfw);
						flowEditVH = getActiveEditorViewHelper();
						flowEditVH.removeFiguresFromCanvas( DisplayObject(toolPanelModel.selectedFigure) );
						return;
					}
					else{
						continue;
					}
				}
			}
			if(this.toolPanelModel.selectedFigure is Endow2Figure){
				arr=new Array();
				activeModel.rootFigure.ifiguretoarray(arr);
				for(i=0;i<arr.length;i++){
					if(arr[i] is Endow2Figure){
						fcfw = PopUpManager.createPopUp(EABConsoleModelLocator.getInstance().getEABConsole(),
															 FigureCreateFailedWarning, true) as FigureCreateFailedWarning;

						PopUpManager.centerPopUp(fcfw);
						flowEditVH = getActiveEditorViewHelper();
						flowEditVH.removeFiguresFromCanvas( DisplayObject(toolPanelModel.selectedFigure) );
						return;
					}
					else{
						continue;
					}
				}
			}

			this.toolPanelModel.selectedFigure.setID(activeModel.idManager.getAvailabelId());
			
			activeModel.rootFigure.addchild(this.toolPanelModel.selectedFigure);
			this.toolPanelModel.selectedFigure.updateDraw();	

// TODO
//			getActiveEditorView().toolPanel.resetAllSelections();
			
//			this.toolPanelModel.selectedFigure.updateDraw();
		}

		override public function mouseMove(point:Point,event:MouseEvent):void{						
			var x:Number=point.x;
			var y:Number=point.y;		
			
			toolPanelModel.selectedFigure.setposition(ox,oy);
			toolPanelModel.selectedFigure.autosetsize(x,y,0);
			toolPanelModel.selectedFigure.updateDraw();
		}
		
		
	}
}