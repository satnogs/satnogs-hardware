// SatNOGS Yagi v2 Axis mount

//$fn = 20;

include <cyl_head_bolt.scad>;

// Variables

axis = 32; //Axis diameter
mast = 20.5; //Yagi width
w = 7; 	  //Mount wall width

module mount_outer(){
	union(){
		translate([axis/2+1,0,0])
			cylinder(d=axis+2*w,h=mast+2*w,center=true);
		translate([-mast/2,0,0])
			cube([mast+2*w,axis+2*w,mast+2*w],center=true);
	}
}

module mount_inner(){
	union(){
		translate([axis/2+1,0,0])
			cylinder(d=axis,h=mast+2*w+1,center=true);
		translate([-mast/2,0,0])
			cube([mast,axis+2*w+1,mast],center=true);
	}
}

module nutsbolts(){
	translate([-mast+1,0,0])
		rotate([0,90,0])
			nutcatch_parallel("M6", l=6);
	translate([-mast,0,0])
		rotate([0,90,0])
			cylinder(r=3.25,h=15,center=true);
	translate([axis+4,0,0])
		rotate([0,90,0])
			nutcatch_parallel("M6", l=8);
	translate([axis,0,0])
		rotate([0,90,0])
			cylinder(r=3.25,h=15,center=true);
}

module nipple_rail(){
	translate([-mast,0,0])
		cube([4,axis+2*w+1,10],center=true);
	cube([4,axis+2*w+1,10],center=true);
}

difference() {
	hull() {
		mount_outer();
	}
	mount_inner();
	nutsbolts();
	nipple_rail();
}

