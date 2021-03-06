package eab.framework.control{
	
   import flash.events.Event;

   /**
    * The EABFrameworkEvent class is used to differentiate Cairngorm events 
    * from events raised by the underlying Flex framework (or
    * similar). It is mandatory for Cairngorm event dispatching. 
    * 
    * <p>For more information on how event dispatching works in Cairngorm, 
    * please check with CairngormEventDispatcher.</p>
    * <p>
    * Events are typically broadcast as the result of a user gesture occuring
    * in the application, such as a button click, a menu selection, a double
    * click, a drag and drop operation, etc.  
    * </p>
    *
    * @see eab.framework.control.EABFrameworkEventDispatcher
    */
   public class EABFrameworkEvent extends Event{

      /**
       * The data property can be used to hold information to be passed with the event
       * in cases where the developer does not want to extend the CairngormEvent class.
       * However, it is recommended that specific classes are created for each type
       * of event to be dispatched.
       */
      public var data : *;
      
      /**
       * Constructor, takes the event name (type) and data object (defaults to null)
       * and also defaults the standard Flex event properties bubbles and cancelable
       * to true and false respectively.
       */
      public function EABFrameworkEvent( type : String, dataParamter:Object = null ,bubbles : Boolean = false, cancelable : Boolean = false ){
         
         super( type, bubbles, cancelable );
         
         this.data = dataParamter;
      }
      
      /**
       * Dispatch this event via the Cairngorm event dispatcher.
       */
      public function dispatch() : Boolean{
         return EABFrameworkEventDispatcher.getInstance().dispatchEvent( this );
      }
   }
}