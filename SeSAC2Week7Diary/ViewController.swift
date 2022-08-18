//
//  ViewController.swift
//  SeSAC2Week7Diary
//
//  Created by Seo Jae Hoon on 2022/08/16.
//

import UIKit
import SeSAC2UIFramework
import SnapKit
import Then

class ViewController: UIViewController {

    let nameButton = UIButton().then {
        $0.setTitle("닉네임", for: .normal)
        $0.backgroundColor = .systemYellow
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        
        nameButton.addTarget(self, action: #selector(nameButtonTapped), for: .touchUpInside)
        
    }
    
    @objc
    func nameButtonTapped() {
        
        let vc = ProfileViewController()
        vc.saveButtonActionHandler = {
            guard let nickName = vc.nameTextField.text else { return }
            self.nameButton.setTitle(nickName, for: .normal)
        }
        
        
        present(vc, animated: true)
        
    }
    
    
    func configure() {
        
        view.addSubview(nameButton)
        
        nameButton.snp.makeConstraints { make in
            make.width.height.equalTo(200)
            make.center.equalToSuperview()
        }
        
    }

}

