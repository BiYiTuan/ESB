package eab.runner;

import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JTextArea;
import javax.swing.border.EmptyBorder;
import javax.swing.BoxLayout;
import javax.swing.JSplitPane;
import javax.swing.JButton;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;

public class EABRunner extends JFrame {
	
	private static final long serialVersionUID = 1L;
	
	private JPanel contentPane;
	private JPanel controlPanel;
	private JTextArea serviceMixOutput;
	private JTextArea tomcatOutput;
	private JButton button;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					EABRunner frame = new EABRunner();
					frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the frame.
	 */
	public EABRunner() {
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 1000, 800);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(new BoxLayout(contentPane, BoxLayout.X_AXIS));	
		
		controlPanel = new JPanel();
		serviceMixOutput = new JTextArea();
		tomcatOutput = new JTextArea();
		
		JSplitPane splitPane = new JSplitPane();
		splitPane.setResizeWeight(0.2);
		contentPane.add(splitPane);
		
		JSplitPane outputSplitPane = new JSplitPane(JSplitPane.VERTICAL_SPLIT, serviceMixOutput, tomcatOutput);
		outputSplitPane.setResizeWeight(0.5);
		
		splitPane.setLeftComponent(controlPanel);
		splitPane.setRightComponent(outputSplitPane);		
		
		button = new JButton("Æô¶¯");
		button.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent arg0) {
			}
		});
		controlPanel.add(button);		
	}
}
