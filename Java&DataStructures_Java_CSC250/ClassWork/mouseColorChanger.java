import java.awt.Color;
import java.awt.GridLayout;
import java.awt.Point;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;

import javax.swing.JButton;
import javax.swing.JFrame;

public class mouseColorChanger extends JFrame implements MouseListener {

    private static final long serialVersionUID = -7134685459910610342L;

    public JButton[] buttons = new JButton[9];

    public mouseColorChanger() {
        this.setLayout(new GridLayout(3, 3));
        for (int i = 0; i < 9; i++) {
            JButton b = new JButton();
            b.setRolloverEnabled(true);
            b.addMouseListener(this);
            this.add(b);
            buttons[i] = b;
        }

        this.setVisible(true);
        this.setSize(500, 500);
        this.setLocationRelativeTo(null);
    }

    public static void main(String[] args) {
        new mouseColorChanger();
    }

    public void highlightButtons(Point cursor) {
        for (int i = 0; i < buttons.length; i++) {
            JButton button = buttons[i];
            Point buttonLocation = button.getLocationOnScreen();
            double west = buttonLocation.getX();
            double east = buttonLocation.getX() + button.getWidth();
            double north = buttonLocation.getY();
            double south = buttonLocation.getY() + button.getHeight();
            boolean inRow = cursor.getX() > west && cursor.getX() < east;
            boolean inCol = cursor.getY() > north && cursor.getY() < south;
            boolean inBounds = inRow || inCol;
            button.setBackground(inBounds ? new Color(0xFFFF00) : null);
        }
    }

    @Override
    public void mouseEntered(MouseEvent event) {
        highlightButtons(event.getLocationOnScreen());
    }

    @Override
    public void mouseExited(MouseEvent e) { }

    @Override
    public void mouseClicked(MouseEvent e) { }

    @Override
    public void mousePressed(MouseEvent e) { }

    @Override
    public void mouseReleased(MouseEvent e) { }
}