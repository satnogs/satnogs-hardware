//Yagi element to mast mounting bracket
//Satnogs Project MPL2.0 http://satnogs.org

$fn=50; //High Resolution

el_d = 4; 					   //Element diameter
mast_d = 20; 					//Mast diameter
cube_e = mast_d+el_d*2+2;  //Cube edge
mount_l = 14; 					//Mount length


module element()
{
	cylinder(h=mast_d*2,d=el_d);
}

module tire_up()
{
	difference() {
		cylinder(h=3.5,d=cube_e);
		cylinder(h=3.5,d=cube_e-1);
	}
}

module satnogs_yagi_mount()
{
	rotate([0,90,0])
		intersection() {
			difference() {
				translate([-cube_e/2,-cube_e/2,-cube_e/2])
					cube([cube_e,cube_e,cube_e]);
			   union() {
					rotate([0,270,0])
						translate([0,0,-mount_l/2])
							cylinder(h=mount_l*2,d=mast_d);
				   translate([el_d/2,mast_d/2+el_d/2,-mast_d])
						element();
					rotate([90,0,0])
						translate([-el_d/2,mast_d/2+el_d/2,-mast_d])
							element();
					translate([-mount_l*1.5,-1.5,-(mast_d+el_d*2+2)/2])
						cube([mount_l,3,mast_d+el_d*2+2]);
					rotate([0,270,0])
						translate([0,0,mount_l-5])
							tire_up();
				}
			}
		   rotate([0,270,0])
				translate([0,0,-mount_l/2])
					cylinder(h=mount_l*2,d=mast_d+el_d*2+2);
		}
}

satnogs_yagi_mount();

