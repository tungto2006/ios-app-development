//
//  ViewController.swift
//  ScrollingForm
//
//  Created by Tung Nguyen on 11/20/19.
//  Copyright © 2019 Tung Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        registerForKeyboardNotifications()
    }
    
    func registerForKeyboardNotifications() {
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasShown(_:)), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeHidden(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)

        }
    @objc func keyboardWasShown(_ notificiation: NSNotification) {
            guard let info = notificiation.userInfo,
                let keyboardFrameValue =
                info[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue
                else { return }
    
            let keyboardFrame = keyboardFrameValue.cgRectValue
            let keyboardSize = keyboardFrame.size
    
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height, right: 0.0)
            scrollView.contentInset = contentInsets
            scrollView.scrollIndicatorInsets = contentInsets
    }
    
    @objc func keyboardWillBeHidden(_ notification: NSNotification) {
            let contentInsets = UIEdgeInsets.zero
            scrollView.contentInset = contentInsets
            scrollView.scrollIndicatorInsets = contentInsets
        }

}

