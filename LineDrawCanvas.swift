//
//  LineDrawCanvas.swift
//  RafDragonov
//
//  Created by Volare on 13/09/2017.
//  Copyright © 2017 Gensys Telerik. All rights reserved.
//

import UIKit

class LineDrawCanvas: UIView {
    var targetViewController:UIViewController! 
    
    override func draw(_ rect: CGRect) {
        let p3vc = targetViewController as! Page3ViewController
        let img1 = p3vc.img1!
        let img2 = p3vc.img2!
        
        let path = UIBezierPath(rect: rect)
        path.move(to: img1.center)
        path.addLine(to: img2.center)
        path.stroke()
        
    }

}
