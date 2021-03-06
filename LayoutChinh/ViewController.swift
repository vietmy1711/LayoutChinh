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
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lbl1: UILabel!
    
    //Label Entry
    @IBOutlet weak var lblLeft1: UILabel!
    @IBOutlet weak var lblRight1: UILabel!
    @IBOutlet weak var lblLeft2: UILabel!
    @IBOutlet weak var lblRight2: UILabel!
    @IBOutlet weak var lblLeft3: UILabel!
    
    //TextField
    @IBOutlet weak var txf1: UITextField!
    @IBOutlet weak var txf2: UITextField!
    @IBOutlet weak var txf3: UITextField!
    
    //View Entry Container
    @IBOutlet weak var vwEntryContainer1: UIView!
    @IBOutlet weak var vwEntryContainer2: UIView!
    @IBOutlet weak var vwEntryContainer3: UIView!
    
    //View Entry Overlay
    @IBOutlet weak var vwEntryOverlay1: UIView!
    @IBOutlet weak var vwEntryOverlay2: UIView!
    @IBOutlet weak var vwEntryOverlay3: UIView!
    //Button
    @IBOutlet weak var btn: UIButton!
    
    //Gestures for View Entry Container
    var tapGesture1: UITapGestureRecognizer? = nil
    var tapGesture2: UITapGestureRecognizer? = nil
    var tapGesture3: UITapGestureRecognizer? = nil
    
    //Color
    let backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)

    let topColor = UIColor(red: 127/255, green: 127/255, blue: 127/255, alpha: 1)
    
    let entryColor = UIColor(red: 173/255, green: 171/255, blue: 171/255, alpha: 1)
    
    let overlayColor = UIColor(red: 78/255, green: 180/255, blue: 248/255, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        txf1.delegate = self
        txf2.delegate = self
        txf3.delegate = self
        
        setupUI()
        self.hideKeyboardWhenTappedAround()
    }
    
    //MARK: - Setup UI
    
    func setupUI() {
        vwBackground.backgroundColor = backgroundColor

        lblTitle.textColor = topColor
        lbl1.textColor = topColor
        
        //Entry
        lblLeft1.textColor = entryColor
        lblRight1.textColor = entryColor
        
        lblLeft2.textColor = entryColor
        lblRight2.textColor = entryColor
        
        lblLeft3.textColor = entryColor
        
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
        
        //View Entry Overlay
        vwEntryOverlay1.backgroundColor = overlayColor
        vwEntryOverlay1.layer.opacity = 0
        vwEntryOverlay1.isUserInteractionEnabled = false
        
        vwEntryOverlay2.backgroundColor = overlayColor
        vwEntryOverlay2.layer.opacity = 0
        vwEntryOverlay2.isUserInteractionEnabled = false
        
        vwEntryOverlay3.backgroundColor = overlayColor
        vwEntryOverlay3.layer.opacity = 0
        vwEntryOverlay3.isUserInteractionEnabled = false
        
        //Add Entry View Container Tap Gesture
        
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(viewEntryContainerOnClick))
        tapGesture1 = tap1
        
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(viewEntryContainerOnClick))
        tapGesture2 = tap2
        let tap3 = UITapGestureRecognizer(target: self, action: #selector(viewEntryContainerOnClick))
        tapGesture3 = tap3
        
        vwEntryContainer1.addGestureRecognizer(tap1)
        vwEntryContainer2.addGestureRecognizer(tap2)
        vwEntryContainer3.addGestureRecognizer(tap3)
    }
    
    @objc func viewEntryContainerOnClick(_ sender:UITapGestureRecognizer) {
        
        hideOverlay()
        
        switch sender {
        case tapGesture1:
            vwEntryOverlay1.layer.opacity = 0.3
        case tapGesture2:
            vwEntryOverlay2.layer.opacity = 0.3
        default:
            vwEntryOverlay3.layer.opacity = 0.3
        }
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
    
    //Change Overlay Opacity to 0
    func hideOverlay() {
        vwEntryOverlay1.layer.opacity = 0
        vwEntryOverlay2.layer.opacity = 0
        vwEntryOverlay3.layer.opacity = 0
    }
}

//MARK: - TextField Delegate

extension ViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        hideOverlay()
        switch textField {
        case txf1:
            vwEntryOverlay1.layer.opacity = 0.3
        case txf2:
            vwEntryOverlay2.layer.opacity = 0.3
        default:
            vwEntryOverlay3.layer.opacity = 0.3
        }
        return true
    }
}

extension UIColor {
    
}
