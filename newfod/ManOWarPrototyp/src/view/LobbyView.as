package view
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import view.interfaces.IView;
	import view.abstracts.BasicView;

	public class LobbyView extends BasicView implements IView
	{
		private var lobbyComponent:MovieClip;
		
		public function LobbyView()
		{
			trace("LobbyView Created");
			setGraphics();
			setListeners();
		}
		private function onJoinGame(e:MouseEvent):void
		{
			//Plus tard différent écouteurs sur les games, id game ect... so basic
			trace("Joining Game");
			controller.addMainGameView();
		}
		public function setGraphics():void
		{
			lobbyComponent = new View_Lobby () as MovieClip;
			addChild(lobbyComponent);
		}
		
		public function setListeners():void
		{
			lobbyComponent.bt_join.addEventListener(MouseEvent.CLICK, onJoinGame);
		}
		
	}
}