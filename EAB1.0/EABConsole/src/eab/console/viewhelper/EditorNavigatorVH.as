package eab.console.viewhelper{
		
	import eab.console.model.EABConsoleModelLocator;
	import eab.console.model.EditorNavigatorModel;
	import eab.console.view.EditorNavigator;
	import eab.console.view.EditorNavigatorChild;
	import eab.control.events.SuperTabEvent;
	import eab.framework.view.ViewHelper;
	
	import flash.events.Event;
	import flash.events.TimerEvent;

	public class EditorNavigatorVH extends ViewHelper {
		
		[Bindable] 
		[Embed(source="../assets/icon/container/title.gif")]
        public var title :Class;
        
        [Bindable]
        [Embed(source="../assets/icon/accordion/item.gif")]
        public var itemTitle :Class;

        public static const VH_KEY :String = "FigureEditorNavigatorVH";
		
       	private var editorNavigatorModel :EditorNavigatorModel;
		
		public function EditorNavigatorVH(document :Object, id :String){
			super();
			this.initialized(document, id);
			
			this.editorNavigatorModel = EABConsoleModelLocator.getInstance().getEditorNavigatorModel();
		}

		public function get editorNavigator() :EditorNavigator{
			return this.view as EditorNavigator;
		}

		public function getCurrentChildType() :String{
			var curChild : EditorNavigatorChild = this.editorNavigator.selectedChild as EditorNavigatorChild;
			
			if(curChild != null)
				return curChild.type;
			else
				return null;
		}
		
		public function getCurrentChildID() : String{
			var curChild : EditorNavigatorChild = this.editorNavigator.selectedChild as EditorNavigatorChild;
			
			if(curChild != null)
				return curChild.instanceID;
			else
				return null;
		}
		
		public function getSelectedChildOfNavigator() :EditorNavigatorChild{
			return this.editorNavigator.selectedChild as EditorNavigatorChild;
		}

		public function onTabIndexChangeHandle(event :Event) :void {
			if(editorNavigator.selectedChild != null){
				EditorNavigatorChild(editorNavigator.selectedChild).refresh();
			}
		}

		public function onTabCloseHandle(event :SuperTabEvent):void {
		}
		
		public function onRefreshTimerHandle(event : TimerEvent):void {
			if(editorNavigator.selectedChild != null){
				EditorNavigatorChild(editorNavigator.selectedChild).refresh();
			}
		}
		
		public function addChildren(child:EditorNavigatorChild):void{
			if(child == null)
				return;
			
			var curChildren:int = findChildren(child.type, child.instanceID);
			if(curChildren != -1){
				editorNavigator.selectedIndex = curChildren;
				return;
			}
			
			child.icon = title;
			editorNavigator.addChild(child);
			editorNavigator.selectedChild = child;
		}
		
		public function activateChildren(type:String, instanceID:String = null):void{
			var curChildren:int = findChildren(type, instanceID);
			if(curChildren != -1)
				editorNavigator.selectedIndex = curChildren;
		}
		
		public function findChildren(type:String, instanceID:String = null):int{
			for(var index:int = 0; index < editorNavigator.numChildren; index++) {				
				var curChildren :EditorNavigatorChild = EditorNavigatorChild(editorNavigator.getChildAt(index));				
				if(curChildren.type == type && curChildren.instanceID == instanceID){
					return index;
				}
			}
			
			return -1;			
		}
	}
}