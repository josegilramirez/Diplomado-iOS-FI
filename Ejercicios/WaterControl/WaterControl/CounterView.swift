//
//  CounterView.swift
//  WaterControl
//
//  Created by José Gil Ramírez S on 13/10/18.
//  Copyright © 2018 José Gil Ramírez S. All rights reserved.
//

import UIKit

class CounterView: UIView {
    @IBInspectable var counterColor: UIColor = UIColor.orange
    
    private struct Constants {
        static let numberOfGlasses = 8
    }
    
    @IBInspectable var counter: Int = 5 {
        didSet {
            if counter <= Constants.numberOfGlasses {
                //Refresca la vista
                setNeedsDisplay()
            }
        }
    }

    override func draw(_ rect: CGRect) {
        let center = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
        let radius: CGFloat = max(bounds.width, bounds.height)
        let startAngle: CGFloat = 3 * .pi / 4
        let endAngle: CGFloat = 1 * .pi / 4
        
        let path = UIBezierPath(arcCenter: center,
                                radius: (radius / 2) - (76 / 2),
                                startAngle: startAngle,
                                endAngle: endAngle,
                                clockwise: true)
        
        path.lineWidth = 76
        counterColor.setStroke()
        path.stroke()
        
        //Calcula el espacio disponible el contador
        let angleDifference: CGFloat = 2 * .pi - startAngle + endAngle
        //Calcula el tamaño de cada porción a pintar
        let arcLengthPerGlass = angleDifference / CGFloat(Constants.numberOfGlasses)
        //Checar
        let outlineEndAngle = arcLengthPerGlass * CGFloat(counter) + startAngle
        
        //Definir el bezier del contorno del contador
        //Se pinta el arco exterior
        let outlinePath = UIBezierPath(arcCenter: center,
                                       radius: bounds.width / 2 - 4,
                                       startAngle: startAngle,
                                       endAngle: outlineEndAngle,
                                       clockwise: true)
        
        //Se pinta el arco interior pero en sentido inverso
        outlinePath.addArc(withCenter: center,
                           radius: bounds.width / 2 - 76 + 4,
                           startAngle: outlineEndAngle,
                           endAngle: startAngle,
                           clockwise: false)
        
        //Se hace el cierre de las uniones
        outlinePath.close()
        UIColor.blue.setStroke()
        outlinePath.lineWidth = 8
        outlinePath.stroke()
        
    }


}
