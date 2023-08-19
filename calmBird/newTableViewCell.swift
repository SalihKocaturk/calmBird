//
//  newTableViewCell.swift
//  calmBird
//
//  Created by salih kocatürk on 3.08.2023.
//

import UIKit
    
    class newTableViewCell: UITableViewCell {
        
        @IBOutlet weak var birdImage: UIImageView!
        
        
       
     
  
        override func awakeFromNib() {
            super.awakeFromNib()
            
            let imageTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(savephoto))
            
            birdImage.frame = CGRect(x: 0, y: 0, width: 133, height: 133)
           
            
        }
        
        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
            
            
        }
        @objc func savephoto(){
            
            
            
            
        }
      
    }
    

