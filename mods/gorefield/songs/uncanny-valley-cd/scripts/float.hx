var dad;
var yOff = 80;
var xOff = 650;
var floatAm = 50;
function create() {
  dad = strumLines.members[1].characters[0];
}
function update() {
  dad.y = yOff + (Math.sin(Conductor.songPosition / 1200 * 3.1415) * floatAm);
  dad.x = xOff + (Math.sin(Conductor.songPosition / 1200 * 1.1415 ) * floatAm);

}

