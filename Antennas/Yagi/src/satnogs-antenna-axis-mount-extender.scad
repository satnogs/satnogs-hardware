// Antenna to axis mount
// Satnogs Project 2014 MPL2.0 http://satnogs.org

$fn=50;

mast_1 = 32;		 // Axis mast diameter
mast_2 = 20;		 // Antenna mast diameter
offset = 8;			 // Extra width of mount
tireup_w = 6; 		 // Width of tireup
tireup_h = 1.5;	 // Height of tireup
washer = 16;		 // Washer diameter
bolt = 4;			 // Bolt for antenna mast


module axises() {
	translate([0,(mast_1+mast_2)/2-mast_1/2,0])
		rotate([0,90,0])
			cylinder(h=mast_2+offset+1, d=mast_1, center=true);
	translate([0,-(mast_1+mast_2)/2+mast_2/2,0])
		cylinder(h=mast_1+offset+1, d=mast_2, center=true);
	// Bolt for antenna mast cylinder
	translate([0,(mast_1+mast_2)/2-mast_1/2,0])
		cylinder(h=mast_1+offset+1, d=bolt, center=true);
}

module axises_outer() {
	translate([0,(mast_1+mast_2)/2-mast_1/2,0])
		rotate([0,90,0])
			cylinder(h=mast_2+offset, d=mast_1+offset, center=true);
	translate([0,-(mast_1+mast_2)/2+mast_2/2,0])
		cylinder(h=mast_1+offset, d=mast_2+offset, center=true);
	// Outer washer stud
	translate([0,(mast_1+mast_2)/2-mast_1/2,0])
		cylinder(h=mast_1+offset, d=washer, center=true);
}

module tire_up() {
	difference() {
		cylinder(h=tireup_w,d=mast_2+offset+tireup_h,center=true);
		cylinder(h=tireup_w,d=mast_2+offset-tireup_h,center=true);
	}
}

module cut() {
	translate([0,-(mast_1+mast_2)/2,0])
		cube([offset*5,offset*1.5,mast_1+offset*4],center=true);
}

module main_connector() {
	difference() {
		hull() {
			axises_outer();
		}
		axises();
		mirror([0,0,1]) {
			translate([0,-(mast_1+mast_2)/2+mast_2/2,(2*mast_1)/5])
				tire_up();
		}
		translate([0,-(mast_1+mast_2)/2+mast_2/2,(2*mast_1)/5])
			tire_up();
		cut();
	}
}

module extender() {
	difference() {
		translate([mast_1/2-offset/2,-mast_2*2,-mast_1/2-offset/4])
			cube([offset/2,mast_1*2,offset/2],center=true);
		translate([mast_1/2-offset/2,-mast_1*2-4,-mast_1/2-offset/4])
			cylinder(d=3,offset/2,center=true);
	}
}

difference() {
	union() {
		main_connector();
		extender();
	}
}

