// Gmsh file for the nucleation model

// Characteristic lengths
mesh_size	=	3.1;
mesh_size2   =  5.0;
// rock center points
Point(1)      = {  0,   0, 0, mesh_size};
Point(2)      = { 50,   0, 0, mesh_size};
Point(3)      = {  0,  50, 0, mesh_size};
Point(4)      = {-50,   0, 0, mesh_size};
Point(5)      = {  0, -50, 0, mesh_size};

// upper platen points
Point(6)      = {-8,  50, 0, mesh_size2};
Point(7)      = { 8,  50, 0, mesh_size2};
Point(8)      = { 0,  58, 0, mesh_size2};

// lower platen points
Point(9)      = { -8,  -50, 0, mesh_size2};
Point(10)     = {  8,  -50, 0, mesh_size2};
Point(11)     = {  0,  -58, 0, mesh_size2};

// rock
Circle(1)      = {2, 1, 3};
Circle(2)      = {3, 1, 4};
Circle(3)      = {4, 1, 5};
Circle(4)      = {5, 1, 2};
Line Loop(1)   = {1, 2, 3, 4};
Plane Surface(1)  = {1};

// platens
Line(5)        = { 6, 7};
Line(6)        = { 7, 8};
Line(7)        = { 8, 6};
Line Loop(2)   = {5, 6, 7};
Plane Surface(2)  = {2};

Line(8)        = { 9, 10};
Line(9)        = { 10,11};
Line(10)       = {11, 9};
Line Loop(3)   = { 8, 9, 10};
Plane Surface(3)  = {-3};

// check surface normal !!!
// help --> current options and work space--> mesh.normls=50
// arrows should point outward

// Save Abaqus Node Sets (NSETs)
Mesh.SaveGroupsOfNodes = 1;
// Mesh smoothing
Mesh.Smoothing = 1;
// Use MeshAdapt meshing algorithm
Mesh.Algorithm = 1;
//Mesh.Remove4Triangles = 1;
Coherence;
