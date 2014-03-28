package eab.console.business
{
	import eab.console.other.Localizator;
	import eab.framework.other.EABFrameworkError;
	import eab.framework.other.EABFrameworkMessageCodes;
	
	import flash.utils.Dictionary;
	
	import mx.rpc.remoting.RemoteObject;
	
	public class EABConsoleServiceLocator
	{
		private static var instance : EABConsoleServiceLocator;
		
		private var services : Dictionary = new Dictionary();
	
		public static function getInstance() : EABConsoleServiceLocator
		{
			if ( instance == null )
			{
				instance = new EABConsoleServiceLocator();
			}
			
			return instance;
		}
		
		public function EABConsoleServiceLocator() 
		{   
			if ( instance != null )
			{
				throw new EABFrameworkError( EABFrameworkMessageCodes.SINGLETON_EXCEPTION, "EABConsoleServiceLocator" );
			}
			
			InitServices();
            
			instance = this;
		}
		
		private function InitServices() : void
		{
			services["protocols"] = Localizator.getInstance().getText("service.protocols");
			services["services"] = Localizator.getInstance().getText("service.services");
			services["processes"] = Localizator.getInstance().getText("service.processes");
			services["instances"] = Localizator.getInstance().getText("service.instances");
			services["edit"] = Localizator.getInstance().getText("service.edit");
		}
		
		public function GetRemoteObject(name : String) : RemoteObject
		{
			var destination : String = services[name];	
			var ro : RemoteObject = null;		
			
			if(destination == null)
			{
				throw new EABFrameworkError(EABFrameworkMessageCodes.REMOTE_OBJECT_NOT_FOUND, name );
			}		
			
			ro = new RemoteObject();			
			ro.destination = destination;
			
			return ro;
		}
	}
}