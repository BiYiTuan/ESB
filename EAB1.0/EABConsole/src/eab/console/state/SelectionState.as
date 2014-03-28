package eab.console.state
{
	
	import eab.console.figure.*;
	import eab.console.model.*;
	
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	import eab.console.events.FigureCanvasAppEvent;

	public class SelectionState extends AbstractState{
		
		private var  attrViewModel :AttributeViewModel;
		
		public function SelectionState(){
			super();
			this.attrViewModel = EABConsoleModelLocator.getInstance().getAttributeViewModel();
		}

		override public function mouseDown(point:Point, event:MouseEvent):void{

			var ox:Number=point.x;
			var oy:Number=point.y;
			var i:int;
			var num:int;
			var j:int;			
			
			var activeModel : FigureEditorModel = getActiveEditorModel();
			if(activeModel == null)
				return;	

			var selectedFigures:Array = activeModel.selectedFigures;
		
			for(i=0; i<selectedFigures.length; i++){
				num = IFigure(selectedFigures[i]).changedirection(ox,oy);
				if(num!=0){ 
					for(j=0;j<selectedFigures.length;j++){
						IFigure(selectedFigures[j]).hideContextPanel();
					}
					this.fcStateDomain.setFCActiveState(new ChangeSizeState(IFigure(selectedFigures[i]), num));
					return;
				}
			}
			
			if(!event.ctrlKey){
				this.clickXY(point,event);
			}else{
				this.ctrlClickXY(point,event);
			}
		}		
		
		private function clickXY(point:Point,event:MouseEvent):void{
			var x:Number=point.x;
			var y:Number=point.y;
			
			var activeModel : FigureEditorModel = getActiveEditorModel();
			if(activeModel == null)
				return;	

			var selectedFigures:Array = activeModel.selectedFigures;

			var temp:IFigure = activeModel.rootFigure.getupperfigure(x,y);
			var i:int;
			
			if(temp!=null){
				
				if(selectedFigures.indexOf(temp)==-1){
					activeModel.resetSelectedFigure();
				}
				
				temp.ifiguretoarray(selectedFigures);
				
				if(temp.isin(x,y)==1){
					this.fcStateDomain.setFCActiveState(new MovingState());
					this.fcStateDomain.mouseDown(point,event);
				}
				
			}else{
				activeModel.resetSelectedFigure();
				this.fcStateDomain.setFCActiveState(new MultiSelectionState());
				this.fcStateDomain.mouseDown(point,event);
			}
			
			for(i=0;i<selectedFigures.length;i++){
				AbstractFigure(selectedFigures[i]).setSelected(true);
				AbstractFigure(selectedFigures[i]).updateDraw();
			}
		}
		
		
		private function ctrlClickXY(point:Point,event:MouseEvent):void{
			var x:Number=point.x;
			var y:Number=point.y;
			
			var activeModel : FigureEditorModel = getActiveEditorModel();
			if(activeModel == null)
				return;	
			
			var selectedFigures:Array=activeModel.selectedFigures;
			var temp:IFigure = activeModel.rootFigure.getupperfigure(x,y);
			
			if(temp!=null){
				
				if(selectedFigures.indexOf(temp)==-1){
					temp.ifiguretoarray(selectedFigures);
					temp.setSelected(true);
					
				}else{
					selectedFigures.splice(selectedFigures.indexOf(temp),1);
					temp.setSelected(false);
				}
				
				temp.updateDraw();
				
			}
		}
		
		override public function keyDown(event:KeyboardEvent):void{	
			var activeModel : FigureEditorModel = getActiveEditorModel();
			if(activeModel == null)
				return;	
				
			switch(event.keyCode){
				case 46: //del		
					// figure delete handle
					new FigureCanvasAppEvent(FigureCanvasAppEvent.POP_FIGURE_DELETE_CONFIRM, 
							{fileID :activeModel.fileID} ).dispatch();
					break;
				case 71: //CG
					// figure copy handle
					if(event.ctrlKey){
						new FigureCanvasAppEvent(FigureCanvasAppEvent.FIGURES_COPY,
								{fileID :activeModel.fileID} ).dispatch();
					}
					break;
				case 85: //VU
					//figure paste handle
					if(event.ctrlKey){
						new FigureCanvasAppEvent(FigureCanvasAppEvent.FIGURES_PASTE, 
								{fileID :activeModel.fileID} ).dispatch();
					}
					break;
				case 37: //LEFT
					new FigureCanvasAppEvent(FigureCanvasAppEvent.MOVE_LEFT,
							{fileID :activeModel.fileID} ).dispatch();
					break;
				case 38: //UP
					new FigureCanvasAppEvent(FigureCanvasAppEvent.MOVE_UP,
							{fileID :activeModel.fileID} ).dispatch();
					break;
				case 39: //RIGHT
					new FigureCanvasAppEvent(FigureCanvasAppEvent.MOVE_RIGHT,
							{fileID :activeModel.fileID} ).dispatch();
					break;
				case 40: //DOWN
					new FigureCanvasAppEvent(FigureCanvasAppEvent.MOVE_DOWN,
							{fileID :activeModel.fileID} ).dispatch();		
					break;
				default:
					break;
			}			
		}		
	}
}
