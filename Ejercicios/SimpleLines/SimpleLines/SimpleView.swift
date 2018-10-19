//
//  SimpleView.swift
//  SimpleLines
//
//  Created by José Gil Ramírez S on 13/10/18.
//  Copyright © 2018 José Gil Ramírez S. All rights reserved.
//

import UIKit

class SimpleView: UIView {

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // El contexto es el lienzo de pintado
        let context = UIGraphicsGetCurrentContext()
        
        context?.setLineWidth(2.0)
        context?.setStrokeColor(UIColor.black.cgColor)
        
//        context?.move(to: CGPoint(x: 0, y: 0))
//        context?.addLine(to: CGPoint(x: 100, y: 100))
//        context?.addLine(to: CGPoint(x: 100, y: frame.height))
        
        context?.move(to: CGPoint(x: 50, y: 50))
        context?.addLine(to: CGPoint(x: 150, y: 50))
        context?.addQuadCurve(to: CGPoint(x: 160, y: 60), control: CGPoint(x: 160, y: 50))
        context?.addLine(to: CGPoint(x: 160, y: 150))
        context?.addQuadCurve(to: CGPoint(x: 150, y: 160), control: CGPoint(x: 160, y: 160))
        context?.addLine(to: CGPoint(x: 50, y: 160))
        context?.addQuadCurve(to: CGPoint(x: 40, y: 150), control: CGPoint(x: 40, y: 160))
        context?.addLine(to: CGPoint(x: 40, y: 60))
        context?.addQuadCurve(to: CGPoint(x: 50, y: 50), control: CGPoint(x: 40, y: 50))
        
        context?.strokePath()
    }


}
