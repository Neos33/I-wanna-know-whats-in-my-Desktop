/// @description Init

// Create the DS Grid background
elements_width = 16;
elements_height = 10;
elements = ds_grid_create(elements_width,elements_height);

// Music
//BGM = musMeme_Lilly_G;
BGM = audio_play_sound(musMeme_Lilly_G,1,false);
bgAlpha = 0;
// Other
indexTemp = 0;
viewStartX = 0;
viewStartY = 0;
viewStartW = 1024;
viewStartH = 576;
alarm[0] = 1;
target_object = noone;

// Timer 
t = 0;
realTime = 0;

function barrage_make_shapes_Modified(xx, yy, object, sides, spd, angle, distance, number_per_side, makeStar = false, star_pointiness = 2, makeFlower = false, parent_objectID = noone, tagID = -1)
{
	var two_pi = 2 * pi;
	sides = clamp(sides, 2, 999);
	angle = degtorad(angle);

	var checkDistance, pointX, pointY;

	if (makeStar) sides *= 2;

	for (var i = 0; i < sides; i++) {
	    checkDistance = 1;
    
	    if (makeStar && i % 2 == 1) checkDistance = clamp(star_pointiness, 0.1, 3);
        
	    pointX[i] = xx + checkDistance * cos(angle + two_pi / sides * i);
	    pointY[i] = yy - checkDistance * sin(angle + two_pi / sides * i);
	}

	for (var i = 0; i < sides; i++) {
	    var p = (i + 1) % sides;
	    var checkAngle = arctan2(pointY[i] - pointY[p], pointX[p] - pointX[i]);
	    checkDistance = point_distance(pointX[i], pointY[i], pointX[p], pointY[p]);
    
	    for (var j = 0; j < checkDistance; j += checkDistance / number_per_side) {
	        var nowX = pointX[i] + j * cos(checkAngle);
	        var nowY = pointY[i] - j * sin(checkAngle);
	        var centerAngle = arctan2(yy - nowY, nowX - xx);
	        var centerDistance = point_distance(xx, yy, nowX, nowY);
	        var shapeDistance = distance * centerDistance;
        
	        if (makeFlower) shapeDistance = distance / centerDistance;
        
	        var s = instance_create_layer(nowX + shapeDistance * cos(centerAngle), nowY - shapeDistance * sin(centerAngle), "Bullets" ,object);
	        with (s) motion_set(radtodeg(centerAngle), spd);
	        if (!makeFlower) {
	            s.speed *= centerDistance;
	        } else {
	            s.speed /= centerDistance;
	        }
			s.distance_target = distance;
        
			if parent_objectID != noone
				s.parent_object = parent_objectID;
				
			if tagID != -1
				s.tag = tagID;
        
	    }
	}
}


#region Grid Representation
/*
	1 2 3 4 5 6 7 8 9 A B C D E F G
  1 + + + + + + + + + + + + + + + +
  2 + + + + + + + + + + + + + + + +
  3 + + + + + + + + + + + + + + + +
  4 + + + + + + + + + + + + + + + +
  5 + + + + + + + + + + + + + + + +
  6 + + + + + + + + + + + + + + + +
  7 + + + + + + + + + + + + + + + +
  8 + + + + + + + + + + + + + + + +
  9 + + + + + + + + + + + + + + + +
  A + + + + + + + + + + + + + + + +
*/
#endregion