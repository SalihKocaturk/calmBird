//
//  newTableViewCell.swift
//  calmBird
//
//  Created by salih kocatürk on 3.08.2023.
//

import UIKit
    
    class newTableViewCell: UITableViewCell {
        
        @IBOutlet weak var birdImage: UIImageView!
        @IBOutlet weak var saveTXT: UILabel!
        
        @IBOutlet weak var saveImage: UIImageView!
     
        
        override func awakeFromNib() {
            super.awakeFromNib()
            saveImage.isUserInteractionEnabled = true
            let imageTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(savephoto))
            saveImage.addGestureRecognizer(imageTapRecognizer)
            
            
        }
        
        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
            
            
        }
        @objc func savephoto(){
            
            
            
            
        }
      
    }
    

