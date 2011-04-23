package Views.abstracts
{
	import Views.LoginView;
	
	import control.Controller;
	
	import event.StateUpdateEvent;
	
	import flash.display.Sprite;
	import flash.utils.getDefinitionByName;
	
	import model.MainModel;

	/**
	 * MainView contient toutes les views
	 * 
	 **/
	
	
	public class MainView extends Sprite
	{
		private var mainModel:MainModel = MainModel.getInstance();
		private var controller:Controller = Controller.getInstance();
		private var loginView:LoginView;
		private var basicView:BasicView;
		public function MainView()
		{
			init();
		}
		public function init():void
		{
			mainModel.addEventListener(StateUpdateEvent.EVENT_STATE_UPDATE,onStateUpdate);
			trace("ECOUTEUR STATE UPDATE ON");
		}
		private function onStateUpdate(e:StateUpdateEvent):void
		{
			trace("EVENT : ON_STATE_UPDATE");
			//trace(symbolClass);
			if(e.currentState == MainModel.STATE_LOGIN)
				controller.addLoginView();
			
			if(e.currentState == MainModel.STATE_LOBBY)
				controller.addLobbyView();
					
			if(e.currentState == MainModel.STATE_MAIN_GAME)
				controller.addMainGameView();
		}
	}
}
