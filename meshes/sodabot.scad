echo(version=version());

topPlateDepth = 0.315;
bottomPlateDepth = 0.357;
baseWidth = 0.413;
plateThickness = 0.00338;
supportThickness = 0.0254;
supportWallThickness = 0.0015;
sideSupportPlateWidth = 0.0376;
sideSupportPlateDepth = 0.0793;
middleSupportPlateWidth = 0.086;
middleSupportPlateDepth = 0.062;
bottomPlateElevation = 0.091;
topPlateElevation = 0.754;
wheelsAtDepth = 0.041;

color("grey")
    translate([wheelsAtDepth,-baseWidth/2,0])
    rotate([0, 0, 90])
    translate([0, 0, 0]) {
        translate([0,0,bottomPlateElevation]) cube(size=[baseWidth, bottomPlateDepth, plateThickness], center=false);
        translate([0,0,topPlateElevation]) cube(size=[baseWidth, topPlateDepth, plateThickness], center=false);
 
         
        // Supports
        for (j=[0,baseWidth-sideSupportPlateWidth]) {
            difference() {
                translate([j+sideSupportPlateWidth/2 - supportThickness/2,sideSupportPlateDepth/2 - supportThickness/2,bottomPlateElevation+plateThickness*2]) cube(size=[supportThickness, supportThickness, topPlateElevation-bottomPlateElevation-plateThickness*3], center=false);
                translate([j+sideSupportPlateWidth/2 - supportThickness/2 + supportWallThickness,sideSupportPlateDepth/2 - supportThickness/2 + supportWallThickness, bottomPlateElevation+plateThickness*2]) cube(size=[supportThickness-supportWallThickness*2, supportThickness-supportWallThickness*2, topPlateElevation-bottomPlateElevation-plateThickness*3], center=false);            }
            for (i=[bottomPlateElevation+plateThickness,topPlateElevation-plateThickness])
                translate([j,0,i]) cube(size=[sideSupportPlateWidth, sideSupportPlateDepth, plateThickness], center=false);
        }
        
        translate([baseWidth/2-supportThickness/2,bottomPlateDepth - middleSupportPlateDepth/2 -supportThickness/2, bottomPlateElevation+plateThickness*1]) 
        rotate([2.5, 0, 0])
        difference() {
            cube(size=[supportThickness, supportThickness, topPlateElevation-bottomPlateElevation-plateThickness], center=false);
            translate([supportWallThickness, supportWallThickness, 0]) cube(size=[supportThickness - supportWallThickness*2, supportThickness - supportWallThickness*2, topPlateElevation-bottomPlateElevation-plateThickness], center=false);            
        }

        translate([baseWidth/2 - middleSupportPlateWidth/2, bottomPlateDepth-middleSupportPlateDepth, bottomPlateElevation+plateThickness]) cube(size=[middleSupportPlateWidth, middleSupportPlateDepth, plateThickness], center=false);

        translate([baseWidth/2 - middleSupportPlateWidth/2, topPlateDepth-middleSupportPlateDepth, topPlateElevation-plateThickness]) cube(size=[middleSupportPlateWidth, middleSupportPlateDepth, plateThickness], center=false);
        
    }
/*
color("black")
    rotate([0,90,0])
        translate([0.025, -0.12, -0.25-0.008])
            cylinder(0.016,0.06,0.06,true,$fn=18);

color("black")
    rotate([0,90,0])
        translate([0.025, -0.12, 0.25+0.008])
            cylinder(0.016,0.06,0.06,true,$fn=18);
color("black")
        cylinder(0.79375,0.008,0.008,false,$fn=18);
color("black")
    translate([0, 0, 0.79375])
        cube([0.20,0.08,0.05],center=true);
*/
