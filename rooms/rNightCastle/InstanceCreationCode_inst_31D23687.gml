total = 6;

//var depthDif = abs(copyDepth("Tiles_Shadow") - copyDepth("Tiles"));
create3D_Circle = function(_rad,_angles)
{
	var _entity = instance_create_layer(x,y,"Tiles",objS3_CherryPlatform_Segment254);
	_entity . owner = id;
	
	_entity . radiusX = _rad;
	_entity . radiusY = 0;
	_entity . angleX = _angles;
	_entity . angleY = _angles;
	_entity . angleDepth = _angles;
	_entity . angleScale = _angles;	
}


for (var i = 0; i < total; ++i) {
    var _DefineAngle = 360 / total * i;
	create3D_Circle(192-96,_DefineAngle);
	//create3D_Circle(192-64,_DefineAngle);
	create3D_Circle(192-32,_DefineAngle);
}