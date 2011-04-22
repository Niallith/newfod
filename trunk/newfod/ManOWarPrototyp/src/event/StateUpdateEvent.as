package event
{
	import flash.events.Event;
	
	public class StateUpdateEvent extends Event
	{
		public static const EVENT_STATE_UPDATE:String = "STATE_UPDATE_EVENT";
		public var currentState:String;
		
		public function StateUpdateEvent(type:String, currentState:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this.currentState = currentState;
		}
		
		public override function clone ():Event 
		{ 
			return new StateUpdateEvent ( type, currentState, bubbles, cancelable ) ;
		}
		
		public override function toString():String
		{
			return "STATE_UPDATE_EVENT : "+currentState;
		}
	}
}