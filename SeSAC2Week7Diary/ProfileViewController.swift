//
//  ProfileViewController.swift
//  SeSAC2Week7Diary
//
//  Created by Seo Jae Hoon on 2022/08/18.
//

import UIKit
import SnapKit
import Then

extension Notification.Name {
    static let saveButton = NSNotification.Name("saveButtonNotification")
}




class ProfileViewController: UIViewController {
    
    let saveButton = UIButton().then {
        $0.setTitle("저장", for: .normal)
        $0.backgroundColor = .systemYellow
    }
    
    let nameTextField = UITextField().then {
        $0.placeholder = "닉네임을 입력해주세요!"
        $0.backgroundColor = .brown
        $0.textColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemMint
        
        configure()
        
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        
        NotificationCenter.default.addObserver(self, selector: #selector(saveButtonNotificationObserver(notification:)), name: NSNotification.Name("test"), object: nil)
        
    }
    
    var saveButtonActionHandler: ((String) -> ())?
    
    func configure() {
        [saveButton, nameTextField].forEach { view.addSubview($0) }
        
        saveButton.snp.makeConstraints { make in
            make.width.height.equalTo(100)
            make.center.equalTo(view)
        }
        
        nameTextField.snp.makeConstraints { make in
            make.left.right.equalTo(view).inset(50)
            make.top.height.equalTo(50)
        }
    
    }
    
    @objc
    func saveButtonTapped() {
        
        //1. 클로저 구문 활용
        //saveButtonActionHandler?(nameTextField.text!)
        
        //2. Notification name: 이름 지어주기 user info : 딕셔너리기반으로 전달하고 싶은 데이터 넘겨주기(여러개 가능)
        NotificationCenter.default.post(name: .saveButton, object: nil, userInfo: ["name": nameTextField.text!, "value" : 123456 ])
        
        //화면 dismiss
        dismiss(animated: true)
    }
    
    @objc
    func saveButtonNotificationObserver(notification: NSNotification) {
        print(#function)
        // userinfo 가 있는지 옵셔널 체이닝 해주기
        // userinfo는 any 타입이기 때문에 타입 캐스팅 꼭 필요!
        if let name = notification.userInfo?["name"] as? String {
            print(name)
            self.nameTextField.text = name
        }
        
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name("test"), object: nil)
    }

}
