import UIKit

let NoOfGlasses = 8
let π:CGFloat = CGFloat(M_PI)

@IBDesignable class CounterView: UIView {
  
  @IBInspectable var counter: Int = 5 {
    didSet {
      if counter <=  NoOfGlasses {
        //the view needs to be refreshed
        setNeedsDisplay()
      }
    }
  }
    @IBInspectable var counterColor: UIColor = UIColor.orangeColor()
  
  override func drawRect(rect: CGRect) {
    
    // 1
    let center = CGPoint(x:bounds.width/2, y: bounds.height/2)
    
    // 2
    let radius: CGFloat = max((bounds.width/8), (bounds.height/8))
    
    // 3
    let arcWidth: CGFloat = 76
    
    // 4
    let startAngle: CGFloat = 3 * π / 4
    let endAngle: CGFloat = π / 4
    
    // 5
    let path = UIBezierPath(arcCenter: center,
      radius: radius/2 - arcWidth/2,
      startAngle: startAngle,
      endAngle: endAngle,
      clockwise: true)
    
    // 6
    path.lineWidth = arcWidth
    counterColor.setStroke()
    path.stroke()
    
    //Draw the outline
    
    //1 - first calculate the difference between the two angles
    //ensuring it is positive
    let angleDifference: CGFloat = 2 * π - startAngle + endAngle
    
    //then calculate the arc for each single glass
    let arcLengthPerGlass = angleDifference / CGFloat(NoOfGlasses)
    
    //then multiply out by the actual glasses drunk
    let outlineEndAngle = arcLengthPerGlass * CGFloat(counter) + startAngle
    
    //2 - draw the outer arc
    let outlinePath = UIBezierPath(arcCenter: center,
      radius: bounds.width/2 - 10.5,
      startAngle: startAngle,
      endAngle: outlineEndAngle,
      clockwise: true)
    
    //3 - draw the inner arc
    outlinePath.addArcWithCenter(center,
      radius: bounds.width/2 - arcWidth - 6.5,
      startAngle: outlineEndAngle,
      endAngle: startAngle,
      clockwise: false)
      }
}
