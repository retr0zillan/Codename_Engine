
import funkin.backend.system.Conductor;
import flixel.group.FlxGroup.FlxTypedGroup;
import funkin.game.PlayState;
import openfl.display.BitmapData;
import flixel.ui.FlxBar;
import flixel.ui.FlxBar.FlxBarFillDirection;
import flixel.FlxObject;
import flixel.util.FlxAxes;
import openfl.geom.ColorTransform;
import flixel.util.FlxColor;
import sys.FileSystem;
import funkin.game.PlayState;
public var coolBarCam:FlxCamera = new FlxCamera();
public var fullBitmap = BitmapData.fromFile(Paths.image('game/FilledRevamped'));
public var emptyBitmap = BitmapData.fromFile(Paths.image('game/EmptyRevamped'));
public var brush:FlxSprite;
public var camNotes:HudCamera;

function create() {
    importScript("data/scripts/loadzonenotes");
     FlxG.cameras.add(camNotes = new HudCamera(), false);
    camNotes.bgColor = '#00000000';
	camNotes.downscroll = downscroll;
}

function postCreate(){
        coolBarCam.bgColor = 0;
		FlxG.cameras.add(coolBarCam, false);


        scoreTxt.font = Paths.font('impact.ttf');
        missesTxt.font = Paths.font('impact.ttf');
        accuracyTxt.font = Paths.font('impact.ttf');
        
        remove(iconP2);
		remove(iconP1);
 
		remove(healthBar);
		remove(healthBarBG);

        var reference = new FlxObject(0, FlxG.height * 0.9, 601, 19);
		reference.screenCenter(0x01);

		scoreTxt.setPosition(reference.x + -170, reference.y - 550, Std.int(reference.width - 100));
        
		missesTxt.setPosition(reference.x - 500, reference.y - 570, Std.int(reference.width - 100));
		accuracyTxt.setPosition(reference.x  - 300, reference.y - 530, Std.int(reference.width - 100));
        scoreTxt.size = 30;
        missesTxt.size = accuracyTxt.size = 25;
        missesTxt.color = accuracyTxt.color = 0xFFadadad;

        brush = new FlxSprite(450,20).loadGraphic(Paths.image('game/BrushRevamped'));
		brush.antialiasing = true;
        brush.scale.set(0.5,0.5);

		brush.scrollFactor.set();

		add(brush);
        var rightColor:Int = boyfriend != null && boyfriend.iconColor != null && Options.colorHealthBar ? boyfriend.iconColor : (PlayState.opponentMode ? 0xFFFF0000 : 0xFF66FF33);
        healthBar = new FlxBar(brush.x - 100 ,brush.y + 540, FlxBarFillDirection.LEFT_TO_RIGHT,900, 500,this,'health', 0, maxHealth);
		healthBar.createImageBar(emptyBitmap, fullBitmap, FlxColor.RED, FlxColor.BLUE);
		healthBar.scrollFactor.set();
        healthBar.scale.set(0.5,0.5);

		add(healthBar);

        healthBarBG = new FlxSprite(healthBar.x - 190,healthBar.y - 190).loadGraphic(Paths.image('game/BgBarRevamped'));
		healthBarBG.antialiasing = true;
		healthBarBG.scrollFactor.set();
        healthBarBG.scale.set(0.5,0.5);

		add(healthBarBG);

        var scoreHolder = new FlxSprite(healthBar.x -260,healthBar.y - 750).loadGraphic(Paths.image('game/mancha combo'));
		scoreHolder.antialiasing = true;
		scoreHolder.scrollFactor.set();
        scoreHolder.scale.set(0.3,0.3);
		add(scoreHolder);

        for(e in [healthBar, healthBarBG, brush, scoreHolder]){
			e.cameras = [camHUD];
            
			
		}

         health = maxHealth;

}

  function onPlayerMiss(e) {

  }
  function onNoteCreation(event) {
	var note = event.note;
    var line  = note.strumLine;
        note.cameras = [camNotes];
        
        for (strum in line.members) {
            strum.cameras = [camNotes];
        }
	
		if (event.note.strumLine == cpuStrums){
			event.note.visible = false;
	
		}



}

function onStrumCreation(event) {
	
		
	if(event.player == 0||event.player==2){
			event.strum.visible=false;
		
			
		}
	
	




}
function beatHit(){
	if (Options.camZoomOnBeat && camZooming && FlxG.camera.zoom < maxCamZoom && curBeat % camZoomingInterval == 0)
		camNotes.zoom += 0.03 * camZoomingStrength;
}
function update(elapsed:Float){

	
	if (camZooming){
		camNotes.zoom = lerp(camNotes.zoom, 1, 0.05);
   
	}

	
  }