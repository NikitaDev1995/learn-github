//
//  ViewController.swift
//  LearnGit
//
//  Created by Nikita Skripka on 15.03.2024.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showImageButtonAction(_ sender: UIButton) {
        let url = URL(string: "https://cs1.livemaster.ru/storage/0b/91/01e611ad9cc73cf7f1e79e18fach--kartiny-i-panno-berserk-legendarnyj-kadr-iz-mangi.jpg")
        guard let url else {
            print("This url is incorrect")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error {
                print(error.localizedDescription)
            } else {
                guard let data else {
                    print("No data")
                    return
                }
                DispatchQueue.main.async {
                    self.imageView.image = UIImage(data: data)
                }
            }
        }
        task.resume()
    }
}

