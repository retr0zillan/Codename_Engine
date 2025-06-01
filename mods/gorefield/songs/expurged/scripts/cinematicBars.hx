public var cinematicBarsData = {
	yPos:0.2, //change this if u want to make the bars bigger/smaller (0 none, 1 full)
	group:new FlxSpriteGroup()
};
cinematicBarsData.group.cameras = [camHUD];
for(i in 0...2)cinematicBarsData.group.add(new FunkinSprite(0,0).makeGraphic(1,1,0xFF000000));
insert(0,cinematicBarsData.group);

for(i=>bar in cinematicBarsData.group.members)
{	
	if(cinematicBarsData.yPos>0)
	{
		bar.setGraphicSize(FlxG.width,FlxG.height*cinematicBarsData.yPos/2);
		bar.updateHitbox();
		if(i==1)bar.y = FlxG.height-bar.height;
	}
	else bar.scale.y = 0;
}
