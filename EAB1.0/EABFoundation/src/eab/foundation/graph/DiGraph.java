package eab.foundation.graph;

import java.util.ArrayList;

public class DiGraph {

	private ArrayList<DiVertex> vertexs = new ArrayList<DiVertex>();

	private ArrayList<DiEdge> edges = new ArrayList<DiEdge>();

	private Object data;
	
	public DiGraph(){		
	}
	
	public DiGraph(Object obj){
		this.data = obj;
	}

	public DiVertex AddVertex(Object obj) {
		DiVertex vtx = new DiVertex(obj);
		vertexs.add(vtx);
		return vtx;
	}

	public DiEdge AddEdge(DiVertex src, DiVertex dest, Object obj) {
		DiEdge edge = new DiEdge(src, dest, obj);
		src.getOutEdges().add(edge);
		dest.getInEdges().add(edge);
		edges.add(edge);
		return edge;
	}
	
	public DiEdge AddEdge(DiVertex src, DiVertex dest) {
		DiEdge edge = new DiEdge(src, dest);
		src.getOutEdges().add(edge);
		dest.getInEdges().add(edge);
		edges.add(edge);
		return edge;
	}

	public void DeleteVertex(DiVertex vtx) {
		for (DiEdge edge : vtx.getInEdges()) {
			DeleteEdge(edge);
		}
		for (DiEdge edge : vtx.getOutEdges()) {
			DeleteEdge(edge);
		}
		vertexs.remove(vtx);
	}

	public void DeleteEdge(DiEdge edge) {
		if (edge.getSource() != null) {
			edge.getSource().getOutEdges().remove(edge);
		}
		if (edge.getDestination() != null) {
			edge.getDestination().getInEdges().remove(edge);
		}
		edges.remove(edge);
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}

	public DiVertex[] getVertexs() {
		return (DiVertex[]) vertexs.toArray();
	}

	public ArrayList<DiVertex> sortVertexs() {
		ArrayList<DiVertex> myVtxs = new ArrayList<DiVertex>();

		for (Boolean hasFound = true; hasFound; ) {
			hasFound = false;
			// find a vertex having none in-edge, check all remains
			// if none vertex been found, may be we have finish our work, or
			// there is a LOOP in the graph
			for (DiVertex vtx : this.vertexs) {
				if (myVtxs.contains(vtx)) { // only check remains
					continue;
				}
				Boolean isFirst = true; // given it's the first
				for (DiEdge edge : vtx.getInEdges()) {
					if (!myVtxs.contains(edge.getSource())) {
						isFirst = false;
						break;
					}
				}
				if (isFirst) {
					hasFound = true;
					myVtxs.add(vtx);
				}
			}			
		}
		
		return  myVtxs;
	}
	
	public Boolean hasLoop(){
		ArrayList<DiVertex> myVtxs = sortVertexs();
		return myVtxs.size() != this.vertexs.size();
	}
	
	public ArrayList<DiVertex> sortOrphan(Boolean deleteOrphan){
		ArrayList<DiVertex> myVtxs = new ArrayList<DiVertex>();
		
		for(DiVertex vtx : this.vertexs){
			if(vtx.isOrphan()){				
				myVtxs.add(vtx);
				
				if(deleteOrphan){
					this.vertexs.remove(vtx);
				}
			}
		}
		
		return myVtxs;
	}
}
