# Vertex Color Manager
# Index, select, & change vertex colors in a Mesh.

extends MeshDataTool

# Mesh, Material -> null
# takes a mesh, and a surface index. 0 is the first material slot in a mesh.
func parseMesh(mesh, surface=0):
	# Surface required to parse mesh
	#create_from_surface(mesh, surface)
	
	### Results
	# Mesh Information
	print('Mesh contains ', self.get_vertex_count(), ' vertices.')
	print('Mesh contains ', self.get_face_count(), ' faces.')
	print('Mesh contains ', mesh.get_surface_count(), ' surfaces.')
	### End of Results

# Mesh, interger -> dictonary { Color : [ all vertexs wih same color ] }
# takes a mesh, and a surface index. 0 is the first material slot in a mesh.
func parseVertexColors(mesh, surface=0):
	var vertexColors = {}
	
	for vertex in range(self.get_vertex_count()):
		var color = self.get_vertex_color(vertex)
		var position = self.get_vertex(vertex)
		
		if vertexColors.has(color):
			# Color is in the dict. Just add the position to the array
			vertexColors[color].append(position)
		else:
			# add new Color as a key, add the position to an array
			vertexColors[color] = [position]
	
	### Results
	# make sure array is not empty
	print('Number of colors in Mesh Vertex Color Array: ', vertexColors.size())
	print(vertexColors.keys())
	### End of Results
	
	return vertexColors

# Dict {String:Color}, Dict {Color:Position} -> Dict {String:[vertex positions]}
# Confirms the vertex colors in the mesh match the colors in the colorArray
func matchVertexColors(colorArray, meshColors):
	var selection = {}
	var c = colorArray.values()
	for color in c:
		if color in meshColors:
			pass
		else:
			print('Unknown Color: ', color)
