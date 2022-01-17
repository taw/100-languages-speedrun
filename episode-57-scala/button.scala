import java.awt._
import java.awt.event._
import javax.swing._

var clicks = 0

val f = new JFrame()

f.setLayout(new GridLayout(2, 1))
f.setSize(300, 300)

val l = new JLabel("0")
l.setHorizontalAlignment(SwingConstants.CENTER)
f.add(l)

val b = new JButton("click me")
f.add(b)
b.addActionListener(new ActionListener {
  def actionPerformed(e: ActionEvent) : Unit = {
    clicks += 1
    l.setText(s"${clicks} clicks")
  }
})

f.setVisible(true)
