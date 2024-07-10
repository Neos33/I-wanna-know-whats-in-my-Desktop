/// @description 
total = 16;

//var depthDif = abs(copyDepth("Tiles_Shadow") - copyDepth("Tiles"));


for (var i = 0; i < total; ++i) {
    var _entity = instance_create_layer(x,y,"Tiles",objS3_CherryPlatform_Segment);
	_entity . owner = id;
	
	_entity . radiusX = 256*2 + 32;
	_entity . radiusY = 64;
	_entity . angleX = 360 / total * i;
	_entity . angleY = 360 / total * i;
	_entity . angleDepth = 360 / total * i;;
	_entity . angleScale = 360 / total * i;;
	
	//_entity . depthPoint = depthDif;
}