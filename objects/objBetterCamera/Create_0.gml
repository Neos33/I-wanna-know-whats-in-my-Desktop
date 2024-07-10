/// @description Init
// You can write your code in this editor
leaveRoom = false;  //Sets whether the camera can follow the player outside of the room's boundaries
//screenLock = true; //Whether to snap to screen borders or whether to follow the player
smoothLerp = 0.15; //How fast the smooth camera follows the player. (0-1, 1 = instant camera)
shake = false;
shakeMagnitude = 10;

init = false;
targetX = 0;
targetY = 0;
targetW = 1024;
targetH = 576;

shiftX = 0;
shiftY = 0;

object_target = objPlayer;

enum CAMERA
{
	FOLLOW_OBJECT,
	SET_POSITION,
	NORMAL_TRANSITION,
	ZOOM_OUT,
	ZOOM_TO_OBJECT
}
mode = CAMERA.NORMAL_TRANSITION;

pointX = 0;
pointY = 0;
pointW = 1024;
pointH = 576;

ShiftX = 0;
ShiftY = 0;

LimitX = undefined;
LimitY = undefined;
LimitW = undefined;
LimitH = undefined;


function region_deactivate(fromX,fromY,toX,toY,xOffset,yOffset)
{

	var xCam = fromX - xOffset;
	var yCam = fromY - yOffset;

	var wCam = toX + xOffset * 2;
	var hCam = toY + yOffset * 2;

	//Apply deactivation region
	instances_activation_update(xCam, yCam, wCam, hCam); 
}