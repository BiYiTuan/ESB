package eab.console.figure
{
	import eab.console.other.Resource;
	
	import flash.utils.Dictionary;
	
	import mx.core.ClassFactory;
	
	public class FigureFactory
	{
        [Bindable]
        public static var start :Class = Resource.getInstance().icon_tool_start;
        
        [Bindable]
        public static var end :Class = Resource.getInstance().icon_tool_end;
        
        [Bindable]
        public static var Switch :Class = Resource.getInstance().icon_tool_switch;
        
        [Bindable]
        public static var link :Class = Resource.getInstance().icon_tool_link;
        
        [Bindable]
        public static var activity :Class = Resource.getInstance().icon_tool_activity;
        
        [Bindable]
        public static var subProcess :Class = Resource.getInstance().icon_tool_subprocess;
        
        [Bindable]
        public static var email :Class = Resource.getInstance().icon_tool_email;
        
        [Bindable]
        public static var fax :Class = Resource.getInstance().icon_tool_fax;
        
        [Bindable]
        public static var pager :Class = Resource.getInstance().icon_tool_pager;
        
        [Bindable]
        public static var sms :Class = Resource.getInstance().icon_tool_sms;
        
        [Bindable]
        public static var voice :Class = Resource.getInstance().icon_tool_voice;
        
        [Bindable]
        public static var invoke :Class = Resource.getInstance().icon_tool_invoke;
		
		[Bindable]
        public static var receive :Class = Resource.getInstance().icon_tool_receive;
        
        [Bindable]
        public static var reply :Class = Resource.getInstance().icon_tool_reply;
        
        [Bindable]
        public static var wait :Class = Resource.getInstance().icon_tool_wait;
		
		[Bindable]
        public static var assign :Class = Resource.getInstance().icon_tool_assign;

        private static var dic :Dictionary = new Dictionary();

		private static function initDic() :void {				
			dic[100] = {name: "Start", icon:start, figure:Startow2Figure, type:0};
			dic[101] = {name: "End", icon:end, figure:Endow2Figure, type:0};
			dic[102] = {name: "Switch", icon:Switch, figure:Switchow2Figure, type:0};
			dic[LINK_FIGURE_ID] = {name: "Link", icon:link, figure:LinkFigure, type:0};
			dic[ACTIVITY_FIGURE_ID] = {name: "Activity", icon:activity, figure:Activityow2Figure, type:1};
		}
		
		public static var ACTIVITY_FIGURE_ID:int = 103;
		public static var LINK_FIGURE_ID:int = 3;
		
		public static function createFigure(figureId:int):IFigure{
			initDic();
			var item:Object = dic[figureId];
			if(item == null)
				return null;
			var ifi:Object = (new ClassFactory(item.figure)).newInstance();
			if(ifi != null && ifi is GraphicalFigure){				
				GraphicalFigure(ifi).figureName = item.name;
			}
			
			return ifi as IFigure;
		}		
		
		public static function nametoid(classname:String):int{
			initDic();
			
			for(var key:Object in dic){
				if(dic[key].type == 0){
					return key as int;
				}
			}
			
			return -1;
		}
		
		public static function id2name(id :int) :String {
			initDic();
			if(dic[id] == null)
				return null;
			return dic[id].name;
		}
		
		public static function id2icon(id :int):Class {
			initDic();
			if(dic[id] == null)
				return null;
			return dic[id].icon;
		}
		
		public static function listBasicFigure():Array{
			initDic();
			
			var basicArray:Array = new Array(); 
			
			for(var key:Object in dic){
				if(dic[key].type == 0){
					basicArray.push(key);
				}
			}
			
			return basicArray;
		}
	}
}