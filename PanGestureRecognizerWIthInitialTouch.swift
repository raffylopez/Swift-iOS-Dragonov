//
//  PanGestureRecognizerWIthInitialTouch.swift
//  RafDragonov
//
//  Created by Volare on 11/09/2017.
//  Copyright © 2017 Gensys Telerik. All rights reserved.
//

import UIKit.UIGestureRecognizerSubclass

class PanRecognizerWithInitialTouch : UIPanGestureRecognizer {
    var initialTouchLocation: CGPoint!
    var imgv: UIImageView!
    var color:UIColor!
    var dragWithTargetMissed: Bool = false
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesBegan(touches, with: event)
        
        
        initialTouchLocation = touches.first!.location(in: imgv.superview)
        
        let center = initialTouchLocation
        color = imgv.getPixelColorAt(point: self.location(in:imgv))
        print("\(color.redValue) \(color.greenValue) \(color.blueValue) \(color.alphaValue)")
        if (color.redValue == 0 && color.greenValue == 0 && color.blueValue == 0){
            dragWithTargetMissed = true
            self.cancel()
            return
        }
        
        UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseInOut, animations: {
            self.imgv.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            self.imgv.center = center!
            self.imgv.alpha = 0.3
            
            print(self.initialTouchLocation)
        }, completion: {
            (isComplete) in
            
            self.dragWithTargetMissed = false
        })
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent) {
        if !dragWithTargetMissed {
            super.touchesMoved(touches, with: event)
            imgv.center = self.location(in:imgv.superview)
            
            dragWithTargetMissed = false
        }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesEnded(touches, with: event)
        if !dragWithTargetMissed {
            dragWithTargetMissed = false
            UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseInOut, animations: {
                self.imgv.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.imgv.alpha = 1
            }, completion: {
                (isComplete) in
            self.dragWithTargetMissed = false
            })
        }
    }
}


func diff_cgpts(_ first:CGPoint, _ second:CGPoint)->CGPoint {
    let _c = CGPoint(x:first.x - second.x, y: first.y - second.y)
    return _c
}


extension PanRecognizerWithInitialTouch {
    func cancel() {
        self.isEnabled = false;
        self.isEnabled = true;
    }
}
