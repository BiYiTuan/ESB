package eab.console.state{
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	import eab.console.figure.ConnectionFigure;
	import eab.console.figure.IFigure;
	import eab.console.model.AttributeViewModel;
	import eab.console.model.FigureEditorModel;
	import eab.console.model.EABConsoleModelLocator;

	public class MovingState extends AbstractState{
		
		private var fx:Number=0;
		private var fy:Number=0;
		
		private var attributeViewModel :AttributeViewModel;

		public function MovingState(){
			super();
			
			this.attributeViewModel = 
				EABConsoleModelLocator.getInstance().getAttributeViewModel();
		}

		override public function mouseDown(point:Point,event:MouseEvent):void{
			var activeModel : FigureEditorModel = getActiveEditorModel();
			if(activeModel == null)
				return;	
			
			var tempArr:Array = activeModel.selectedFigures;
			var i:int;
			for(i=0;i<tempArr.length;i++){
				IFigure(tempArr[i]).setIsShowContextPanel(false);
			}
			fx = point.x;
			fy = point.y;
		}

		override public function mouseUp(point:Point,event:MouseEvent):void{
			var i:int;
			
			var activeModel : FigureEditorModel = getActiveEditorModel();
			if(activeModel == null)
				return;	
			
			var tempArr:Array = activeModel.selectedFigures;
			if(tempArr.length==1){
				IFigure(tempArr[0]).setIsShowContextPanel(true);
				IFigure(tempArr[0]).updateDraw();
			}
			else{
				for(i=0;i<tempArr.length;i++){
					IFigure(tempArr[i]).setIsShowContextPanel(false);
					IFigure(tempArr[i]).updateDraw();
				}
			}
			this.fcStateDomain.setFCActiveState(new SelectionState());
		}

		override public function mouseMove(point:Point,event:MouseEvent):void{

			var tempArr:Array;
			var tempIFigure:IFigure;
			var dx:Number;
			var dy:Number;
			var x:Number=point.x;
			var y:Number=point.y;
			
			var activeModel : FigureEditorModel = getActiveEditorModel();
			if(activeModel == null)
				return;	
			
			tempArr = activeModel.selectedFigures;

			dx=x-fx;
			dy=y-fy;
			
			for(var i:int=0; i<tempArr.length; i++){
				
				tempIFigure=IFigure(tempArr[i]);
				if(tempIFigure is ConnectionFigure){
					continue;
				}
				
				tempIFigure.setposition(tempIFigure.getdrawx()+dx,tempIFigure.getdrawy()+dy);
				tempIFigure.updateDraw();
			}
			fx=x;
			fy=y;
		}		
	}
}