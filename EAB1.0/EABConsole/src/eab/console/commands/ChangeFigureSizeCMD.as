package eab.console.commands
{
	import flash.geom.Point;
	
	import eab.framework.commands.EABCommand;
	import eab.framework.control.EABFrameworkEvent;
	import eab.console.figure.IFigure;
	import eab.console.model.EABConsoleModelLocator;
	import eab.console.state.SelectionState;

	/**
	 * Change the size of the selected figure.
	 */
	public class ChangeFigureSizeCMD extends EABCommand{


		public function ChangeFigureSizeCMD(){
			super();
		}
		
		/**
		 * 
		 * @param event {resizedFigure, direction, point}
		 * 
		 */
		override public function execute(event : EABFrameworkEvent) :void{
			//resize current figure	
			var resizedFigure :IFigure = event.data.resizedFigure as IFigure;
			var direction :int = event.data.direction as int;
			var point :Point = event.data.point as Point;
			
			resizedFigure.autosetsize(point.x,point.y,direction);
			resizedFigure.updateDraw();
			
			EABConsoleModelLocator.getInstance().getFigureCanvasStateDomain().setFCActiveState(new SelectionState());
		}
	}
}