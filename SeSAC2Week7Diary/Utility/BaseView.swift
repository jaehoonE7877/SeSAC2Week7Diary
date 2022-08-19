//
//  BaseView.swift
//  SeSAC2Week7Diary
//
//  Created by Seo Jae Hoon on 2022/08/19.
//

import UIKit

class BaseView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() { }
    
    func setConstraints() { }
}


//커스텀 뷰
// required initializer -> 프로토콜로 이니셜라이저를 생성할 때
//protocol example {
//    init(name: String)
//}
//
//class Mobile: example {
//    let name: String
//    
//    required init(name: String){
//        self.name = name
//    }
//}
//
//class Apple : Mobile {
//    let wwdc: String
//    
//    init(wwdc: String) {
//        self.wwdc = wwdc
//        super.init(name: "모바일")
//    }
//    
//    required override init(name: String) {
//        <#code#>
//    }
//    
//}
//
//let a = Apple(wwdc: "애플")
