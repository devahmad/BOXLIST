//
//  VCAddItem.swift
//  BoxList
//
//  Created by DEVaHmad on 4/2/18.
//  Copyright © 2018 DEVaHmad. All rights reserved.
//

import UIKit
import CoreData
class VCAddItem: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    @IBOutlet weak var txtItemname: UITextField!
    @IBOutlet weak var BoxPickerView: UIPickerView!
    @IBOutlet weak var ivShowimage: UIImageView!
    var imagePicker:UIImagePickerController!
    var ListOfBox = [BoxType]()
    override func viewDidLoad() {
        super.viewDidLoad()
        loadsBoxList()
        BoxPickerView.delegate   = self
        BoxPickerView.dataSource = self
        BoxPickerView.selectRow(2, inComponent: 0, animated: true)
        imagePicker = UIImagePickerController()
        imagePicker.delegate     = self
    }
    
    func loadsBoxList() {
        let fetchRequest: NSFetchRequest<BoxType> = BoxType.fetchRequest()
        do{
            ListOfBox = try context.fetch(fetchRequest)
        }catch {
            print("cannot load db")
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ListOfBox.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let box = ListOfBox[row]
        return box.box_name
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let titleData = ListOfBox[row]
        let myTitle = NSAttributedString(string: titleData.box_name!, attributes: [NSAttributedStringKey.font:UIFont(name: "Georgia", size: 17.0)!,NSAttributedStringKey.foregroundColor:UIColor.white])
        return myTitle
    }
    
    @IBAction func buSelectPicture(_ sender: Any) {
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            ivShowimage.image = image
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func buSaveItem(_ sender: Any) {
        let newItem = Items(context:context)
        newItem.item_name = txtItemname.text
        newItem.date_add  = NSDate() as Date
        newItem.image     = ivShowimage.image
        newItem.toBox     = ListOfBox[ BoxPickerView.selectedRow(inComponent: 0)]
        do {
            ad.saveContext()
            txtItemname.text = ""
        } catch {
            print("Error Cannot save db ")
        }
    }
    
    @IBAction func buBack(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
