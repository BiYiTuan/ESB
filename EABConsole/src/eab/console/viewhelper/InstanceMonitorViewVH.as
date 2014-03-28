package eab.console.viewhelper
{
	import eab.console.model.EABConsoleModelLocator;
	import eab.console.model.InstanceMonitorModel;
	import eab.console.view.InstanceMonitorView;
	import eab.framework.view.ViewHelper;

	public class InstanceMonitorViewVH extends ViewHelper
	{	
		public static function getViewHelperKey(data : Object) :String{
			return "InstanceMonitorViewVH:" + data.id;
		}
		
		private var instanceMonitorModel : InstanceMonitorModel;
      	
		public function InstanceMonitorViewVH(document : Object, id : String){
			super();
			
			initialized(document, id);
			this.instanceMonitorModel = this.instanceMonitorView.instanceMonitorModel;
		}

		public function get instanceMonitorView() : InstanceMonitorView{
			return this.view as InstanceMonitorView;
		}
	}
}
