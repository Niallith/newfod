package View
{
	import flash.display.MovieClip;

	public class LobbyView extends BasicView
	{
		private var lobbyComponent:MovieClip;
		
		public function LobbyView()
		{
			trace("LobbyView Created");
			//GRAPHIQUE
			lobbyComponent = new View_Lobby () as MovieClip;
			addChild(lobbyComponent);
		}
	}
}