//
//  SecondViewController.swift
//  Collatz
//
//  Created by Sergey Pavlov on 19.08.2022.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet var myView: UIView!
  
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
   
    @IBAction func backTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
