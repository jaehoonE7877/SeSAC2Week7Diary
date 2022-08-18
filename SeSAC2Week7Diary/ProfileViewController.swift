//
//  ProfileViewController.swift
//  SeSAC2Week7Diary
//
//  Created by Seo Jae Hoon on 2022/08/18.
//

import UIKit
import SnapKit
import Then

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
    }
    
    var saveButtonActionHandler: (() -> ())?
    
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
        
        //값 전달 기능 실행 => 클로저 구문 활용
        saveButtonActionHandler?()
        
        //화면 dismiss
        dismiss(animated: true)
    }
    
    

}
