//
//  selectBirdViewController.swift
//  calmBird
//
//  Created by salih kocatürk on 28.07.2023.
//

import UIKit
class BirdImages{
    var birdId = 0
    var image = UIImage(named: "bird")
  
    init(birdID:Int64 = 0, image:UIImage = UIImage(named: "bird") ?? UIImage(named: "bird")! ){
        self.birdId = Int(birdID)
        self.image = image
        
    }
}

class selectBirdViewController: UIViewController, UITableViewDelegate,UITableViewDataSource{
    
    
    var bird = UIImage(named: "bird")
    var bird1 = UIImage(named: "bird1")
    var bird2 = UIImage(named: "bird2")
    var selectedBird = ""
    var seletedBirdId:Int64 = 0
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    @IBOutlet weak var tableView1: UITableView!
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let birdId1:Int64 = 1
        let Image1 = UIImage(named: "bird")
        let phototo1 = BirdImages(birdID: birdId1, image: UIImage(named: "bird")!)
        let birdId2:Int64 = 2
        let phototo2 = BirdImages(birdID:  birdId2, image: UIImage(named: "bird1")!)
        let birdId3:Int64 = 3
        let phototo3 = BirdImages(birdID:  birdId3, image: UIImage(named: "bird2")!)
        var birdImages = [phototo1,phototo2,phototo3]

        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! newTableViewCell
        showPhotoMakeId()
       

        cell.birdImage.image = birdImages[indexPath.row].image
                
        
        var content = cell.defaultContentConfiguration()
        
        return cell
    }
    
    
    
 
    override func viewDidLoad() {
        tableView1.delegate = self
        tableView1.dataSource = self
        super.viewDidLoad()
        
      
       
       
        
        // Do any additional setup after loading the view.
    }
    func showPhotoMakeId(){
                
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let birdId1:Int64 = 1
        let phototo1 = BirdImages(birdID: birdId1, image: UIImage(named: "bird")!)
        let birdId2:Int64 = 2
        let phototo2 = BirdImages(birdID:  birdId2, image: UIImage(named: "bird1")!)
        let birdId3:Int64 = 3
        let phototo3 = BirdImages(birdID:  birdId3, image: UIImage(named: "bird2")!)
        var birdImages = [phototo1,phototo2,phototo3]
        seletedBirdId = Int64(birdImages[indexPath.row].birdId)
        self.performSegue(withIdentifier: "toGM", sender: nil)
       
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toGM"{
            let destinationVC = segue.destination as! GameViewController
            destinationVC.chosenBirdId = Int(seletedBirdId)
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
