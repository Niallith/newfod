package view
{
	import view.abstracts.BasicView;
	import view.interfaces.IView;
	import view.ships.BasicShip;
	import view.ships.Trident;
	
	import control.Controller;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.utils.getDefinitionByName;
	
	import flashx.textLayout.elements.OverflowPolicy;
	
	import model.MainModel;
	
	import playerio.Client;
	import playerio.PlayerIO;
	import playerio.PlayerIOError;


	public class LoginView extends BasicView implements IView
	{
		//Composant login
		private var loginComponent:MovieClip;

		public function LoginView() 
		{
			init();
		}
		public function init():void
		{
			
			trace("LoginView Created");
			setGraphics();
			setListeners();
		}
		
		private function goLogin(e:MouseEvent):void
		{
			//Update du username
			controller.setUsername(loginComponent.txt_username.text);
			
			//Connection au serveur playerIO
			PlayerIO.connect(
				mainModel.getStage(),				//Referance to stage
				"manowar-1wphsniuf0mnoyalg2b4a",	//Game id 
				"public",							//Connection id, default is public
				loginComponent.txt_username.text,	//Username
				"",									//User auth. Can be left blank if authentication is disabled on connection
				null,								//Current PartnerPay partner.
				handleConnect,						//Function executed on successful connect
				handleError							//Function executed if we recive an error
			); 
			loginComponent.gotoAndStop("connecting");
			
		}
		
		override protected function handleConnect(client:Client):void
		{
			//Set developmentserver (Comment out to connect to your server online)
			client.multiplayer.developmentServer = "localhost:8184";
			
			/**
			 * ON RENTRE DIRECTEMENT DANS LA GAME, A CHANGER BIEN EVIDEMMENT APRES
			 * */
			//Create avatar and set his position
			var test:String = "Trident";
			var TheClass:Class = getDefinitionByName(test) as Class;
			
			var avatar:BasicShip = new Trident();
			controller.setAvatar(avatar);
			
		
			//Create join the Lobby
			client.multiplayer.createJoinRoom(
			"Lobby",							//Room id. If set to null a random roomid is used
			"Lobby",							//The game type started on the server
			true,								//Should the room be visible in the lobby?
			{},									//Room data. This data is returned to lobby list. Variabels can be modifed on the server
			{x:mainModel.getAvatar().getPositionX(), y:mainModel.getAvatar().getPositionY(), username:mainModel.getUsername()},									//User join data
			handleJoin,							//Function executed on successful joining of the room
			handleError							//Function executed if we got a join error
			);
			
			//Change la view state sur le lobby
			//controller.addLobbyView();
			controller.setNewState(MainModel.STATE_LOBBY);
		}
		
		public function setGraphics():void
		{
			
			loginComponent = new View_Login () as MovieClip;
			loginComponent.gotoAndStop("connected");
			addChild(loginComponent);
		}
		
		public function setListeners():void
		{
			//Ecouteur sur bouton de connection
			loginComponent.bt_connect.addEventListener(MouseEvent.CLICK, goLogin);
			//Ecouteur removedFromStage
			this.addEventListener(Event.REMOVED_FROM_STAGE, onRemoveFromStage);
			
			
			
		}
		private function onRemoveFromStage(e:Event):void
		{
			trace("LoginView removed from stage");
			if(loginComponent.bt_connect.hasEventListener(MouseEvent.CLICK))
				loginComponent.bt_connect.removeEventListener(MouseEvent.CLICK, goLogin);
			
			if(this.hasEventListener(Event.REMOVED_FROM_STAGE))
				this.removeEventListener(Event.REMOVED_FROM_STAGE, onRemoveFromStage);
		}
		
	}
}