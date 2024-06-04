//
//  NetflixMemberShipViewController.swift
//  MediaProject
//
//  Created by 홍석평 on 6/5/24.
//

import UIKit

import SnapKit

class NetflixMemberShipViewController: UIViewController {
    
    let mainLabel = UILabel()
    
    let emailPhoneTextField = UITextField()
    let pwdTextField = UITextField()
    let nicknameTextField = UITextField()
    let locationTextField = UITextField()
    let recommandCodeTextField = UITextField()
    let memberShipButton = UIButton()
    
    let addInfoButton = UIButton()
    let switchButton = UISwitch()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHierarchy()
        configureLayout()
        configureUI()
        
    }
    
    func configureHierarchy(){
        
        view.addSubview(mainLabel)
        
        view.addSubview(emailPhoneTextField)
        view.addSubview(pwdTextField)
        view.addSubview(nicknameTextField)
        view.addSubview(locationTextField)
        view.addSubview(recommandCodeTextField)
        view.addSubview(memberShipButton)
        
        view.addSubview(addInfoButton)
        view.addSubview(switchButton)
    }
    
    
    func configureLayout(){
        
        mainLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.horizontalEdges.equalTo(100)
            make.height.equalTo(50)
        }
        
        emailPhoneTextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(200)
            make.leading.equalTo(50)
            make.height.equalTo(30)
            make.width.equalTo(300)
        }
        
        pwdTextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(250)
            make.leading.equalTo(50)
            make.height.equalTo(30)
            make.width.equalTo(300)
        }
        nicknameTextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(300)
            make.leading.equalTo(50)
            make.height.equalTo(30)
            make.width.equalTo(300)
        }
        locationTextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(350)
            make.leading.equalTo(50)
            make.height.equalTo(30)
            make.width.equalTo(300)
        }
        recommandCodeTextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(400)
            make.leading.equalTo(50)
            make.height.equalTo(30)
            make.width.equalTo(300)
        }
        memberShipButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(450)
            make.leading.equalTo(50)
            make.height.equalTo(50)
            make.width.equalTo(300)
        }
        addInfoButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(500)
            make.leading.equalTo(50)
            make.height.equalTo(50)
            make.width.equalTo(110)
        }
        switchButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(510)
            make.leading.equalTo(300)
            
        }
    }
    
    
    func configureUI(){
        
        view.backgroundColor = .black
        
        mainLabel.text = "JACKFLIX"
        mainLabel.font = .boldSystemFont(ofSize: 40)
        mainLabel.textColor = .red
        
        // 세팅 함수
        setTextField(emailPhoneTextField, "이메일 주소 또는 전화번호")
        setTextField(pwdTextField, "비밀번호")
        setTextField(nicknameTextField, "닉네임")
        setTextField(locationTextField, "위치")
        setTextField(recommandCodeTextField, "추천 코드 입력")
        
        memberShipButton.setTitle("회원가입", for: .normal)
        memberShipButton.setTitleColor(.black, for: .normal)
        memberShipButton.backgroundColor = .white
        
        addInfoButton.setTitle("추가 정보 입력", for: .normal)
        addInfoButton.setTitleColor(.white, for: .normal)
        
        // 스위치 버튼 on -> 레드컬러
        switchButton.onTintColor = .red
        
        
    }
    
    // 텍스트필드 세팅 함수
    func setTextField(_ textField: UITextField, _ placeHolder: String){
        textField.attributedPlaceholder = NSAttributedString(
            string: placeHolder,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        textField.textAlignment = .center
        textField.backgroundColor = .gray
    }
    
    
    
    
}
