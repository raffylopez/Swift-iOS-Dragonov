//
//  Page3ViewController.swift
//  RafDragonov
//
//  Created by Volare on 12/09/2017.
//  Copyright © 2017 Gensys Telerik. All rights reserved.
//

import UIKit

class Page3ViewController: UIViewController {

    @IBOutlet weak var lineDrawCanvas: LineDrawCanvas!
    @IBOutlet public weak var img1: UIImageView!
    @IBOutlet public weak var img2: UIImageView!
    
    func handlerfoo(_ sender: PanRecognizerWithInitialTouch) {
        lineDrawCanvas.setNeedsDisplay()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pan1 = PanRecognizerWithInitialTouch(target: self, action: #selector(handlerfoo))
        pan1.imgv = img1
        img1.addGestureRecognizer(pan1)
        
        let pan2 = PanRecognizerWithInitialTouch(target: self, action: #selector(handlerfoo))
        pan2.imgv = img2
        img2.addGestureRecognizer(pan2)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        lineDrawCanvas.targetViewController = self
    }

}
