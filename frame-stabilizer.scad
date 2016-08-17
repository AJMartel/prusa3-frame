// Camera: 82,185,0,0,0,0,1066

module alu_frame_stabalizer_grove(size=[0,0])
{
  translate([size[0], 30]) {
    hull() {
      translate([-74.9,0]) circle(d=8.7, $fn=30);
      square([8.7,8.7], center=true);
    }
    translate([1.35,0]) rotate(a=45) square([15,15], center=true);
  }
}

module alu_frame_stabalizer_mount_cutout()
{
  square([30.5,4.4]);
  translate([21.35,-1.8]) square([5.12,8]);
  translate([0,2.2-(23.6/2)]) square([9.4,23.6]);
}

module alu_frame_square(size=[0,0], p=7)
{
  h = sqrt(pow(p,2)+pow(p,2));
  difference() {
    square([size[0], size[1]]);
    for (i=[0,1]) for (j=[0,1]) translate([(i*2)*((size[0])/2), (j*2)*((size[1]-h)/2)+(j*h)-(h/2)]) rotate(a=45) square([p,p]);
  }
}

module alu_frame_stabalizer()
{
  size = [187, 370];
  difference() {
    difference() {
      alu_frame_square(size);
      translate([225,-33]) rotate(a=25.3) square(size+[0,100]);
    }
    alu_frame_stabalizer_grove(size);

    // Bottom cutout
    translate([0,-10+3]) alu_frame_square([size[0]-26,10]);

    for (i=[22.8,182.8,337.8]) translate([0,i]) alu_frame_stabalizer_mount_cutout();
    square([9.4,20]);
    translate([0,45.5]) square([9.4,118.95]);
    translate([0,205.6]) square([9.4,114]);
    translate([0,360.6]) square([9.4,10]);
    hull() for (i=[-1,1]) translate([33.3+(i*4),10]) circle(d=8, center=true, $fn=20);
  }
}

alu_frame_stabalizer();
