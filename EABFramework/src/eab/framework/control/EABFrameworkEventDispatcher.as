package eab.framework.control{
	
   import flash.events.IEventDispatcher;
   import flash.events.EventDispatcher;

   /**
    * The EABFrameworkEventDispatcher class is a singleton class, used by the application
    * developer to broadcast events that correspond to user gestures and requests.
    *
    * <p>The singleton implementation of the CairngormEventDispatcher ensures that one
    * and only one class can be responsible for broadcasting events that the
    * FrontController is subscribed to listen and react to.</p>
    *
    * <p>
    * Since the CairngormEventDispatcher implements singleton access, use of the
    * singleton is simple to distribute throughout your application.  At
    * any point in your application, should you capture a user gesture
    * (such as in a click handler, or a dragComplete handler, etc) then
    * simply use a code idiom as follows:
    * </p>
    *
    * <pre>
    * //LoginEvent inherits from eab.framework.control.CairngormEvent
    * var eventObject : LoginEvent = new LoginEvent();
    * eventObject.username = username.text;
    * eventObject.password = username.password;
    * 
    * CairngormEventDispatcher.getInstance().dispatchEvent( eventObject );
    * </pre>
    *
    * @see org.act.od.control.FrontController
    * @see org.act.od.control.CairngormEvent
    * @see flash.events.IEventDispatcher
    */
   
   public class EABFrameworkEventDispatcher{
   	
      private static var instance : EABFrameworkEventDispatcher = new EABFrameworkEventDispatcher();  
      private var eventDispatcher : IEventDispatcher;
      
      /**
       * Returns the single instance of the dispatcher
       */ 
      public static function getInstance() : EABFrameworkEventDispatcher{
           return instance;
      }
      
      /**
       * Constructor.
       */
      public function EABFrameworkEventDispatcher( target:IEventDispatcher = null ){
         eventDispatcher = new EventDispatcher( target );
      }
      
      /**
       * Adds an event listener.
       */
      public function addEventListener( type:String, listener:Function, useCapture:Boolean = false, 
      										priority:int = 0, useWeakReference:Boolean = false ) : void{
         eventDispatcher.addEventListener( type, listener, useCapture, priority, useWeakReference );
      }
      
      /**
       * Removes an event listener.
       */
      public function removeEventListener( type:String, listener:Function, useCapture:Boolean = false ) : void{
         eventDispatcher.removeEventListener( type, listener, useCapture );
      }

      /**
       * Dispatches a cairngorm event.
       */
      public function dispatchEvent( event:EABFrameworkEvent ) : Boolean{
         return eventDispatcher.dispatchEvent( event );
      }
      
      /**
       * Returns whether an event listener exists.
       */
      public function hasEventListener( type:String ) : Boolean{
         return eventDispatcher.hasEventListener( type );
      }
      
      /**
       * Returns whether an event will trigger.
       */
      public function willTrigger(type:String) : Boolean{
         return eventDispatcher.willTrigger( type );
      }
   }
}