
import flixel.addons.transition.FlxTransitionableState;
import funkin.backend.scripting.ModState;
import flixel.FlxG;
import flixel.FlxState;
import funkin.menus.BetaWarningState;

static var redirectStates:Map<FlxState, String> = [
    TitleState => "MainMenuState",

];

function new(){
	if(FlxG.save.data.shaders==null)FlxG.save.data.shaders==true;
	betaWarningShown = true;
}
function preStateSwitch() {
     for (redirectState in redirectStates.keys())
        if (FlxG.game._requestedState is redirectState)
            FlxG.game._requestedState = new ModState(redirectStates.get(redirectState));
            
}

function update(elapsed:Float){
    if (FlxG.keys.justPressed.F5) FlxG.resetState();
}
