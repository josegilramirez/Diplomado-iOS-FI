//
//  SquareView.swift
//  SimpleLines
//
//  Created by José Gil Ramírez S on 13/10/18.
//  Copyright © 2018 José Gil Ramírez S. All rights reserved.
//

import UIKit

class SquareView: UIView {

    /*
    override func draw(_ rect: CGRect) {
        
        // El contexto es el lienzo de pintado
        let context = UIGraphicsGetCurrentContext()
        
        context?.setLineWidth(2.0)
        context?.setStrokeColor(UIColor.black.cgColor)
        
        context?.move(to: CGPoint(x: 10, y: 0))
        context?.addLine(to: CGPoint(x: frame.width - 10, y: 0))
        context?.addQuadCurve(to: CGPoint(x: frame.width, y: 10), control: CGPoint(x: frame.width, y: 0))
        context?.addLine(to: CGPoint(x: frame.width, y: frame.height - 10))
        context?.addQuadCurve(to: CGPoint(x: frame.width - 10, y: frame.height), control: CGPoint(x: frame.height, y: frame.width))
        context?.addLine(to: CGPoint(x: 10, y: frame.width))
        context?.addQuadCurve(to: CGPoint(x: 0, y: frame.height - 10), control: CGPoint(x: 0, y: frame.height))
        context?.addLine(to: CGPoint(x: 0, y: 10))
        context?.addQuadCurve(to: CGPoint(x: 10, y: 0), control: CGPoint(x: 0, y: 0))
        
        context?.strokePath()
    }
    */

    override func draw(_ rect: CGRect) {
        let aPath = UIBezierPath()
        aPath.lineWidth = 4
        UIColor.black.set()
        
        aPath.move(to: CGPoint(x: 10, y: 0))
        aPath.addLine(to: CGPoint(x: frame.width - 10, y: 0))
        aPath.addQuadCurve(to: CGPoint(x: frame.width, y: 10), controlPoint: CGPoint(x: frame.width, y: 0))
        aPath.addLine(to: CGPoint(x: frame.width, y: frame.height - 10))
        aPath.addQuadCurve(to: CGPoint(x: frame.width - 10, y: frame.height), controlPoint: CGPoint(x: frame.height, y: frame.width))
        aPath.addLine(to: CGPoint(x: 10, y: frame.width))
        aPath.addQuadCurve(to: CGPoint(x: 0, y: frame.height - 10), controlPoint: CGPoint(x: 0, y: frame.height))
        aPath.addLine(to: CGPoint(x: 0, y: 10))
        aPath.addQuadCurve(to: CGPoint(x: 10, y: 0), controlPoint: CGPoint(x: 0, y: 0))
        
        aPath.stroke()
        
    }
}
