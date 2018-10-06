//
//  ViewController.swift
//  Photos
//
//  Created by José Gil Ramírez S on 05/10/18.
//  Copyright © 2018 José Gil Ramírez S. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.isHidden = true
        addButton.layer.borderWidth = 1
        addButton.layer.cornerRadius = 7
        addButton.layer.borderColor = UIColor(red:0.86, green:0.78, blue:0.88, alpha:1.0).cgColor
        
        let rightButton = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(addPhoto))
        
        rightButton.tintColor = UIColor.white
        navigationItem.rightBarButtonItem = rightButton
    }
    
    @objc func addPhoto() {
        let actionSheet = UIAlertController(title: "Photos", message: "Selecciona la fuente de tu foto", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        
        let imagePickerView = UIImagePickerController()
        actionSheet.addAction(UIAlertAction(title: "Biblioteca de Fotos", style: .default, handler: { (action) in
            imagePickerView.sourceType = .photoLibrary
            imagePickerView.allowsEditing = true
            imagePickerView.delegate = self
            self.present(imagePickerView, animated: true, completion: nil)
        }))
        actionSheet.addAction(UIAlertAction(title: "Cámara", style: .default, handler: { (action) in
            imagePickerView.sourceType = .camera
            imagePickerView.allowsEditing = true
            imagePickerView.delegate = self
            self.present(imagePickerView, animated: true, completion: nil)
        }))
        present(actionSheet, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: PickerView Delegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("El usuario cancela selección de fotos")
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        print("Photo dictionary: \(info)")
        guard let image = info[UIImagePickerControllerEditedImage] as? UIImage else { return }
        imageView.image = image
        imageView.isHidden = false
        picker.dismiss(animated: true, completion: nil)
    }
    
    //MARK: IBActions
    @IBAction func selectPhoto(_ sender: UIButton) {
    }
}

