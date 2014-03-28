package eab.console.commands
{
	import mx.managers.PopUpManager;
	
	import eab.framework.commands.EABCommand;
	import eab.framework.control.EABFrameworkEvent;
	import eab.console.model.EABConsoleModelLocator;
	import eab.console.view.AboutWindow;
	
	/**
	 * Show the "About Founder EAB" Window.
	 */ 
	public class AboutInfoCMD extends EABCommand
	{
		public function AboutInfoCMD(){
			super();
		}
		
		override public function execute(event:EABFrameworkEvent):void{
			var aboutWindow:AboutWindow = AboutWindow(PopUpManager.createPopUp(EABConsoleModelLocator.getInstance().getEABConsole(),AboutWindow,true));
			PopUpManager.centerPopUp(aboutWindow);
		}
	}
}