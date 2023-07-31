// Gmsh file for the nucleation model
SetFactory("OpenCASCADE");
// Characteristic lengths
mesh_size	=	0.0075;

// rock boundary points
Point(1)      = {0.0,  -0.05, 0, mesh_size};
Point(2)      = {1.0, -0.05, 0, mesh_size};
Point(3)      = { 1.0, 0.05, 0, mesh_size};
Point(4)      = { 0.0,  0.05, 0, mesh_size};
// rock
Line(1)       = { 1,  2};
Line(2)       = { 2,  3};
Line(3)       = { 3,  4};
Line(4)       = { 4,  1};
Line Loop(1)  = { 1, 2, 3, 4};
Plane Surface(1)  = {1};

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
