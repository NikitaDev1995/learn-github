//
//  ViewController.swift
//  LearnGit
//
//  Created by Nikita Skripka on 15.03.2024.
//

import UIKit

final class ViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    
    var isAnotherImage: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    private func showTheImage(isChangeURL: Bool) {
        var uRLString = "https://cs1.livemaster.ru/storage/0b/91/01e611ad9cc73cf7f1e79e18fach--kartiny-i-panno-berserk-legendarnyj-kadr-iz-mangi.jpg"
        if isChangeURL {
           uRLString = "https://cs1.livemaster.ru/storage/0b/91/01e611ad9cc73cf7f1e79e18fach--kartiny-i-panno-berserk-legendarnyj-kadr-iz-mangi.jpg"
        } else {
            uRLString = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1NuufxzIj7mDFds55TWi8IsuQpqYkXUQy5A&usqp=CAU"
        }
        let url = URL(string: uRLString)
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
    @IBAction func showImageButtonAction(_ sender: UIButton) {
        isAnotherImage.toggle()
        showTheImage(isChangeURL: isAnotherImage)
    }
}

