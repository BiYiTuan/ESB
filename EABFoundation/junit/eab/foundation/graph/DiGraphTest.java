package eab.foundation.graph;

import static org.junit.Assert.*;

import java.util.ArrayList;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class DiGraphTest {
	
	private DiGraph testGraph;

	@Before
	public void setUp() throws Exception {
		testGraph = new DiGraph("TestGraph");
		DiVertex[] vtxs = new DiVertex[10];
		
		for(int i = 0; i < 10; i++){
			vtxs[i] = testGraph.AddVertex(i);
		}
		
		testGraph.AddEdge(vtxs[3], vtxs[0]);
		testGraph.AddEdge(vtxs[5], vtxs[7]);
		testGraph.AddEdge(vtxs[9], vtxs[2]);
		testGraph.AddEdge(vtxs[1], vtxs[5]);
		testGraph.AddEdge(vtxs[0], vtxs[9]);
		testGraph.AddEdge(vtxs[2], vtxs[6]);
		testGraph.AddEdge(vtxs[2], vtxs[1]);
		testGraph.AddEdge(vtxs[4], vtxs[2]);
		testGraph.AddEdge(vtxs[7], vtxs[1]);
		testGraph.AddEdge(vtxs[3], vtxs[4]);
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void testSortVertexs() {
		ArrayList<DiVertex> vtxs = testGraph.sortVertexs();
		assertEquals("Sort Result Count Error!", 7, vtxs.size());
		String exceptString = "3480926";
		String resString = "";
		for(int i = 0; i < 7; i++){
			resString += String.valueOf(vtxs.get(i).getData());
		}
		assertEquals("Sort Result Detail Error!", exceptString, resString);
	}

	@Test
	public void testHasLoop() {
		assertTrue("Check Loop Error!", testGraph.hasLoop());
	}

	@Test
	public void testSortOrphan() {
		ArrayList<DiVertex> vtxs = testGraph.sortOrphan(false);
		assertEquals("Sort Orphan Count Error!", 1, vtxs.size());
		assertEquals("Sort Result Detail Error!", "8", String.valueOf(vtxs.get(0).getData()));
	}

}
