#!/bin/bash
# 2015-04-17 / dosman / Generate SatNOGS axis sides based on height parameter provided
########################################################################################################

DATE=`date +%Y%m%d.%H%M`
OUT=./axis_side.${DATE}.svg

usage() {
	echo "Generates a custom height SVG file for axis sides for a SatNOGS ground station tracker"
	echo "This can then be laser cut or routed on a CNC router"
	echo ""
	echo "Usage:"
	echo "$0 <height to add in mm>" 
	echo "Starting height is 102mm, you specify how many mm to add to that value from 0 to infiniti."
	echo "The height of the original 3D printable STL files is 110mm."
	echo ""
	echo "Outputs a file named axis_side-<date.time>.svg which is sized to the calculated height"
	echo ""
	echo "Important note: the axis hole in generated file is imperial 1.25 inches in diameter, if you"
	echo "need a metric axis hole you must resize the hole manually after generating SVG."

	#echo "[i|m] - specifies an Imperial or Metric axis hole diameter"
	#echo ""
}

if [[ $1 == "-?" || $1 == "--?" || $1 == "-h" || $1 == "--h" || $1 == "-help" || $1 == "--help" ]];then
	usage
	exit
elif [[ -z $1 ]];then
	echo "-- Not enough parameters"
	usage
	exit
else
	HEIGHT=$1
	#AXISHOLE=$3
fi

###################################################################
# Do the math, generate object
# Negative numbers require underscore for dc

# Center layers:
# Center layer, leg, right side, left side
CLLEGR=`echo "_12.0 $HEIGHT - p" | dc`
CLLEGL=`echo "38 $HEIGHT + p" | dc`

# Center layer, main body, upper left nut box height
CLMAINNB=`echo "7.1 $HEIGHT - p" | dc`
# Center layer, right lower nut box
CLRLNB=`echo "_8.6 $HEIGHT - p" | dc`

# Center layer, main body
CLMAINR=`echo "_21.3 $HEIGHT - p" | dc`
CLMAINL=`echo "46.3 $HEIGHT + p" | dc`

# Right and Left layer variables:
# Outer right leg, inner right leg, outer left leg, inner left leg
ORL=`echo "38.1 $HEIGHT + p" | dc`
IRL=`echo "_3.4 $HEIGHT - p" | dc`
OLL=0	# for 3 layer design this stays zero for right and left layers
ILL=`echo "21.4 $HEIGHT + p" | dc`

# Left and right layer nut box locations that have to move
LLURNB=`echo "13.8 $HEIGHT - p" | dc`
LLULNB=`echo "13.8 $HEIGHT - p" | dc`
RLURNB=`echo "13.8 $HEIGHT - p" | dc`
RLULNB=`echo "13.8 $HEIGHT - p" | dc`

#echo "CLLEGR $CLLEGR / CLLEGL $CLLEGL / CLMAINNB $CLMAINNB / CLMAINR $CLMAINR / CLMAINL $CLMAINL "
#echo "ORL = $ORL / IRL = $IRL / OLL = $OLL / ILL = $ILL"
###########################################################################################################

echo "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>

<!-- Generated with $0 on `date` -->
<!-- License of script and this part is GPLv2 -->
<!-- Get the latest version of the script that generated this file and other SatNOGS stuffs here: -->
<!-- https://github.com/dosman33/SatNOGS -->

<svg
   xmlns:dc=\"http://purl.org/dc/elements/1.1/\"
   xmlns:cc=\"http://creativecommons.org/ns#\"
   xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"
   xmlns:svg=\"http://www.w3.org/2000/svg\"
   xmlns=\"http://www.w3.org/2000/svg\"
   version=\"1.1\"
   width=\"1177.2949\"
   height=\"366.84677\"
   viewBox=\"0 0 332.25879 103.53231\"
   id=\"svg2\">
  <metadata
     id=\"metadata11\">
    <rdf:RDF>
      <cc:Work
         rdf:about=\"\">
        <dc:format>image/svg+xml</dc:format>
        <dc:type
           rdf:resource=\"http://purl.org/dc/dcmitype/StillImage\" />
        <dc:title></dc:title>
      </cc:Work>
    </rdf:RDF>
  </metadata>
  <defs
     id=\"defs9\" />
  <g
     id=\"g3485\">

    <!-- center layer, axis hole -->
    <path
       d=\"m 603.04446,254.35674 a 51.797813,50.534451 0 1 1 -103.59563,0 51.797813,50.534451 0 1 1 103.59563,0 z\"
       transform=\"matrix(0.31275264,0,0,0.32057146,-21.188126,-18.220588)\"
       id=\"path13433\"
       style=\"fill:none;stroke:#000000;stroke-width:0.80217808;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none\" />

    <!-- center layer, main body, upper left nut box -->
    <!-- y=\"7.1346183\" // subtract from this value to raise this nut box -->
    <rect
       width=\"7.3107829\"
       height=\"3.5116425\"
       x=\"117.87422\"
       y=\"${CLMAINNB}\"
       id=\"rect3114\"
       style=\"fill:none;stroke:#0000ff;stroke-width:0.23910023;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none\" />

    <!-- center layer, main body, lower right nut box  -->
    <rect
       width=\"7.3107829\"
       height=\"3.5116425\"
       x=\"177.61902\"
       y=\"92.885971\"
       id=\"rect3114-7\"
       style=\"fill:none;stroke:#0000ff;stroke-width:0.23910025;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none\" />

    <!-- center layer, main body, lower left nut box -->
    <rect
       width=\"7.3107829\"
       height=\"3.5116425\"
       x=\"117.59687\"
       y=\"92.885971\"
       id=\"rect3114-4\"
       style=\"fill:none;stroke:#0000ff;stroke-width:0.23910025;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none\" />

    <g
       id=\"g4194\">
      <g
         id=\"g4214\">
        <path
           d=\"m 111.22316,48.674889 0.0759,29.229992 19.90778,0.03794 -0.0379,1.783152 -19.94572,0.07588\"
           id=\"path4224\"
           style=\"fill:none;stroke:#191919;stroke-width:0.25400001;stroke-miterlimit:4;stroke-dasharray:none\" />

	<!-- center layer, main body -->
        <path
           d=\"m 111.22316,79.877733 0.0759,23.508617 8.03275,0 0.15175,-19.942316 3.68013,-0.03794 -0.0759,19.999216 56.35842,-0.003 -0.0943,-19.882144 3.98363,-0.03794 0.0759,19.904424 7.88761,0 0,-35.355343 1.93589,-1.754161 -34.73477,-34.752765 c -0.59572,0.612208 -1.22075,1.237237 -1.84578,1.862265 l -11.7588,-11.758801 c 0,-9.413733 0.0409,-11.907993 0.0409,${CLMAINR} l -21.33571,0.02689 0.0464,21.022079 -4.24893,0.09583 0.0494,-21.097958 -8.14866,-0.01995 -0.0759,${CLMAINL} 20.0216,0.02093 -0.0759,1.745213 -19.86983,-0.0546\"

           id=\"path4222\"
           style=\"fill:none;stroke:#191919;stroke-width:0.25400001;stroke-miterlimit:4;stroke-dasharray:none\" />

        <g
           transform=\"translate(-33.805616,15.745081)\"
           id=\"g4226\">

          <!-- center layer, right top leg -->
          <path
             d=\"m 190.93722,${CLLEGR} 0.0579,-3.355154 22.84446,0 0.0489,20.873811 4.13931,-10e-7 c 0.0831,-5.63549402 -0.0851,-14.716143 -0.0598,-20.853863 l 7.61396,-0.01995 0,${CLLEGL} -1.66389,1.663497 -34.7823,-34.576828 z\"

             id=\"Face098\"
             style=\"fill:none;stroke:#191919;stroke-width:0.25400001;stroke-miterlimit:4;stroke-dasharray:none\" />

          <!-- center layer, right leg nut box -->
          <!--   y=\"-8.5790358\" -->
          <rect
             width=\"7.3107829\"
             height=\"3.5116425\"
             x=\"212.26187\"
             y=\"${CLRLNB}\"
             id=\"rect3114-1\"
             style=\"fill:none;stroke:#0000ff;stroke-width:0.23910025;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none\" />

          <!-- center layer, right leg, left/upper alignment hole -->
          <path
             d=\"m 680.98858,16.159847 a 4.5627375,4.5627375 0 1 1 -9.12548,0 4.5627375,4.5627375 0 1 1 9.12548,0 z\"
             transform=\"matrix(0.29923769,0,0,0.29923769,2.3878545,-10.137768)\"
             id=\"path3359\"
             style=\"fill:none;stroke:#000000;stroke-width:0.89999998;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none\" />

          <!-- center layer, right leg, right/lower alignment hole -->
          <path
             d=\"m 680.98858,16.159847 a 4.5627375,4.5627375 0 1 1 -9.12548,0 4.5627375,4.5627375 0 1 1 9.12548,0 z\"
             transform=\"matrix(0.29923768,0,0,0.29923768,18.865301,5.897969)\"
             id=\"path3359-1\"
             style=\"fill:none;stroke:#000000;stroke-width:0.89999998;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none\" />

        </g>
      </g>
    </g>
    <!-- center layer,  main body top alignment hole -->
    <path
       d=\"m 680.98858,16.159847 a 4.5627375,4.5627375 0 1 1 -9.12548,0 4.5627375,4.5627375 0 1 1 9.12548,0 z\"
       transform=\"matrix(0.29923768,0,0,0.29923768,-67.797493,10.870254)\"
       id=\"path3359-5\"
       style=\"fill:none;stroke:#000000;stroke-width:0.89999998;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none\" />

    <!-- center layer, lower left alignment hole -->
    <path
       d=\"m 680.98858,16.159847 a 4.5627375,4.5627375 0 1 1 -9.12548,0 4.5627375,4.5627375 0 1 1 9.12548,0 z\"
       transform=\"matrix(0.29923768,0,0,0.29923768,-75.556791,95.129328)\"
       id=\"path3359-51\"
       style=\"fill:none;stroke:#000000;stroke-width:0.89999998;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none\" />

    <!-- center layer, lower right alignment hole -->
    <path
       d=\"m 680.98858,16.159847 a 4.5627375,4.5627375 0 1 1 -9.12548,0 4.5627375,4.5627375 0 1 1 9.12548,0 z\"
       transform=\"matrix(0.29923768,0,0,0.29923768,-15.026243,94.366878)\"
       id=\"path3359-7\"
       style=\"fill:none;stroke:#000000;stroke-width:0.89999998;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none\" />

  </g>
  <g
     transform=\"matrix(-1,0,0,1,109.95249,-6.7946818)\"
     id=\"g3819\">
    <g
       transform=\"translate(-0.790332,-0.78506854)\"
       id=\"g4743\">
      <g
         transform=\"matrix(1,0,0,-1,40.917332,70.912068)\"
         id=\"g10726-1\"
         style=\"fill:none;stroke-width:0.25400001;stroke-miterlimit:4;stroke-dasharray:none\">

        <!-- left layer main body -->
        <path
           d=\"m -40,-40 80,0 0,35.3553391 C 50.056598,5.4119368 60.695626,16.050963 69.698486,25.053823 l 0,${ORL} -34.644661,0 0,${IRL} C 25.15433,49.798991 15.254834,39.899495 5.3553391,30 L -6.4034605,41.758801 c 0,9.413733 0,12.032784 0,${ILL} l -33.6784035,${OLL} z\"

           id=\"Face098-6\"
           style=\"fill:none;stroke:#191919;stroke-width:0.25400001;stroke-miterlimit:4;stroke-dasharray:none\" />
      </g>

      <!-- left layer axis hole -->
      <path
         d=\"m 603.04446,254.35674 a 51.797813,50.534451 0 1 1 -103.59563,0 51.797813,50.534451 0 1 1 103.59563,0 z\"
         transform=\"matrix(0.31275264,0,0,0.32057146,-131.56984,-10.694866)\"
         id=\"path13433-7\"
         style=\"fill:none;stroke:#000000;stroke-width:0.80217808;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none\" />

    </g>
    <!-- left layer upper right nut box -->
    <!-- y=\"13.793628\" -->
    <rect
       width=\"7.3107829\"
       height=\"3.5116425\"
       x=\"6.6840186\"
       y=\"${LLURNB}\"
       id=\"rect3114-8\"
       style=\"fill:none;stroke:#0000ff;stroke-width:0.23910023;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none\" />

    <!-- left layer upper left nut box -->
    <!-- y=\"13.797791\" -->
    <rect
       width=\"7.3107829\"
       height=\"3.5116425\"
       x=\"96.487305\"
       y=\"${LLULNB}\"
       id=\"rect3114-1-4\"
       style=\"fill:none;stroke:#0000ff;stroke-width:0.23910025;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none\" />

    <rect
       width=\"7.3107829\"
       height=\"3.5116425\"
       x=\"66.428818\"
       y=\"99.544983\"
       id=\"rect3114-7-9\"
       style=\"fill:none;stroke:#0000ff;stroke-width:0.23910025;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none\" />
    <rect
       width=\"7.3107829\"
       height=\"3.5116425\"
       x=\"6.4066672\"
       y=\"99.544983\"
       id=\"rect3114-4-6\"
       style=\"fill:none;stroke:#0000ff;stroke-width:0.23910025;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none\" />
    <path
       d=\"m 680.98858,16.159847 a 4.5627375,4.5627375 0 1 1 -9.12548,0 4.5627375,4.5627375 0 1 1 9.12548,0 z\"
       transform=\"matrix(0.29923769,0,0,0.29923769,-113.38671,12.239059)\"
       id=\"path3359-3\"
       style=\"fill:none;stroke:#000000;stroke-width:0.89999998;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none\" />
    <path
       d=\"m 680.98858,16.159847 a 4.5627375,4.5627375 0 1 1 -9.12548,0 4.5627375,4.5627375 0 1 1 9.12548,0 z\"
       transform=\"matrix(0.29923768,0,0,0.29923768,-96.909266,28.274796)\"
       id=\"path3359-1-7\"
       style=\"fill:none;stroke:#000000;stroke-width:0.89999998;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none\" />
    <path
       d=\"m 680.98858,16.159847 a 4.5627375,4.5627375 0 1 1 -9.12548,0 4.5627375,4.5627375 0 1 1 9.12548,0 z\"
       transform=\"matrix(0.29923768,0,0,0.29923768,-178.9877,17.529264)\"
       id=\"path3359-5-8\"
       style=\"fill:none;stroke:#000000;stroke-width:0.89999998;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none\" />
    <path
       d=\"m 680.98858,16.159847 a 4.5627375,4.5627375 0 1 1 -9.12548,0 4.5627375,4.5627375 0 1 1 9.12548,0 z\"
       transform=\"matrix(0.29923768,0,0,0.29923768,-186.74699,101.78834)\"
       id=\"path3359-51-8\"
       style=\"fill:none;stroke:#000000;stroke-width:0.89999998;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none\" />
    <path
       d=\"m 680.98858,16.159847 a 4.5627375,4.5627375 0 1 1 -9.12548,0 4.5627375,4.5627375 0 1 1 9.12548,0 z\"
       transform=\"matrix(0.29923768,0,0,0.29923768,-126.21645,101.02589)\"
       id=\"path3359-7-2\"
       style=\"fill:none;stroke:#000000;stroke-width:0.89999998;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none\" />
  </g>
  <g
     id=\"g3469\">
    <g
       transform=\"translate(194.52086,-6.7276195)\"
       id=\"g3819-9\">
      <g
         transform=\"translate(-0.790332,-0.78506854)\"
         id=\"g4743-1\">
        <g
           transform=\"matrix(1,0,0,-1,40.917332,70.912068)\"
           id=\"g10726-1-3\"
           style=\"fill:none;stroke-width:0.25400001;stroke-miterlimit:4;stroke-dasharray:none\">

          <!-- right layer, main body -->
          <path
             d=\"m -40,-40 80,0 0,35.3553391 C 50.056598,5.4119368 60.695626,16.050963 69.698486,25.053823 l 0,${ORL} -34.644661,0 0,${IRL} C 25.15433,49.798991 15.254834,39.899495 5.3553391,30 L -6.4034605,41.758801 c 0,9.413733 0,12.032784 0,${ILL} l -33.6784035,${OLL} z\"
             id=\"Face098-6-5\"
             style=\"fill:none;stroke:#191919;stroke-width:0.25400001;stroke-miterlimit:4;stroke-dasharray:none\" />

        </g>

        <!-- right layer axis hole -->
        <path
           d=\"m 603.04446,254.35674 a 51.797813,50.534451 0 1 1 -103.59563,0 51.797813,50.534451 0 1 1 103.59563,0 z\"
           transform=\"matrix(0.31275264,0,0,0.32057146,-131.56984,-10.694866)\"
           id=\"path13433-7-9\"
           style=\"fill:none;stroke:#000000;stroke-width:0.80217808;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none\" />

      </g>

      <!-- right layer upper left nut box -->
      <rect
         width=\"7.3107829\"
         height=\"3.5116425\"
         x=\"6.6840186\"
         y=\"${RLULNB}\"
         id=\"rect3114-8-8\"
         style=\"fill:none;stroke:#0000ff;stroke-width:0.23910023;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none\" />

      <!-- right layer upper right nut box -->
      <rect
         width=\"7.3107829\"
         height=\"3.5116425\"
         x=\"96.487305\"
         y=\"${RLURNB}\"
         id=\"rect3114-1-4-4\"
         style=\"fill:none;stroke:#0000ff;stroke-width:0.23910025;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none\" />

      <rect
         width=\"7.3107829\"
         height=\"3.5116425\"
         x=\"66.428818\"
         y=\"99.544983\"
         id=\"rect3114-7-9-0\"
         style=\"fill:none;stroke:#0000ff;stroke-width:0.23910025;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none\" />
      <rect
         width=\"7.3107829\"
         height=\"3.5116425\"
         x=\"6.4066672\"
         y=\"99.544983\"
         id=\"rect3114-4-6-7\"
         style=\"fill:none;stroke:#0000ff;stroke-width:0.23910025;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none\" />
      <path
         d=\"m 680.98858,16.159847 a 4.5627375,4.5627375 0 1 1 -9.12548,0 4.5627375,4.5627375 0 1 1 9.12548,0 z\"
         transform=\"matrix(0.29923769,0,0,0.29923769,-113.38671,12.239059)\"
         id=\"path3359-3-6\"
         style=\"fill:none;stroke:#000000;stroke-width:0.89999998;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none\" />
      <path
         d=\"m 680.98858,16.159847 a 4.5627375,4.5627375 0 1 1 -9.12548,0 4.5627375,4.5627375 0 1 1 9.12548,0 z\"
         transform=\"matrix(0.29923768,0,0,0.29923768,-96.909266,28.274796)\"
         id=\"path3359-1-7-3\"
         style=\"fill:none;stroke:#000000;stroke-width:0.89999998;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none\" />
      <path
         d=\"m 680.98858,16.159847 a 4.5627375,4.5627375 0 1 1 -9.12548,0 4.5627375,4.5627375 0 1 1 9.12548,0 z\"
         transform=\"matrix(0.29923768,0,0,0.29923768,-178.9877,17.529264)\"
         id=\"path3359-5-8-6\"
         style=\"fill:none;stroke:#000000;stroke-width:0.89999998;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none\" />
      <path
         d=\"m 680.98858,16.159847 a 4.5627375,4.5627375 0 1 1 -9.12548,0 4.5627375,4.5627375 0 1 1 9.12548,0 z\"
         transform=\"matrix(0.29923768,0,0,0.29923768,-186.74699,101.78834)\"
         id=\"path3359-51-8-1\"
         style=\"fill:none;stroke:#000000;stroke-width:0.89999998;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none\" />
      <path
         d=\"m 680.98858,16.159847 a 4.5627375,4.5627375 0 1 1 -9.12548,0 4.5627375,4.5627375 0 1 1 9.12548,0 z\"
         transform=\"matrix(0.29923768,0,0,0.29923768,-126.21645,101.02589)\"
         id=\"path3359-7-2-5\"
         style=\"fill:none;stroke:#000000;stroke-width:0.89999998;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none\" />
    </g>
  </g>
</svg>" >> $OUT

###########################################################################################################


echo "- Please let me know if you found this script useful: dosman at bloominglabs dot org"
echo "- Axis side with height of 102mm + $HEIGHT has been generated as output file $OUT"
