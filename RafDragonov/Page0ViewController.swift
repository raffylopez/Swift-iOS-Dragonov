//
//  ViewController.swift
//  RafDragonov
//
//  Created by Volare on 11/09/2017.
//  Copyright © 2017 Gensys Telerik. All rights reserved.
//

import UIKit

class Page0ViewController: UIViewController {
    
    @IBOutlet weak var imgv: DraggableImageView!
    
    func getcoloratpt(_ sender:UITapGestureRecognizer) {
            color = imgv.getPixelColorAt(point: sender.location(in:imgv))
        
            print("(color.redValue) \(color.greenValue) \(color.blueValue) \(color.alphaValue)")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let pan = PanRecognizerWithInitialTouch(target: self, action: #selector(draggon))
        pan.imgv = imgv
        
        imgv.addGestureRecognizer(pan)
    }
    var deltaloc:CGPoint!
    
    func diff_cgpts(_ first:CGPoint, _ second:CGPoint)->CGPoint {
        let _c = CGPoint(x:first.x - second.x, y: first.y - second.y)
        return _c
    }
    
    var color:UIColor!
    
    func draggon(_ sender:PanRecognizerWithInitialTouch) {
        
        if sender.state == .began {
        } else if sender.state == .ended {
        } else {
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}

extension UIImageView {
    func getPixelColorAt(point:CGPoint) -> UIColor{
        
        let pixel = UnsafeMutablePointer<CUnsignedChar>.allocate(capacity: 4)
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedLast.rawValue)
        let context = CGContext(data: pixel, width: 1, height: 1, bitsPerComponent: 8, bytesPerRow: 4, space: colorSpace, bitmapInfo: bitmapInfo.rawValue)
        
        context!.translateBy(x: -point.x, y: -point.y)
        layer.render(in: context!)
        let color:UIColor = UIColor(red: CGFloat(pixel[0])/255.0,
                                    green: CGFloat(pixel[1])/255.0,
                                    blue: CGFloat(pixel[2])/255.0,
                                    alpha: CGFloat(pixel[3])/255.0)
        
        pixel.deallocate(capacity: 4)
        return color
    }
    
    
}
extension UIImageView {
    func getPixelColor(pos:CGPoint)->UIColor {
        let pixelData = self.image?.cgImage!.dataProvider!.data
        let data: UnsafePointer<UInt8> = CFDataGetBytePtr(pixelData)
        
        let pixelInfo: Int = ((Int((self.image?.size.width)!) * Int(pos.y)) + Int(pos.x)) * 4
        
        let r = CGFloat(data[pixelInfo]) / CGFloat(255.0)
        let g = CGFloat(data[pixelInfo+1]) / CGFloat(255.0)
        let b = CGFloat(data[pixelInfo+2]) / CGFloat(255.0)
        let a = CGFloat(data[pixelInfo+3]) / CGFloat(255.0)
        
        return UIColor(red: r, green: g, blue: b, alpha: a)
    }
}

extension UIColor {
    func isEqualWithConversion(_ color: UIColor) -> Bool {
        guard let space = self.cgColor.colorSpace
            else { return false }
        guard let converted = color.cgColor.converted(to: space, intent: .absoluteColorimetric, options: nil)
            else { return false }
        return self.cgColor == converted
    }
    var redValue: CGFloat{
        return cgColor.components! [0]
    }
    
    var greenValue: CGFloat{
        return cgColor.components! [1]
    }
    
    var blueValue: CGFloat{
        return cgColor.components! [2]
    }
    
    var alphaValue: CGFloat{
        return cgColor.components! [3]
    }
}

