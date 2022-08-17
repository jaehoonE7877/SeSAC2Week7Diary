//
//  KakaoSnapCodeViewController.swift
//  SeSAC2Week7Diary
//
//  Created by Seo Jae Hoon on 2022/08/17.
//

import UIKit

import SnapKit
import Then

class KakaoSnapCodeViewController: UIViewController {
    
    let backgroundView = UIView().then {
        $0.backgroundColor = UIColor(red: 47/255, green: 42/255, blue: 183/255, alpha: 1)
    }
    
    let xButton = UIButton().then {
        $0.setImage(UIImage(systemName: "xmark"), for: .normal)
        $0.tintColor = .white
        $0.scalesLargeContentImage = true
    }
    
    let giftButton = UIButton().then {
        $0.setImage(UIImage(systemName: "gift.circle.fill"), for: .normal)
        $0.tintColor = .white
        $0.scalesLargeContentImage = true
    }
    
    let diceButton = UIButton().then {
        $0.setImage(UIImage(systemName: "viewfinder.circle.fill"), for: .normal)
        $0.tintColor = .white
        $0.scalesLargeContentImage = true
    }
    
    let settingButton = UIButton().then {
        $0.setImage(UIImage(systemName: "gearshape.circle.fill"), for: .normal)
        $0.tintColor = .white
        $0.scalesLargeContentImage = true
    }
    
    let profileImageView = UIImageView().then {
        $0.image = UIImage(named: "dog.png")    // 설정에서 바꿀 수 있어야 함
        $0.contentMode = .scaleToFill
        $0.layer.masksToBounds = true
        $0.layer.cornerRadius = 40
    }
    
    let profileNameLabel = UILabel().then {
        $0.textAlignment = .center
        $0.font = .boldSystemFont(ofSize: 20)
        $0.textColor = .white
    }
    
    let profileMessageLabel = UILabel().then {
        $0.textAlignment = .center
        $0.font = .systemFont(ofSize: 17)
        $0.textColor = .white
    }
    
    let lineView = UIView().then {
        $0.backgroundColor = .lightGray
    }
    
    let chatButton = UIButton().then {
        $0.setImage(UIImage(systemName: "message.fill"), for: .normal)
        $0.tintColor = .white
        $0.scalesLargeContentImage = true
    }
    
    let chatLabel = UILabel().then {
        $0.text = "나와의 채팅"
        $0.textAlignment = .center
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 13)
    }
    
    let editButton = UIButton().then {
        $0.setImage(UIImage(systemName: "pencil"), for: .normal)
        $0.tintColor = .white
        $0.scalesLargeContentImage = true
    }
    
    let editLabel = UILabel().then {
        $0.text = "프로필 편집"
        $0.textAlignment = .center
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 13)
    }
    
    let kakaoStoryButton = UIButton().then {
        $0.setImage(UIImage(systemName: "quote.closing"), for: .normal)
        $0.tintColor = .white
        $0.scalesLargeContentImage = true
    }
    
    let kakaoStoryLabel = UILabel().then {
        $0.text = "카카오스토리"
        $0.textAlignment = .center
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 13)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(backgroundView)
        
        backgroundView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        configureTopUI()
        configureMiddleUI()
        configureBottomUI()
        
        profileNameLabel.text = "서재훈"
        
        profileMessageLabel.text = "자고 싶다!!!!!!!!"
        
    }
    
    
    // 오른쪽 3개 버튼 스택뷰
    func configureTopUI(){
        
        
        [xButton, giftButton, diceButton, settingButton].forEach { view.addSubview($0) }
        
        
        
        xButton.snp.makeConstraints { make in
            make.leftMargin.equalTo(20)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.width.equalTo(view).multipliedBy(0.08)
            make.height.equalTo(xButton.snp.width)
        }
        
        settingButton.snp.makeConstraints { make in
            make.rightMargin.equalTo(-20)
            make.top.equalTo(xButton.snp.top)
            make.width.equalTo(xButton.snp.width)
            make.height.equalTo(xButton.snp.height)
        }
        
        diceButton.snp.makeConstraints { make in
            make.right.equalTo(settingButton.snp.left).offset(-20)
            make.top.equalTo(xButton.snp.top)
            make.width.equalTo(xButton.snp.width)
            make.height.equalTo(xButton.snp.height)
        }
        
        giftButton.snp.makeConstraints { make in
            make.right.equalTo(diceButton.snp.left).offset(-20)
            make.top.equalTo(xButton.snp.top)
            make.width.equalTo(xButton.snp.width)
            make.height.equalTo(xButton.snp.height)
        }
    }
    
    // 가운데 들어가는 이미지, 레이블 2개 스택뷰
    func configureMiddleUI(){
        
        [profileImageView, profileNameLabel, profileMessageLabel, lineView].forEach { view.addSubview($0) }
        
        profileImageView.snp.makeConstraints { make in
            make.width.equalTo(view).multipliedBy(0.25)
            make.height.equalTo(profileImageView.snp.width).multipliedBy(1)
            make.centerX.equalToSuperview()
            make.centerY.equalTo(view).offset(UIScreen.main.bounds.height / 5)
        }
        
        profileNameLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
        profileMessageLabel.snp.makeConstraints { make in
            make.top.equalTo(profileNameLabel.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
        }
        
        lineView.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.width.equalToSuperview()
            make.centerX.equalToSuperview()
            make.top.equalTo(profileMessageLabel.snp.bottom).offset(20)
        }
    }
    
    func configureBottomUI(){
        
        [editButton, editLabel, chatButton, chatLabel, kakaoStoryButton, kakaoStoryLabel].forEach { view.addSubview($0) }
        
        editButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(lineView).offset(16)
            make.width.equalTo(profileImageView).multipliedBy(0.33)
            make.height.equalTo(editButton.snp.width)
        }
        
        editLabel.snp.makeConstraints { make in
            make.top.equalTo(editButton.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
        }
        
        chatButton.snp.makeConstraints { make in
            make.width.equalTo(editButton.snp.width)
            make.height.equalTo(editButton.snp.height)
            make.right.equalTo(editButton.snp.left).offset(-80)
            make.centerY.equalTo(editButton)
        }
        
        chatLabel.snp.makeConstraints { make in
            make.top.equalTo(chatButton.snp.bottom).offset(8)
            make.centerX.equalTo(chatButton)
        }
        
        kakaoStoryButton.snp.makeConstraints { make in
            make.width.equalTo(editButton.snp.width)
            make.height.equalTo(editButton.snp.height)
            make.left.equalTo(editButton.snp.right).offset(80)
            make.centerY.equalTo(editButton)
        }
        
        kakaoStoryLabel.snp.makeConstraints { make in
            make.top.equalTo(kakaoStoryButton.snp.bottom).offset(8)
            make.centerX.equalTo(kakaoStoryButton)
        }
        
    }
    
}

