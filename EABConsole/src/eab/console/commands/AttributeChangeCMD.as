package eab.console.commands
{
	import mx.controls.Alert;
	
	import eab.framework.commands.EABCommand;
	import eab.framework.control.EABFrameworkEvent;
	import eab.console.events.FigureCanvasAppEvent;
	import eab.console.figure.GraphicalFigure;
	import eab.console.model.AttributeViewModel;
	import eab.console.model.EABConsoleModelLocator;
	
	/**
	 * Change the value of the AttributeView
	 * Change the value of a certain row
	 */ 
	public class AttributeChangeCMD extends EABCommand{
		
		
		public function AttributeChangeCMD(){
			super();
		}
		
		/**
		 * 
		 * @param event {newValue, rowIndex }
		 * 
		 */
		override public function execute(event : EABFrameworkEvent) :void{
			
			var orDesModelLoc:EABConsoleModelLocator = EABConsoleModelLocator.getInstance();
			
			var model:AttributeViewModel = orDesModelLoc.getAttributeViewModel();
			
			var newValue : String = event.data.newValue;
			
			var rowIndex : int = new int(event.data.rowIndex);
			
			if(newValue == null  ||  rowIndex == -1) { 
				Alert.show("newValue or rowIndex null in AttributeChangeCMD");
			}
			
			var obj:Object = model.attibutes.getItemAt(rowIndex,0);
			
			obj.value = newValue;
			
			//update model
			model.updateAttribute();
			
			//update figure name in canvas
			if(model.editedFigure != null && rowIndex == 2) {
				model.editedFigure.figureName = newValue;
				model.editedFigure.updateDraw();
				if(model.editedFigure is GraphicalFigure){//by ly 2009-08-24 14:16
					GraphicalFigure(model.editedFigure).setFigureSizeAccordingTolblNodeName();
				}
				model.editedFigure.updateDraw();
				new FigureCanvasAppEvent(FigureCanvasAppEvent.Canvas_Children_Changed,//by ly 2009-08-24 14:16
					{canvas :null}).dispatch();
			}
		}
	}
}