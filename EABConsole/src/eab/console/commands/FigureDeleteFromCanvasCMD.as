package eab.console.commands
{
	import eab.console.events.FigureCanvasAppEvent;
	import eab.console.figure.AbstractFigure;
	import eab.console.figure.IFigure;
	import eab.console.model.FigureEditorModel;
	import eab.console.viewhelper.FlowEditViewVH;
	import eab.framework.control.EABFrameworkEvent;

	public class FigureDeleteFromCanvasCMD extends EABEditorCommand{
		
		
		public function FigureDeleteFromCanvasCMD(){
			super();
		}

		override public function execute(event :EABFrameworkEvent) :void{			
			var delArr :Array = new Array();
			var delArr1 :Array = new Array();
			
			var fileID :String = event.data.fileID;
			
			var feVH :FlowEditViewVH = this.getActiveEditorViewHelper();
			
			var feModel :FigureEditorModel = this.getActiveEditorModel();
			
			if(feModel == null)
				return;
			
			var selectedFigures :Array = feModel.selectedFigures;
			
			var rootFigure :IFigure = feModel.rootFigure;
			var j:int;
			for(var i:int=0; i<selectedFigures.length; i++){
				rootFigure.removechildWithConnection( AbstractFigure(selectedFigures[i]), delArr, delArr1);
				for(j=0;j<delArr.length;j++){
					if(selectedFigures.indexOf(delArr[j])==-1){
						selectedFigures.push(delArr[j]);
					}
				}
				for(j=0;j<delArr1.length;j++){
					if(selectedFigures.indexOf(delArr1[j])==-1){
						selectedFigures.push(delArr1[j]);
					}
				}
				IFigure(selectedFigures[i]).setSelected(false);
				feVH.removeFiguresFromCanvas( AbstractFigure(selectedFigures[i]) );
			}
			new FigureCanvasAppEvent(FigureCanvasAppEvent.Canvas_Children_Changed,
					{canvas :null}).dispatch();
		}
	
	}
}