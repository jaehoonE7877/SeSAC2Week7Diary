//
//  UIViewContorller+Extension.swift
//  SeSAC2Week7Diary
//
//  Created by Seo Jae Hoon on 2022/08/18.
//

import UIKit

extension UIViewController {
    
    // TMDB -> 화면전환
    func transitionViewController<T: UIViewController>(storyboard: String, viewController vc: T) {
            
        let sb = UIStoryboard(name: storyboard, bundle: nil)
        guard let controller = sb.instantiateViewController(withIdentifier: String(describing: vc)) as? T else { return }
        
        //present, present-overfullscreen ,push 나누기
        self.present(controller, animated: true)
    }
    
    
}
