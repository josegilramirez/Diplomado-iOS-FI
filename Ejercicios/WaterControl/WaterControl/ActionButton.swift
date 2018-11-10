//
//  ActionButton.swift
//  WaterControl
//
//  Created by José Gil Ramírez S on 13/10/18.
//  Copyright © 2018 José Gil Ramírez S. All rights reserved.
//

import UIKit
@IBDesignable //Esta anotación renderiza el draw(rect) en el storyboard

class ActionButton: UIButton {
    @IBInspectable var isAddButton: Bool = true //Agrega un campo en el storyboard para identificar el botón
    @IBInspectable var fillColor: UIColor = UIColor.green
    
    private var halfWidth: CGFloat {
        return bounds.width / 2
    }
    
    private var halfHeight: CGFloat {
        return bounds.height / 2
    }

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(ovalIn: rect)
        //UIColor.green.setFill()
        
        //Luego de declarar fillColor ya lo podemos usar
        fillColor.setFill()
        path.fill()
        
        let plusWidth: CGFloat = min(bounds.width, bounds.height) * 0.6
        let halfPlusWidth = plusWidth / 2
        
        let plusPath = UIBezierPath()
        plusPath.lineWidth = 5.0
        
        //Pinta la línea de menos horizontal -
        plusPath.move(to: CGPoint(x: halfWidth - halfPlusWidth, y: halfHeight))
        plusPath.addLine(to: CGPoint(x: halfWidth + halfPlusWidth, y: halfHeight))
        
        //Pinta la linea de más vertical |
        if isAddButton {
            plusPath.move(to: CGPoint(x: halfWidth, y: halfHeight - halfPlusWidth))
            plusPath.addLine(to: CGPoint(x: halfWidth, y: halfHeight + halfPlusWidth))
        }
        
        
        UIColor.white.setStroke()
        plusPath.stroke()
    }


}
