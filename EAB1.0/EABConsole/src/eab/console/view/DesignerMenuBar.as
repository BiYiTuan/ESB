package eab.console.view{
	
	import mx.collections.XMLListCollection;
	import mx.controls.MenuBar;
	import mx.events.MenuEvent;
	
	import eab.console.other.Localizator;
	import eab.console.viewhelper.DesignerMenuBarVH;

	public class DesignerMenuBar extends MenuBar{

        private var designerMenuBarVH :DesignerMenuBarVH;

		public function DesignerMenuBar(){
			//view component
			super();
			
			this.labelField = "@label";
			this.dataProvider = new XMLListCollection(menubarXML);
			this.percentWidth = 100;
			designerMenuBarVH = new DesignerMenuBarVH(this, DesignerMenuBarVH.VH_KEY);
			this.initEventListener();
			
		}
		private function initEventListener():void{
			
        	var localizator : Localizator = Localizator.getInstance();
//			for each(var item : XML in menubarXML){
//				var labelText : String = null;
//				switch(item.@id)
//				{
//					case 1:
//						labelText = localizator.getText('menubar.file');
//						item.@label = labelText;
//				}
//			}
			this.addEventListener(MenuEvent.ITEM_CLICK, designerMenuBarVH.menuClick);
		}
		//data
		private var menubarXML :XMLList = 
			<>
				<menuitem label="文件" icon="">
					<menuitem label="新建" icon="">
						<menuitem label="服务" icon="" id="1"/>
						<menuitem label="流程" icon="" id="2"/>
					</menuitem>
				</menuitem>
				
				<menuitem label="编辑" icon="">
					<menuitem label="剪切" icon="" id="11"/>
					<menuitem label="复制" icon="" id="12"/>
					<menuitem label="粘贴" icon="" id="13"/>
					<menuitem type="separator" icon="" />
					<menuitem label="全选" icon="" id="14"/>
				</menuitem>

				<menuitem label="流程" icon="">
					<menuitem label="保存到本地"  icon="" id="21"/>
					<menuitem label="保存到数据库"  icon="" id="22"/>
					<menuitem type="separator" icon="" />
					<menuitem label="发布"  icon="" id="23"/>
				</menuitem>

				<menuitem label="帮助" icon="">
					<menuitem label="关于..."  icon="" id="31"/>
				</menuitem>
			</>;
	}
}