package View
{
	import control.Controller;
	
	import event.StateUpdateEvent;
	
	import flash.display.Sprite;
	
	import model.MainModel;

	public class MainView extends Sprite
	{
		private var mainModel:MainModel = MainModel.getInstance();
		private var controller:Controller = Controller.getInstance();
		
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
			if(e.currentState == MainModel.STATE_LOGIN)
				controller.addLoginView();
			
			if(e.currentState == MainModel.STATE_LOBBY)
				controller.addLobbyView();
		}
	}
}