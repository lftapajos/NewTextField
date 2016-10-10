//
//  NewTextField.swift
//  NewTextField
//
//  Created by luis.gomes on 10/10/16.
//  Copyright © 2016 luis.gomes. All rights reserved.
//

import UIKit

@IBDesignable

class NewTextField: UITextField {

    //Efeitos
    @IBInspectable var efeitoAtivo: Bool = true //Default value
    
    //Efeito 1
    @IBInspectable var efeito1: UIColor = UIColor(red: (37.0/255.0), green: (252.0/255), blue: (244.0/255.0), alpha: 1.0)
    @IBInspectable var posicao1: CGFloat = 46 //Default value
    @IBInspectable var raio1: CGFloat = 22 //Default value
    
    //Efeito 2
    @IBInspectable var efeito2: UIColor = UIColor(red: (171.0/255.0), green: (250.0/255), blue: (81.0/255.0), alpha: 1.0)
    @IBInspectable var posicao2: CGFloat = 76 //Default value
    @IBInspectable var raio2: CGFloat = 13 //Default value
    
    //Efeito 3
    @IBInspectable var efeito3: UIColor = UIColor(red: (238.0/255.0), green: (32.0/255), blue: (53.0/255.0), alpha: 1.0)
    @IBInspectable var posicao3: CGFloat = 124 //Default value
    @IBInspectable var raio3: CGFloat = 20 //Default value
    
    //outros
    @IBInspectable var cantoTexto: CGFloat = 1.0
    @IBInspectable var borda: CGFloat = 1.0
    @IBInspectable var corDaBorda: UIColor = UIColor()
    @IBInspectable var bordaAtiva: Bool = false //Default value
    
    //self.layer.cornerRadius = 5.0;
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func drawRect(rect: CGRect) {
        // Add ARCs
        if (self.efeitoAtivo){
            self.addCirle(self.posicao1, capRadius: self.raio1, color: self.efeito1)
            self.addCirle(self.posicao2, capRadius: self.raio2, color: self.efeito2)
            self.addCirle(self.posicao3, capRadius: self.raio3, color: self.efeito3)
        }        
        self.layer.cornerRadius = self.cantoTexto;
        self.layer.borderWidth = self.borda
        self.layer.borderColor = self.corDaBorda.CGColor
        
        //Chama função para criar borda
        if (self.bordaAtiva) {
            self.createBorder()
        }
    }
    
    //Efeitos
    func addOval(lineWidth: CGFloat, path: CGPathRef, strokeStart: CGFloat, strokeEnd: CGFloat, strokeColor: UIColor, fillColor: UIColor, shadowRadius: CGFloat, shadowOpacity: Float, shadowOffsset: CGSize) {
        
        let arc = CAShapeLayer()
        arc.lineWidth = lineWidth
        arc.path = path
        arc.strokeStart = strokeStart
        arc.strokeEnd = strokeEnd
        arc.strokeColor = strokeColor.CGColor
        arc.fillColor = fillColor.CGColor
        arc.shadowColor = UIColor.blackColor().CGColor
        arc.shadowRadius = shadowRadius
        arc.shadowOpacity = shadowOpacity
        arc.shadowOffset = shadowOffsset
        layer.addSublayer(arc)
    }
    
    //Adiciona Efeitos
    func addCirle(arcRadius: CGFloat, capRadius: CGFloat, color: UIColor) {
        let X = CGRectGetMidX(self.bounds)
        let Y = CGRectGetMidY(self.bounds)
        
        // Bottom Oval
        let pathBottom = UIBezierPath(ovalInRect: CGRectMake((X - (arcRadius/2)), (Y - (arcRadius/2)), arcRadius, arcRadius)).CGPath
        self.addOval(20.0, path: pathBottom, strokeStart: 0, strokeEnd: 0.5, strokeColor: color, fillColor: UIColor.clearColor(), shadowRadius: 0, shadowOpacity: 0, shadowOffsset: CGSizeZero)
        
        // Middle Cap
        let pathMiddle = UIBezierPath(ovalInRect: CGRectMake((X - (capRadius/2)) - (arcRadius/2), (Y - (capRadius/2)), capRadius, capRadius)).CGPath
        self.addOval(0.0, path: pathMiddle, strokeStart: 0, strokeEnd: 1.0, strokeColor: color, fillColor: color, shadowRadius: 5.0, shadowOpacity: 0.5, shadowOffsset: CGSizeZero)
        
        // Top Oval
        let pathTop = UIBezierPath(ovalInRect: CGRectMake((X - (arcRadius/2)), (Y - (arcRadius/2)), arcRadius, arcRadius)).CGPath
        self.addOval(20.0, path: pathTop, strokeStart: 0.5, strokeEnd: 1.0, strokeColor: color, fillColor: UIColor.clearColor(), shadowRadius: 0, shadowOpacity: 0, shadowOffsset: CGSizeZero)
        
    }
    
    //Cria Borda
    func createBorder(){
        let border = CALayer()
        let width = CGFloat(2.0)
        border.borderColor = UIColor(red: 55/255, green: 78/255, blue: 95/255, alpha: 1.0).CGColor
        border.frame = CGRect(x: 0, y: self.frame.size.height-width, width: self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
        //print("border created")
    }
    func textFieldDidBeginEditing(textField: UITextField) {
        print("focused")
    }
    func textFieldDidEndEditing(textField: UITextField) {
        print("lost focus")
    }
    
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
