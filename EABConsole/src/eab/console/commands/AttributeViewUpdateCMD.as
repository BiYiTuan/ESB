package eab.console.commands
{
	import eab.framework.commands.EABCommand;
	import eab.framework.control.EABFrameworkEvent;
	import eab.console.figure.AbstractFigure;
	import eab.console.model.EABConsoleModelLocator;
	
	/**
	 * Initialize the AttributeView by a seledted figure
	 */ 
	public class AttributeViewUpdateCMD extends EABCommand{
		
		
		public function AttributeViewUpdateCMD(){
			super();
		}
		
		
		/**
		 * 
		 * @param event {selectedFigure}
		 * 
		 */
		override public function execute(event :EABFrameworkEvent) :void{
			
			var orDesModelLoc :EABConsoleModelLocator = EABConsoleModelLocator.getInstance();
			
			var selectFig :AbstractFigure = event.data.selectedFigure as AbstractFigure;
			
			if(selectFig != null) {
				orDesModelLoc.getAttributeViewModel().editedFigure = selectFig;
				orDesModelLoc.getAttributeViewModel().attibutes = selectFig.getAttributeArray();
			}else {
				orDesModelLoc.getAttributeViewModel().editedFigure = null;
				orDesModelLoc.getAttributeViewModel().updateAttribute();
			}
		}

	}
}