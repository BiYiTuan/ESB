package eab.console.commands
{
	import mx.managers.PopUpManager;
	
	import eab.framework.commands.EABCommand;
	import eab.framework.control.EABFrameworkEvent;
	import eab.console.model.EABConsoleModelLocator;
	import eab.console.view.FiguresRemoveConfirm;

	public class FigureDeleteConfirmPopCMD extends EABCommand{		
		
		public function FigureDeleteConfirmPopCMD(){
			super();
		}

		override public function execute(event :EABFrameworkEvent) :void{
			
			var figuresRemoveConfirm :FiguresRemoveConfirm = 
						PopUpManager.createPopUp(EABConsoleModelLocator.getInstance().getEABConsole(),
												 FiguresRemoveConfirm, true) as FiguresRemoveConfirm;
			
			figuresRemoveConfirm.setFileID(event.data.fileID);
			
			PopUpManager.centerPopUp(figuresRemoveConfirm);
		}

	}
}