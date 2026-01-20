/* Element size is fully specified by a mesh size field. */
//Mesh.MeshSizeFromPoints = 0;
//Mesh.MeshSizeFromCurvature = 0;
//Mesh.MeshSizeExtendFromBoundary = 0;

/* Parameters. */
period_x = 25.0;				// Real period of the stripes [um].
period_y = 25.0;				// Real period of the stripes [um].
stripe = (period_x - 7.5) / period_x;	// Fraction of metal.
d = 54.0 / period;			// Dielectric thickness.
m2 = -2;				// Second measurement plane.
m1 = 2 * m2;				// First measurement plane.
m3 = Round(d) + 2;			// Third measurement plane.
source = m1 - 0.5;			// Radiation source plane.
inlen = source - 0.5;			// Length of incident side.
outlen = m3 + 0.5;			// Length of outgoing side.
h_min = 1e-3;				// Minimal element size and distance.
h_max = 0.1;				// Maximal element size.
l_max = 0.5;				// Distance to maximal size.

/* Mesh scaling factor to avoid triangles with area < 1e-8. */
Mesh.ScalingFactor = 1e3;

/* Points. */
Point(1) = {0, inlen, 0, 1};
Point(2) = {0, source, 0, 1};
Point(3) = {0, m1, 0, 1};
Point(4) = {0, m2, 0, 1};
Point(5) = {0, 0, 0, 1};
Point(6) = {0, d, 0, 1};
Point(7) = {0, m3, 0, 1};
Point(8) = {0, outlen, 0, 1};

Point(9) = {0.5, outlen, 0, 1};
Point(10) = {0.5, m3, 0, 1};
Point(11) = {0.5, d, 0, 1};
Point(12) = {0.5, 0, 0, 1};
Point(13) = {0.5, m2, 0, 1};
Point(14) = {0.5, m1, 0, 1};
Point(15) = {0.5, source, 0, 1};
Point(16) = {0.5, inlen, 0, 1};

Point(17) = {0.5 - 0.5 * stripe, 0, 0, 1};

/* 3D additional points. */
Point(101) = {0, inlen, 0.5, 1};
Point(102) = {0, source, 0.5, 1};
Point(103) = {0, m1, 0.5, 1};
Point(104) = {0, m2, 0.5, 1};
Point(105) = {0, 0, 0.5, 1};
Point(106) = {0, d, 0.5, 1};
Point(107) = {0, m3, 0.5, 1};
Point(108) = {0, outlen, 0.5, 1};

Point(109) = {0.5, outlen, 0.5, 1};
Point(110) = {0.5, m3, 0.5, 1};
Point(111) = {0.5, d, 0.5, 1};
Point(112) = {0.5, 0, 0.5, 1};
Point(113) = {0.5, m2, 0.5, 1};
Point(114) = {0.5, m1, 0.5, 1};
Point(115) = {0.5, source, 0.5, 1};
Point(116) = {0.5, inlen, 0.5, 1};

Point(117) = {0.5 - 0.5 * stripe, 0, 0.5, 1};

/* Lines. */
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
Line(21) = {17, 12};
Line(22) = {6, 11};
Line(23) = {7, 10};

/* new lines. */
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
Line(121) = {117, 112};
Line(122) = {106, 111};
Line(123) = {107, 110};

/* Surfaces. */
Curve Loop(1) = {-16, -15, -14, -13, -12, -21, -20, -4, -3, -2, -1};
Plane Surface(1) = {1};

Curve Loop(2) = {22, -10, -9, -8, -7, -6};
Plane Surface(2) = {2};

Curve Loop(3) = {20, 21, -11, -22, -5};
Plane Surface(3) = {3};

/* Embedded curves for excitation, stripe and integration. */
Curve {17} In Surface {1};
Curve {18} In Surface {1};
Curve {19} In Surface {1};
Curve {23} In Surface {2};

/* Mesh size field. */
Field[1] = Distance;
Field[1].NodesList = {17};

Field[2] = Threshold;
Field[2].IField = 1;
Field[2].DistMin = h_min;
Field[2].DistMax = l_max;
Field[2].LcMin = h_min;
Field[2].LcMax = h_max;

Background Field = 2;

/* Physical entities. */
Physical Curve("l_in") = {16};
Physical Curve("l_out") = {8};
Physical Curve("l_source") = {17};
Physical Curve("l_m1") = {18};
Physical Curve("l_m2") = {19};
Physical Curve("l_m3") = {23};
Physical Curve("l_boundary") = {1, 2, 3, 4, 5, 6, 7,
    9, 10, 11, 12, 13, 14, 15};
Physical Curve("l_stripe") = {21};
Physical Curve("l_back") = {22};
Physical Surface("s_dielectric") = {3};
Physical Surface("s_air") = {1, 2};
