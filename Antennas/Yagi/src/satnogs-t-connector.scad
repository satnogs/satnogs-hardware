// T-connector for RG-59
// 

core = 3.6; // Core diameter
bolt = 3.2; // Bold diameter

module solid(){
	translate ([0,4*core,-core])
		cube ([4*core,6*core,2*core],center=true);
}

module hollow(){
	translate ([0,4*core,0])
		rotate ([90,0,0])
			cylinder (h=core*7, r=core,center=true);
}

module case(){
	difference() {
		union() {
			for ( i = [0:2] ) {
				rotate ( i*360/3, [0,0,1])
					solid();
			}
			translate ([0,0,-core])
				cylinder (h=core*2, r=core+9.5, center=true);
		}
		union() {
			for ( i = [0:2] ) {
				rotate ( i*360/3, [0,0,1])
					hollow();
			}
			cylinder (h=core*2, r=9.5, center=true);
		}
		cylinder(h=core*5, r=bolt, center=true);
	}
}

case();