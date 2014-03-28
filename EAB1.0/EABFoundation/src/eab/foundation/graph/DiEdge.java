package eab.foundation.graph;

public class DiEdge {
	
	private DiVertex source;

	private DiVertex destination;
	
	private Object data;
	
	public DiEdge(DiVertex src, DiVertex dest, Object obj) {
		this.source = src;
		this.destination = dest;
		this.data = obj;
	}
	
	public DiEdge(DiVertex src, DiVertex dest) {
		this.source = src;
		this.destination = dest;
	}
	
	public DiVertex getSource() {
		return source;
	}

	public void setSource(DiVertex source) {
		this.source = source;
	}

	public DiVertex getDestination() {
		return destination;
	}

	public void setDestination(DiVertex destination) {
		this.destination = destination;
	}
	
	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}
}
