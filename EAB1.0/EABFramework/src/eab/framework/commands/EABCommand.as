package eab.framework.commands{
	
	import eab.framework.control.EABFrameworkEvent;	
	
	/**
	 * 
	 */
	public class EABCommand implements ICommand{
		
		public function EABCommand(){
			super();
		}
		
		/**
		 * nead to be overwrite 
		 * @param event
		 * 
		 */
		public function execute(event :EABFrameworkEvent) :void{
		}
    
      	public function Unexecute() :void{
      	}
      
      
     	/**
     	 * if return TRUE，then the method Unexecute is required 
     	 * 
     	 * @return 
     	 */
     	public function isReversible() :Boolean{
     		return false;
     	}

	}
}