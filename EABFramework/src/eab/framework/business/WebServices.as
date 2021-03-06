package eab.framework.business{
	
   import eab.framework.other.EABFrameworkError;
   import eab.framework.other.EABFrameworkMessageCodes;
   
   import flash.utils.Dictionary;
   
   import mx.rpc.soap.WebService;
   
   /**
    * Used to manage all WebService's defined on the IServiceLocator instance.
    */
   internal class WebServices extends AbstractServices
   {
      private var services : Dictionary = new Dictionary();
      
      /**
       * Register the services.
       * @param serviceLocator the IServiceLocator instance.
       */
      public override function register( serviceLocator : IServiceLocator ) : void
      {
         var accessors : XMLList = getAccessors( serviceLocator );
         
         for ( var i : uint = 0; i < accessors.length(); i++ )
         {
            var name : String = accessors[ i ];
            var obj : Object = serviceLocator[ name ];
            
            if ( obj is WebService )
            {
               var webService : WebService = WebService( obj );
               webService.loadWSDL();
               
               services[ name ] = obj;
            }
         }
      }
      
      /**
       * Return the service with the given name.
       * @param name the name of the service.
       * @return the service.
       */
      public override function getService( name : String ) : Object
      {
         var service : WebService = services[ name ];
         
         if ( service == null )
         {
            throw new EABFrameworkError(
               EABFrameworkMessageCodes.WEB_SERVICE_NOT_FOUND, name );
         }
         
         return service;
      }
      
      /**
       * Set the credentials for all registered services.
       * @param username the username to set.
       * @param password the password to set.
       */
      public override function setCredentials( username : String, password : String ) : void
      {
         for ( var name : String in services )
         {
            var service : WebService = services[ name ];
            
            service.logout();
            service.setCredentials( username, password );
         }
      }
      
      /**
       * Set the remote credentials for all registered services.
       * @param username the username to set.
       * @param password the password to set.
       */
      public override function setRemoteCredentials( username : String, password : String ) : void
      {
         for ( var name : String in services )
         {
            var service : WebService = services[ name ];
            
            service.setRemoteCredentials( username, password );
         }
      }
      
      /**
       * Log the user out of all registered services.
       */
      public override function logout() : void
      {
         for ( var name : String in services )
         {
            var service : WebService = services[ name ];
            
            service.logout();
         }
      }
   }
}