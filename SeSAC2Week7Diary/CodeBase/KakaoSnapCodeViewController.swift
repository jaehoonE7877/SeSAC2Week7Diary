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
        let size = UIImage.SymbolConfiguration(pointSize: 24)
        let xImage = UIImage(systemName: "xmark", withConfiguration: size)
        $0.setImage(xImage, for: .normal)
        $0.tintColor = .white
        $0.scalesLargeContentImage = true
    }
    
    let giftButton = UIButton().then {
        let size = UIImage.SymbolConfiguration(pointSize: 24)
        let giftImage = UIImage(systemName: "gift.circle.fill", withConfiguration: size)
        $0.setImage(giftImage, for: .normal)
        $0.tintColor = .white
        $0.scalesLargeContentImage = true
    }
    
    let diceButton = UIButton().then {
        let size = UIImage.SymbolConfiguration(pointSize: 24)
        let qrcodeImage = UIImage(systemName: "viewfinder.circle.fill", withConfiguration: size)
        $0.setImage(qrcodeImage, for: .normal)
        $0.tintColor = .white
        $0.scalesLargeContentImage = true
    }
    
    let settingButton = UIButton().then {
        let size = UIImage.SymbolConfiguration(pointSize: 24)
        let settingImage = UIImage(systemName: "gearshape.circle.fill", withConfiguration: size)
        $0.setImage(settingImage, for: .normal)
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
    
    let chatImage = UIImageView().then {
        $0.image = UIImage(systemName: "message.fill")
        $0.tintColor = .white
    }
    
    let chatLabel = UILabel().then {
        $0.text = "나와의 채팅"
        $0.textAlignment = .center
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 13)
    }
    
    let editImage = UIImageView().then {
        $0.image = UIImage(systemName: "pencil")
        $0.tintColor = .white
    }
    
    let editLabel = UILabel().then {
        $0.text = "프로필 편집"
        $0.textAlignment = .center
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 13)
    }
    
    let kakaoStoryImage = UIImageView().then {
        $0.image = UIImage(systemName: "quote.closing")
        $0.tintColor = .white
    }
    
    let kakaoStoryLabel = UILabel().then {
        $0.text = "카카오스토리"
        $0.textAlignment = .center
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 13)
    }
    
    let editButton = UIButton().then {
        $0.setTitle("", for: .normal)
    }
    
    let chatButton = UIButton().then {
        $0.setTitle("", for: .normal)
    }
    
    let kakaoStoryButton = UIButton().then {
        $0.setTitle("", for: .normal)
    }
    
    lazy var topStackView = UIStackView(arrangedSubviews: [giftButton, diceButton, settingButton]).then {
        $0.axis = .horizontal
        $0.spacing = 4
        $0.distribution = .fillEqually
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        configureBackground()
        configureTopUI()
        configureMiddleUI()
        configureBottomUI()
        
        profileNameLabel.text = "서재훈"
        
        profileMessageLabel.text = "자고 싶다!!!!!!!!"
        
    }
    
    func configureBackground(){
        
        view.addSubview(backgroundView)
        
        backgroundView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
    }
    
    
    // 오른쪽 3개 버튼 스택뷰
    func configureTopUI(){
        
        [xButton, topStackView].forEach { backgroundView.addSubview($0) }
        
        xButton.snp.makeConstraints { make in
            make.left.equalTo(12)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.width.equalTo(view).multipliedBy(0.1)
            make.height.equalTo(xButton.snp.width)
        }
        
        topStackView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.right.equalTo(-12)
            make.width.equalTo(view).multipliedBy(0.3)
            make.height.equalTo(xButton.snp.height)
        }
        
    }
    
    // 가운데 들어가는 이미지, 레이블 2개 스택뷰
    func configureMiddleUI(){
        
        [profileImageView, profileNameLabel, profileMessageLabel, lineView].forEach { backgroundView.addSubview($0) }
        
        profileImageView.snp.makeConstraints { make in
            make.width.equalTo(view).multipliedBy(0.25)
            make.height.equalTo(profileImageView.snp.width).multipliedBy(1)
            make.centerX.equalToSuperview()
            make.centerY.equalTo(view).offset(UIScreen.main.bounds.height / 5.5)
        }
        
        profileNameLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
        }
        
        profileMessageLabel.snp.makeConstraints { make in
            make.top.equalTo(profileNameLabel.snp.bottom).offset(12)
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
        
        
        [editImage, editLabel, chatImage, chatLabel, kakaoStoryImage, kakaoStoryLabel].forEach { backgroundView.addSubview($0) }
        
        editImage.addSubview(editButton)
        chatImage.addSubview(chatButton)
        kakaoStoryImage.addSubview(kakaoStoryButton)
        
        
        editImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(lineView).offset(24)
            make.width.equalTo(profileImageView).multipliedBy(0.3)
            make.height.equalTo(editImage.snp.width)
        }
        
        editLabel.snp.makeConstraints { make in
            make.top.equalTo(editImage.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
        }
        
        editButton.snp.makeConstraints { make in
            make.top.equalTo(editImage.snp.top)
            make.left.right.bottom.equalTo(editLabel)
        }
        
        chatImage.snp.makeConstraints { make in
            make.width.equalTo(editImage.snp.width)
            make.height.equalTo(editImage.snp.height)
            make.right.equalTo(editImage.snp.left).offset(-80)
            make.centerY.equalTo(editImage)
        }
        
        chatLabel.snp.makeConstraints { make in
            make.top.equalTo(chatImage.snp.bottom).offset(8)
            make.centerX.equalTo(chatImage)
        }
        
        chatButton.snp.makeConstraints { make in
            make.top.equalTo(chatImage.snp.top)
            make.left.right.bottom.equalTo(chatLabel)
        }
        
        kakaoStoryImage.snp.makeConstraints { make in
            make.width.equalTo(editImage.snp.width)
            make.height.equalTo(editImage.snp.height)
            make.left.equalTo(editImage.snp.right).offset(80)
            make.centerY.equalTo(editImage)
        }
        
        kakaoStoryLabel.snp.makeConstraints { make in
            make.top.equalTo(kakaoStoryImage.snp.bottom).offset(8)
            make.centerX.equalTo(kakaoStoryImage)
        }
        
        kakaoStoryButton.snp.makeConstraints { make in
            make.top.equalTo(kakaoStoryImage.snp.top)
            make.left.right.bottom.equalTo(kakaoStoryLabel)
        }
        
    }
}

