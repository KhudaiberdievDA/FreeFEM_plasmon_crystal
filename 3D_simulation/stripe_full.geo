/* Element size is fully specified by a mesh size field. */
//Mesh.MeshSizeFromPoints = 0;
//Mesh.MeshSizeFromCurvature = 0;
//Mesh.MeshSizeExtendFromBoundary = 0;

/* Parameters. */
period_x = 25.0;				// Real period of the stripes [um].
period_z = 25.0;				// Real period in z direction [um].
p_z = period_z / period_x; // 
stripe = (period_x - 7.5) / period_x;	// Fraction of metal.
d = 54.0 / period_x;			// Dielectric thickness.
m2 = -2;				// Second measurement plane.
m1 = 2 * m2;				// First measurement plane.
m3 = Round(d) + 2;			// Third measurement plane.
source = m1 - 0.5;			// Radiation source plane.
inlen = source - 0.5;			// Length of incident side.
outlen = m3 + 0.5;			// Length of outgoing side.
h_min = 1e-3;				// Minimal element size and distance.
h_max = 0.2;				// Maximal element size.
l_max = 0.5;				// Distance to maximal size.

/* Mesh scaling factor to avoid triangles with area < 1e-8. */
Mesh.ScalingFactor = 1e3;

/* Points. */
Point(1) = {-0.5, inlen,  -p_z/2, 1};
Point(2) = {-0.5, source, -p_z/2, 1};
Point(3) = {-0.5, m1,     -p_z/2, 1};
Point(4) = {-0.5, m2,     -p_z/2, 1};
Point(5) = {-0.5, 0,      -p_z/2, 1};
Point(6) = {-0.5, d,      -p_z/2, 1};
Point(7) = {-0.5, m3,     -p_z/2, 1};
Point(8) = {-0.5, outlen, -p_z/2, 1};

Point(9) =  {0.5, outlen, -p_z/2, 1};
Point(10) = {0.5, m3,     -p_z/2, 1};
Point(11) = {0.5, d,      -p_z/2, 1};
Point(12) = {0.5, 0,      -p_z/2, 1};
Point(13) = {0.5, m2,     -p_z/2, 1};
Point(14) = {0.5, m1,     -p_z/2, 1};
Point(15) = {0.5, source, -p_z/2, 1};
Point(16) = {0.5, inlen,  -p_z/2, 1};

Point(17) = {- stripe/2,0,-p_z/2, 1};
Point(18) = {+ stripe/2,0,-p_z/2, 1};

/* 3D additional points. */
Point(101) = {-0.5, inlen,  p_z/2, 1};
Point(102) = {-0.5, source, p_z/2, 1};
Point(103) = {-0.5, m1,     p_z/2, 1};
Point(104) = {-0.5, m2,     p_z/2, 1};
Point(105) = {-0.5, 0,      p_z/2, 1};
Point(106) = {-0.5, d,      p_z/2, 1};
Point(107) = {-0.5, m3,     p_z/2, 1};
Point(108) = {-0.5, outlen, p_z/2, 1};

Point(109) = {0.5, outlen,  p_z/2, 1};
Point(110) = {0.5, m3,      p_z/2, 1};
Point(111) = {0.5, d,       p_z/2, 1};
Point(112) = {0.5, 0,       p_z/2, 1};
Point(113) = {0.5, m2,      p_z/2, 1};
Point(114) = {0.5, m1,      p_z/2, 1};
Point(115) = {0.5, source,  p_z/2, 1};
Point(116) = {0.5, inlen,   p_z/2, 1};

Point(117) = {-stripe/2, 0, p_z/2, 1};
Point(118) = {+stripe/2, 0, p_z/2, 1};

/* lines in the bottom. */
Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 5};
Line(5) = {5, 6};
Line(6) = {6, 7};
Line(7) = {7, 8};

Line(8) = {8, 9};

Line(9) = {9, 10};
Line(10) = {10, 11};
Line(11) = {11, 12};
Line(12) = {12, 13};
Line(13) = {13, 14};
Line(14) = {14, 15};
Line(15) = {15, 16};

Line(16) = {16, 1};

Line(17) = {2, 15};
Line(18) = {3, 14};
Line(19) = {4, 13};
Line(20) = {5, 17};
Line(21) = {17, 18};
Line(22) = {18,12};
Line(23) = {6, 11};
Line(24) = {7, 10};

/* lines in the top. */
Line(101) = {101, 102};
Line(102) = {102, 103};
Line(103) = {103, 104};
Line(104) = {104, 105};
Line(105) = {105, 106};
Line(106) = {106, 107};
Line(107) = {107, 108};

Line(108) = {108, 109};

Line(109) = {109, 110};
Line(110) = {110, 111};
Line(111) = {111, 112};
Line(112) = {112, 113};
Line(113) = {113, 114};
Line(114) = {114, 115};
Line(115) = {115, 116};

Line(116) = {116, 101};

Line(117) = {102, 115};
Line(118) = {103, 114};
Line(119) = {104, 113};
Line(120) = {105, 117};
Line(121) = {117, 118};
Line(122) = {118, 112};
Line(123) = {106, 111};
Line(124) = {107, 110};

/* vertical lines. */
Line(1001) = {  1,101};
Line(1002) = {  2,102};
Line(1003) = {  3,103};
Line(1004) = {  4,104};
Line(1005) = {  5,105};
Line(1006) = {  6,106};
Line(1007) = {  7,107};
Line(1008) = {  8,108};
Line(1009) = {  9,109};
Line(1010) = { 10,110};
Line(1011) = { 11,111};
Line(1012) = { 12,112};
Line(1013) = { 13,113};
Line(1014) = { 14,114};
Line(1015) = { 15,115};
Line(1016) = { 16,116};
Line(1017) = { 17,117};
Line(1018) = { 18,118};


/* Surfaces and volumes, sourse side */
Curve Loop(1) = {-16, -15, -14, -13, -12, -22, -21, -20, -4, -3, -2, -1};
Plane Surface(1) = {1};

Curve Loop(101) = {116, 115, 114, 113, 112, 122, 121, 120, 104, 103, 102, 101};
Plane Surface(101) = {101};

Curve Loop(1016) = {16,1001,-116,-1016};
Plane Surface(1016) = {1016};

Curve Loop(1001) = {1,2,3,4,1005,-104,-103,-102,-101,-1001};
Plane Surface(1001) = {1001};

Curve Loop(1020) = {20,1017,-120,-1005}; /* Surface without 2DES */
Plane Surface(1020) = {1020};
Curve Loop(1021) = {21,1018,-121,-1017}; /* Surface with 2DES */
Plane Surface(1021) = {1021};
Curve Loop(1022) = {22,1012,-122,-1018}; /* Surface without 2DES */
Plane Surface(1022) = {1022};

Curve Loop(1012) = {12,13,14,15,1016,-115,-114,-113,-112,-1012};
Plane Surface(1012) = {1012};


Surface Loop(1) = {1,101,1016,1001,1020,1021,1022,1012}; 
Volume(1) = {1};


/* Surfaces and volumes, detector*/

Curve Loop(2) = {23, -10, -9, -8, -7, -6};
Plane Surface(2) = {2};

Curve Loop(102) = {-123, 110, 109, 108, 107, 106};
Plane Surface(102) = {102};

Curve Loop(1023) = {-23, 1006, 123, -1011};
Plane Surface(1023) = {1023};

Curve Loop(1006) = {6,7,1008,-107,-106,-1006};
Plane Surface(1006) = {1006};

Curve Loop(1008) = {8,1009,-108,-1008};
Plane Surface(1008) = {1008};

Curve Loop(1009) = {9,10,1011,-110,-109,-1009};
Plane Surface(1009) = {1009};

Surface Loop(2) = {2,102,1023,1006,1008,1009};
Volume(2) = {2};


/* Surfaces and volumes, sample*/

Curve Loop(3) = {20, 21, 22, -11, -23, -5};
Plane Surface(3) = {3};

Curve Loop(103) = {-120, -121, -122, 111, 123, 105};
Plane Surface(103) = {103};

Curve Loop(1005) = {5,1006,-105,-1005};
Plane Surface(1005) = {1005};

Curve Loop(1011) = {11,1012,-111,-1011};
Plane Surface(1011) = {1011};

Surface Loop(3) = {3,103,1005,1011,-1020,-1021,-1022,-1023};
Volume(3) = {3};

/* additional surfaces*/
Curve Loop(1017) = {17,1015,-117,-1002};
Plane Surface(1017) = {1017};
Curve Loop(1018) = {18,1014,-118,-1003};
Plane Surface(1018) = {1018};
Curve Loop(1019) = {19,1013,-119,-1004};
Plane Surface(1019) = {1019};
Curve Loop(1024) = {24,1010,-124,-1007};
Plane Surface(1024) = {1024};


/* Embedded curves for excitation, stripe and integration. */
Curve {17} In Surface {1};
Curve {18} In Surface {1};
Curve {19} In Surface {1};
Curve {24} In Surface {2};

/* Mesh size field. */
Field[1] = Distance;
Field[1].NodesList = {17,117,18,118};
Field[1].EdgesList = {1017,1018};

Field[2] = Threshold;
Field[2].IField = 1;
Field[2].DistMin = h_min;
Field[2].DistMax = l_max;
Field[2].LcMin = h_min;
Field[2].LcMax = h_max;

Background Field = 2;

/* Physical entities. */
Physical Surface("s_in") = {1016};
Physical Surface("s_out") = {-1008};
Physical Surface("s_sourse") = {-1017};
Physical Surface("s_m1") = {-1018};
Physical Surface("s_m2") = {-1019};
Physical Surface("s_m3") = {-1024};
Physical Surface("s_boundary") = {1,2,3,101,102,103,1001,1012,1005,1011,1006,1009};
Physical Surface("s_stripe") = {1021};
Physical Surface("s_back") = {1023};

Physical Volume("v_dielectric") = {3};
Physical Volume("v_air") = {1,2};



