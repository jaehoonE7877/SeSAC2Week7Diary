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
        
        //2. Notification
        // viewdidload 될 때 데이터를 받아오자!
        NotificationCenter.default.addObserver(self, selector: #selector(saveButtonNotificationObserver(notification:)), name: NSNotification.Name("saveButtonNotification"), object: nil)
    }
    
    @objc
    func saveButtonNotificationObserver(notification: NSNotification) {
        // userinfo 가 있는지 옵셔널 체이닝 해주기
        // userinfo는 any 타입이기 때문에 타입 캐스팅 꼭 필요!
        if let name = notification.userInfo?["name"] as? String {
            print(name)
            nameButton.setTitle(name, for: .normal)
        }
        
    }
    
    
    @objc
    func nameButtonTapped() {
        
        
        NotificationCenter.default.post(name: NSNotification.Name("test"), object: nil, userInfo: ["name": "\(Int.random(in: 1...100))", "value" : 123456 ])
        
        let vc = ProfileViewController()
        
        vc.saveButtonActionHandler = { value in
            
            self.nameButton.setTitle(value, for: .normal)
            
        }
        
        

        present(vc, animated: true)
        
//        let vc = WriteViewController()
//        vc.modalPresentationStyle = .fullScreen
//        present(vc, animated: true)
        
    }
    
    
    func configure() {
        
        view.addSubview(nameButton)
        
        nameButton.snp.makeConstraints { make in
            make.width.height.equalTo(200)
            make.center.equalToSuperview()
        }
        
    }

}

