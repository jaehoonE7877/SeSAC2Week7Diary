//
//  WriteViewController.swift
//  SeSAC2Week7Diary
//
//  Created by Seo Jae Hoon on 2022/08/19.
//

import UIKit

class WriteViewController: BaseViewController {
    
    // 메인뷰 안에 들어있는 객체들을 사용하기 위해서 변수 선언
    var mainView = WriteView()
    
    // ViewDidLoad 보다 먼저 호출됨
    override func loadView() { //super.loadView X
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    // 테이블뷰 나 컬렉션 뷰 딜리게이트, 데이타소스, 여기서
    override func configure() {
        
        mainView.titleTextField.addTarget(self, action: #selector(titleTextFieldTapped(_:)), for: .editingDidEndOnExit)
    }
    
    @objc
    func titleTextFieldTapped(_ textField: UITextField){
        guard let text = textField.text, text.count > 0 else {
            showAlertMessage(title: "안녕", button: "그래 안녕")
            return
            
        }
        
    }
    
}
