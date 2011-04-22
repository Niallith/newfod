package View
{
	import com.smartfoxserver.v2.SmartFox;
	import com.smartfoxserver.v2.core.SFSEvent;
	import com.smartfoxserver.v2.requests.LoginRequest;
	
	import control.Controller;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import model.MainModel;

	public class LoginView extends BasicView
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
			//GRAPHIQUE
			loginComponent = new View_Login () as MovieClip;
			addChild(loginComponent);
			
			//ECOUTEURS
				//Ecouteur sur bouton de connection
				loginComponent.bt_connect.addEventListener(MouseEvent.CLICK, goLogin);
				//Ecouteur removedFromStage
				this.addEventListener(Event.REMOVED_FROM_STAGE, onRemoveFromStage);
					
			//Connection sfs
			sfs.loadConfig();

		}
		public function goLogin(e:MouseEvent):void
		{
			controller.sfsLogin(loginComponent.txt_username.text,"","SimpleChat");
		}
		
		override protected function onConnection(e:SFSEvent):void
		{
			trace("SFS_EVENT_LOGIN_VIEW : ONCONNECTION");
			loginComponent.gotoAndStop("connected");
		}
		override protected function onLogin(e:SFSEvent):void
		{
			trace("SFS_EVENT_LOGIN_VIEW : ONLOGIN");
			controller.sfsJoinRoom(MainModel.ROOM_LOBBY);
		}
		

		
		private function onRemoveFromStage(e:Event):void
		{
			if(loginComponent.bt_connect.hasEventListener(MouseEvent.CLICK))
				loginComponent.bt_connect.removeEventListener(MouseEvent.CLICK, goLogin);
			
			if(this.hasEventListener(Event.REMOVED_FROM_STAGE))
				this.removeEventListener(Event.REMOVED_FROM_STAGE, onRemoveFromStage);
		}
	}
}