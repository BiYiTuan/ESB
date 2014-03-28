package eab.console.control{
	
	
	import eab.console.commands.AboutInfoCMD;
	import eab.console.commands.ActiveBpelEditorPageCMD;
	import eab.console.commands.ActiveFigureEditorPageCMD;
	import eab.console.commands.AttributeChangeCMD;
	import eab.console.commands.AttributeViewUpdateCMD;
	import eab.console.commands.BPELCreatCMD;
	import eab.console.commands.BPELEditorCloseCMD;
	import eab.console.commands.BPELFileOpenCMD;
	import eab.console.commands.CancleCloseBPELEditorCMD;
	import eab.console.commands.CancleCloseFigureEditorCMD;
	import eab.console.commands.CanvasChildrenChangedCMD;
	import eab.console.commands.ChangeFigureSizeCMD;
	import eab.console.commands.ChangeToBPELViewCMD;
	import eab.console.commands.CreateSubProcessCMD;
	import eab.console.commands.FigureCopyFromCanvasCMD;
	import eab.console.commands.FigureDeleteConfirmPopCMD;
	import eab.console.commands.FigureDeleteFromCanvasCMD;
	import eab.console.commands.FigureEditorCloseCMD;
	import eab.console.commands.FigurePasteToCanvasCMD;
	import eab.console.commands.FlowSaveLocalCMD;
	import eab.console.commands.FlowSaveDBCMD;
	import eab.console.commands.FlowDeployCMD;
	import eab.console.commands.MoveDownCMD;
	import eab.console.commands.MoveLeftCMD;
	import eab.console.commands.MoveRightCMD;
	import eab.console.commands.MoveUpCMD;
	import eab.console.commands.NodeCreateLinkCMD;
	import eab.console.commands.OpenSubProcessCMD;
	import eab.console.commands.SelectFigureOfToolPanelCMD;
	import eab.console.commands.SetConnectionEndPointCMD;
	import eab.console.commands.SetConnectionStartPointCMD;
	import eab.console.commands.ZoomInCMD;
	import eab.console.commands.ZoomOutCMD;
	import eab.console.commands.functionnavigator.InstanceListOpenCMD;
	import eab.console.commands.functionnavigator.ProtocolFilesViewOpenCMD;
	import eab.console.commands.functionnavigator.ServiceListOpenCMD;
	import eab.console.commands.functionnavigator.ProtocolListOpenCMD;
	import eab.console.commands.functionnavigator.FlowListOpenCMD;
	import eab.console.commands.functionnavigator.LogListOpenCMD;
	import eab.console.commands.instancelist.InstanceMonitorOpenCMD;
	import eab.console.commands.protocolfiles.ProtocolFileOpenCMD;
	import eab.console.commands.flowlist.FlowEditOpenCMD;
	import eab.console.events.AttributeViewAppEvent;
	import eab.console.events.DesignerMenuBarAppEvent;
	import eab.console.events.DesignerToolBarAppEvent;
	import eab.console.events.FigureCanvasAppEvent;
	import eab.console.events.FigureEditorAppEvent;
	import eab.console.events.FigureEditorNavigatorAppEvent;
	import eab.console.events.FunctionNavigatorViewAppEvent;
	import eab.console.events.InstanceListViewAppEvent;
	import eab.console.events.ProtocolFilesViewAppEvent;
	import eab.console.events.ToolPanelAppEvent;
	import eab.console.events.FlowListViewAppEvent;
	import eab.framework.control.FrontController;
	
	
	/**
     * A base class for an application specific front controller,
     * that is able to dispatch control following particular user gestures to appropriate
     * command classes.
	 */
	public class EABConsoleController extends FrontController{
		
		
		/**
		 * Registers all ICommand classes with the Front Controller, against an event name
		 * and listens for events with that name.
		 */

		public function EABConsoleController(){
					   
			//FigureEditorNavigatorAppEvent
			addCommand(FigureEditorNavigatorAppEvent.FIGURE_EDITOR_CLOSE, FigureEditorCloseCMD);
					   
			addCommand(FigureEditorNavigatorAppEvent.BPEL_EDITOR_CLOSE, BPELEditorCloseCMD);
					   
			addCommand(FigureEditorNavigatorAppEvent.ACTIVE_FIGUREEDITOR_PAGE, ActiveFigureEditorPageCMD);
					   
			addCommand(FigureEditorNavigatorAppEvent.ACTIVE_BPELEDITOR_PAGE, ActiveBpelEditorPageCMD);

			addCommand(FigureEditorNavigatorAppEvent.CANCLE_CLOSE_FIGURE_EDITOR, CancleCloseFigureEditorCMD);
			
			addCommand(FigureEditorNavigatorAppEvent.CANCLE_CLOSE_BPEL_EDITOR, CancleCloseBPELEditorCMD);
			
			//FigureEditorAppEvent
//			addCommand(FigureEditorAppEvent.CHANGE_To_XML_VIEW, ChangeToXMLViewCMD);
			addCommand(FigureEditorAppEvent.CHANGE_To_XML_VIEW, ChangeToBPELViewCMD);
			
			addCommand(FigureEditorAppEvent.BPEL_CREAT, BPELCreatCMD);
					   
			
			//AttributeView
			addCommand(AttributeViewAppEvent.ATTRIBUTEVIEW_UPDATE, AttributeViewUpdateCMD);
			
			addCommand(AttributeViewAppEvent.CHANGE_ATTRIBUTE, AttributeChangeCMD);
			
			//tool panel
			addCommand(ToolPanelAppEvent.SELECT_FIGURE, SelectFigureOfToolPanelCMD);
					   
			
			//figureCanvas
			addCommand(FigureCanvasAppEvent.POP_FIGURE_DELETE_CONFIRM, FigureDeleteConfirmPopCMD);
			
			addCommand(FigureCanvasAppEvent.FIGURE_DELETE_FROM_CANVAS, FigureDeleteFromCanvasCMD);
			
			addCommand(FigureCanvasAppEvent.FIGURES_COPY, FigureCopyFromCanvasCMD);
			
			addCommand(FigureCanvasAppEvent.FIGURES_PASTE, FigurePasteToCanvasCMD);
			
			addCommand(FigureCanvasAppEvent.CHANGE_FIGURE_SIZE_IN_CANVAS, ChangeFigureSizeCMD);
			
			addCommand(FigureCanvasAppEvent.CREATE_CONNECTION_START, SetConnectionStartPointCMD);
			
			addCommand(FigureCanvasAppEvent.CREATE_CONNECTION_END, SetConnectionEndPointCMD);
			
			addCommand(FigureCanvasAppEvent.Zoom_In, ZoomInCMD);
			
			addCommand(FigureCanvasAppEvent.Zoom_Out, ZoomOutCMD);
			
			addCommand(FigureCanvasAppEvent.About_Info, AboutInfoCMD);
			
			addCommand(FigureCanvasAppEvent.Node_Create_Link,NodeCreateLinkCMD);
			
			addCommand(FigureCanvasAppEvent.OPEN_SUBPROCESS,OpenSubProcessCMD);
			
			addCommand(FigureCanvasAppEvent.CREATE_NEW_SUBPROCESS,CreateSubProcessCMD);
			
			addCommand(FigureCanvasAppEvent.MOVE_LEFT,MoveLeftCMD);
			
			addCommand(FigureCanvasAppEvent.MOVE_UP,MoveUpCMD);
			
			addCommand(FigureCanvasAppEvent.MOVE_RIGHT,MoveRightCMD);
			
			addCommand(FigureCanvasAppEvent.MOVE_DOWN,MoveDownCMD);
			
			addCommand(FigureCanvasAppEvent.Canvas_Children_Changed,CanvasChildrenChangedCMD);
			
			
			//DesignerMenuBarAppEvent
			addCommand(DesignerMenuBarAppEvent.FLOW_SAVE_LOCAL, FlowSaveLocalCMD);			
			addCommand(DesignerMenuBarAppEvent.FLOW_SAVE_DB, FlowSaveDBCMD);			
			addCommand(DesignerMenuBarAppEvent.FLOW_DEPLOY, FlowDeployCMD);	
			addCommand(DesignerToolBarAppEvent.FLOW_SAVE_LOCAL, FlowSaveLocalCMD);			
			addCommand(DesignerToolBarAppEvent.FLOW_SAVE_DB, FlowSaveDBCMD);
			addCommand(DesignerToolBarAppEvent.FLOW_DEPLOY, FlowDeployCMD);	
			
			//FunctionNavigatorViewAppEvent
			addCommand(FunctionNavigatorViewAppEvent.OPEN_SERVICE_LIST, ServiceListOpenCMD);			
			addCommand(FunctionNavigatorViewAppEvent.OPEN_FLOW_LIST, FlowListOpenCMD);			
			addCommand(FunctionNavigatorViewAppEvent.OPEN_INSTANCE_LIST, InstanceListOpenCMD);
			addCommand(FunctionNavigatorViewAppEvent.OPEN_PROTOCOL_FILES, ProtocolFilesViewOpenCMD);
			addCommand(ProtocolFilesViewAppEvent.OPEN_PROTOCOL_FILE, ProtocolFileOpenCMD);
			addCommand(InstanceListViewAppEvent.OPEN_INSTANCE_MONITOR, InstanceMonitorOpenCMD);
			addCommand(FlowListViewAppEvent.OPEN_FLOW_EDIT, FlowEditOpenCMD);
			addCommand(FunctionNavigatorViewAppEvent.OPEN_PROTOCOL_LIST, ProtocolListOpenCMD);
			addCommand(FunctionNavigatorViewAppEvent.OPEN_LOG_LIST, LogListOpenCMD);
		}
	
	}
	
}






