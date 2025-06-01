import funkin.game.PlayState;
var game = PlayState.instance;
var vines=game.stage.stageSprites.get("vines");

function create(){
	boyfriend.alpha=0;
	dad.alpha=0;
    vines.alpha=0;
}

function appears(event){
    trace(event);
    for(char in [dad, boyfriend])
    FlxTween.tween(char, {alpha:event=="in"?1:0}, 1.5);
    var storm=game.stage.stageSprites.get("storm");
    FlxTween.tween(storm, {alpha:0}, 0.1);
}
