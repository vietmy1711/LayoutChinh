//
//  ViewController.swift
//  LayoutChinh
//
//  Created by MM on 6/11/20.
//  Copyright © 2020 MM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Outlets
    
    //Background
    @IBOutlet var vwBackground: UIView!
    
    //Seperator
    @IBOutlet weak var vwSeperator1: UIView!
    @IBOutlet weak var vwSeperator2: UIView!
    @IBOutlet weak var vwSeperator3: UIView!
    @IBOutlet weak var vwSeperator4: UIView!
    @IBOutlet weak var vwSeperator5: UIView!
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lbl1: UILabel!
    
    //Label entry
    @IBOutlet weak var lblLeft1: UILabel!
    @IBOutlet weak var lblRight1: UILabel!
    @IBOutlet weak var lblLeft2: UILabel!
    @IBOutlet weak var lblRight2: UILabel!
    @IBOutlet weak var lblLeft3: UILabel!
    
    //Button
    @IBOutlet weak var btn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupUI()
        self.hideKeyboardWhenTappedAround()
    }
    
    //MARK: - Setup UI
    
    func setupUI() {
        vwBackground.backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
        
        vwSeperator1.backgroundColor = UIColor(red: 227/255, green: 227/255, blue: 227/255, alpha: 1)
        vwSeperator2.backgroundColor = UIColor(red: 227/255, green: 227/255, blue: 227/255, alpha: 1)
        vwSeperator3.backgroundColor = UIColor(red: 227/255, green: 227/255, blue: 227/255, alpha: 1)
        vwSeperator4.backgroundColor = UIColor(red: 227/255, green: 227/255, blue: 227/255, alpha: 1)
        vwSeperator5.backgroundColor = UIColor(red: 227/255, green: 227/255, blue: 227/255, alpha: 1)
        
        lblTitle.textColor = UIColor(red: 127/255, green: 127/255, blue: 127/255, alpha: 1)
        lbl1.textColor = UIColor(red: 127/255, green: 127/255, blue: 127/255, alpha: 1)
        
        //Entry
        lblLeft1.textColor = UIColor(red: 173/255, green: 171/255, blue: 171/255, alpha: 1)
        lblRight1.textColor = UIColor(red: 173/255, green: 171/255, blue: 171/255, alpha: 1)
        
        lblLeft2.textColor = UIColor(red: 173/255, green: 171/255, blue: 171/255, alpha: 1)
        lblRight2.textColor = UIColor(red: 173/255, green: 171/255, blue: 171/255, alpha: 1)
        
        lblLeft3.textColor = UIColor(red: 173/255, green: 171/255, blue: 171/255, alpha: 1)
        
        //Button
        btn.layer.masksToBounds = true
        btn.layer.cornerRadius = 20
        btn.setTitleColor(.white, for: .normal)
        
        // Apply Gradient Color
        let startColor = UIColor(red: 78/255, green: 180/255, blue: 248/255, alpha: 1)
        let endColor = UIColor(red: 95/255, green: 210/255, blue: 211/255, alpha: 1)
        let gradientLayer:CAGradientLayer = CAGradientLayer()
        gradientLayer.frame.size = btn.frame.size
        gradientLayer.colors =
            [startColor.cgColor, endColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        btn.layer.addSublayer(gradientLayer)
    }
    
    //MARK: - Hide keyboard
    
    func hideKeyboardWhenTappedAround() {
        let tapGesture = UITapGestureRecognizer(target: self,
                                                action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
}
