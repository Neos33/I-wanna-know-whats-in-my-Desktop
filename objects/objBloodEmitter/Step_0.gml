//part_emitter_stream(global.pKidBlood_System,bloodEmitter,global.pKidBlood_Type,20
part_particles_create(global.pKidBlood_System,x+irandom_range(-5,5),y+irandom_range(-5,5),global.pKidBlood_Type,20);
/*repeat (20) {
    instance_create_layer(x, y, "Player", objBlood);
}

