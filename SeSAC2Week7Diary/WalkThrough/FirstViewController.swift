//
//  FirstViewController.swift
//  SeSAC2Week7Diary
//
//  Created by Seo Jae Hoon on 2022/08/16.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var tutorialLabel: UILabel!
    @IBOutlet weak var blackView: UIView!
    @IBOutlet weak var starImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        starImageView.image = UIImage(systemName: "star.fill")
        
        tutorialLabel.numberOfLines = 0
        tutorialLabel.alpha = 0
        tutorialLabel.font = .boldSystemFont(ofSize: 25)
        tutorialLabel.backgroundColor = .red
        tutorialLabel.text = """
        일기를 씁시다!
        잘 써봅시다!
        """
        
        blackView.backgroundColor = .black
        blackView.alpha = 0
        
        UIView.animate(withDuration: 3) {
            self.tutorialLabel.alpha = 1
            //self.tutorialLabel.backgroundColor = .yellow
        } completion: { _ in
            self.animateBlackView()
        }

    }
    
    func animateBlackView() {
        
        UIView.animate(withDuration: 2) {
            // CGAffineTransform(scaleX: int, y, int) -> 기존의 몇배로 커지거나 작아지는지
            self.blackView.transform = CGAffineTransform(scaleX: 3, y: 1)
            self.blackView.alpha = 1
        } completion: { _ in
            self.animateimageView()
        }
    }
    
    func animateimageView() {
        
        UIView.animate(withDuration: 1, delay: 0, options: [.repeat, .autoreverse]) {
            self.starImageView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        } completion: { _ in
            
        }

        
    }
    
    
}
