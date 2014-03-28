package eab.console.model{
	
	import eab.console.view.EABConsole;
	import eab.framework.model.IModelLocator;

	public class EABConsoleModelLocator implements IModelLocator{

		private static var odModelLocator : EABConsoleModelLocator;

		[Bindable]
		private var attributeViewModel :AttributeViewModel;
		
		[Bindable]
		public var functionNavigatorModel : FunctionNavigatorModel;

		[Bindable]
		public var editorNavigatorModel :EditorNavigatorModel;
		
		[Bindable]
		private var serviceListModel : ServiceListModel;
		
		[Bindable]
		private var instanceListModel : InstanceListModel;
		
		[Bindable]
		public var flowListModel : FlowListModel;
		
		[Bindable]
		public var protocolFilesModel : ProtocolFilesModel;
		
		[Bindable]
		public var protocolListModel : ProtocolListModel;
		
		[Bindable]
		public var logListModel : LogListModel;

		private var toolPanelModel : ToolPanelModel;

		private var fcStateDomain :FigureCanvasStateDomain;

		private var eabConsole :EABConsole;

		public static function getInstance() : EABConsoleModelLocator{
			if(odModelLocator == null)
				EABConsoleModelLocator.odModelLocator = new EABConsoleModelLocator(new SingleEnforcer());
			return EABConsoleModelLocator.odModelLocator;
	   	}
	   
	   	/**
	   	 * Initial all models.
	   	 */
   		public function EABConsoleModelLocator(enforcer:SingleEnforcer):void {
   			super();	
			
			this.attributeViewModel = new AttributeViewModel();
			this.functionNavigatorModel = new FunctionNavigatorModel();
			this.serviceListModel = new ServiceListModel();
			this.instanceListModel = new InstanceListModel();
			this.flowListModel = new FlowListModel();
			this.protocolFilesModel = new ProtocolFilesModel();
			this.protocolListModel = new ProtocolListModel();
			this.logListModel = new LogListModel();
			this.editorNavigatorModel = new EditorNavigatorModel();
			this.toolPanelModel = new ToolPanelModel();
			this.fcStateDomain = new FigureCanvasStateDomain();
   		}
   		
   		/**
   		 * Return the attributeViewModel.
   		 */
   		public function getAttributeViewModel() :AttributeViewModel{
   			return this.attributeViewModel;
   		}

		public function getFunctionNavigatorModel():FunctionNavigatorModel{
			return this.functionNavigatorModel;
		}

   		public function getEditorNavigatorModel() :EditorNavigatorModel{
   			return this.editorNavigatorModel;
   		}
   		/**
   		 * Return the toolPanelModel
   		 */
   		public function getToolPanelModel() : ToolPanelModel{
   			return this.toolPanelModel;
   		}
   		/**
   		 * Return the fcStateDomain.
   		 */
   		public function getFigureCanvasStateDomain() :FigureCanvasStateDomain{
   			return this.fcStateDomain;
   		}
   		/**
   		 * Return the eabConsole.
   		 */
   		public function getEABConsole() :EABConsole{
   			return this.eabConsole;
   		}
   		/**
   		 * Set the eabConsole.
   		 */
   		public function setEABConsole(od :EABConsole):void{
   			this.eabConsole = od;
   		}
   		
   		public function getServiceListModel() : ServiceListModel {
   			return this.serviceListModel;
   		}
   		
   		public function getInstanceListModel() : InstanceListModel {
   			return this.instanceListModel;
   		}   		
   		
   		public function getFlowListModel() : FlowListModel {
   			return this.flowListModel;
   		}
   		
   		public function getProtocolFilesModel() : ProtocolFilesModel{
   			return this.protocolFilesModel;
   		}
   		
   		public function getProtocolListModel() : ProtocolListModel{
   			return this.protocolListModel;
   		}
   		
   		public function getLogListModel() : LogListModel{
   			return this.logListModel;
   		}
	}
	
	
}