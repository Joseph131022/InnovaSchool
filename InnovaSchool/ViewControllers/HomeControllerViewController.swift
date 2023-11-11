//
//  HomeControllerViewController.swift
//  InnovaSchool
//
//  Created by DAMII on 7/11/23.
//

import UIKit

class HomeControllerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    @IBAction func btncursos(_ sender: UIButton) {
        performSegue(withIdentifier: "viewcurso", sender: nil)
    }
    
}
