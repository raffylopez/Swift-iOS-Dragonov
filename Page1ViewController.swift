//
//  Page1ViewController.swift
//  RafDragonov
//
//  Created by Volare on 12/09/2017.
//  Copyright © 2017 Gensys Telerik. All rights reserved.
//

import UIKit
import CoreGraphics
import CoreImage

class Page1ViewController: UIViewController {
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!

    func mkPt(_ x:Double, _ y:Double)->CGPoint {
        return CGPoint(x: x, y: y)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = UIBezierPath()
        path.move(to:img1.center)
        path.addLine(to:img2.center)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = UIColor.blue.cgColor
        shapeLayer.lineWidth = 3.0
        
        self.view.layer.addSublayer(shapeLayer)
        let uac = UIAlertController(title: "Info", message: "No interactivity. Just demonstrates line drawing between two UIImages.", preferredStyle: .alert)
        let action0 = UIAlertAction(title: "OK", style: .default, handler:{
            alert in
            // ok code
        })
        
        let action1 = UIAlertAction(title: "Cancel", style: .cancel, handler:{
            _ in
            // cancel code
        })
        uac.addAction(action0)
        uac.addAction(action1)
        self.present(uac, animated: true, completion: nil)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    


}
