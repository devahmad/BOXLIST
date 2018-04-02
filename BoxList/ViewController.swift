//
//  ViewController.swift
//  BoxList
//
//  Created by DEVaHmad on 4/2/18.
//  Copyright © 2018 DEVaHmad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtBoxname: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func buAddBox(_ sender: Any) {
        //TODD: ADD BOX
        let newBox = BoxType(context: context)
        newBox.box_name = txtBoxname.text
        do{
            ad.saveContext()
            txtBoxname.text = ""
        } catch {
            print("cannot save db")
        }
    }
    
    @IBAction func buBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        
    }
}

