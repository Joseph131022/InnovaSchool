//
//  ViewController.swift
//  InnovaSchool
//
//  Created by DAMII on 4/11/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnIniciarUser(_ sender: UIButton) {
        performSegue(withIdentifier: "iniciarUser", sender: nil)
    }
    @IBAction func btnRegistrarUser(_ sender: UIButton) {
        performSegue(withIdentifier: "registroUser", sender: nil)
    }
    
}

