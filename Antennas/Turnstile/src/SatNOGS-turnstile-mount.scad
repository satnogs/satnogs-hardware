// SatNOGS Turnstile antenna mount

$fn=50;

// Variables
i_b = 32.5; //Inner Bottom width
o_u = 18.5; //Outer Upper width
t_h = 10; //Transitional height

// Main model

module mount(){
	difference(){
		union(){
			translate([0,0,-10])
				cylinder(d=i_b+8, h=20, center=true);
			translate([0,0,t_h/2])
				cylinder(d1=i_b+8, d2=o_u, h=t_h, center=true);
			translate([0,0,t_h+(o_u*2)/2])
				cylinder(d=o_u, h=o_u*2, center=true);
		}
		translate([0,0,-11])
			cylinder(d=i_b, h=22, center=true);
	}
}

mount();