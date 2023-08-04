//
//  selectBirdViewController.swift
//  calmBird
//
//  Created by salih kocatürk on 28.07.2023.
//

import UIKit
class BirdImages{
    var id = UUID()
    var image = UIImage(named: "bird")
    init(id:UUID = UUID(), image:UIImage = UIImage(named: "bird") ?? UIImage(named: "bird")! ){
        self.id = id
        self.image = image
        
    }
}

class selectBirdViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    var bird = UIImage(named: "bird")
    var bird1 = UIImage(named: "bird1")
    var bird2 = UIImage(named: "bird2")
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    @IBOutlet weak var tableView1: UITableView!
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let uuid = UUID()
        let phototo1 = BirdImages(id: uuid, image: UIImage(named: "bird")!)
        let uuid1 = UUID()
        let phototo2 = BirdImages(id: uuid1, image: UIImage(named: "bird1")!)
        let uuid2 = UUID()
        let phototo3 = BirdImages(id: uuid2, image: UIImage(named: "bird2")!)
        var birdImages = [phototo1,phototo2,phototo3]

        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! newTableViewCell
        showPhotoMakeId()
        cell.birdImage.image = birdImages[indexPath.row].image
        cell.saveImage.image = UIImage(named: "save")
        cell.saveTXT.text = "save"
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
 
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
