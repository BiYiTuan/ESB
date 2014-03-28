package eab.foundation.graph;

import java.util.ArrayList;

public class DiVertex {
	
	private ArrayList<DiEdge> outEdges = new ArrayList<DiEdge>();
	
	private ArrayList<DiEdge> inEdges = new ArrayList<DiEdge>();
	
	private Object data;
	
	public DiVertex() {
	}
	
	public DiVertex(Object obj) {
		data = obj;
	}
	
	public ArrayList<DiEdge> getInEdges() {
		return inEdges;
	}
	
	public ArrayList<DiEdge> getOutEdges() {
		return outEdges;
	}
	
	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}
	
	public Boolean isOrphan(){
		return this.inEdges.isEmpty() && this.outEdges.isEmpty();
	}
}
