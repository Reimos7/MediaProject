//
//  NetflixViewController.swift
//  MediaProject
//
//  Created by 홍석평 on 6/5/24.
//

import UIKit

import SnapKit

class NetflixHomeViewController: UIViewController {
    
    let photoImage = UIImageView()
    let playButton = UIButton()
    let myListButton = UIButton()
    
    let popularLabel = UILabel()
    let popularImage1 = UIImageView()
    let popularImage2 = UIImageView()
    let popularImage3 = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.tintColor = .white
        self.title = "고래밥님"
        
        
        configureHierarchy()
        configureLayout()
        configureUI()
        
        
    }
    
    func configureHierarchy(){
        
        view.addSubview(photoImage)
        view.addSubview(playButton)
        view.addSubview(myListButton)
        
        view.addSubview(popularLabel)
        view.addSubview(popularImage1)
        view.addSubview(popularImage2)
        view.addSubview(popularImage3)
        
        
    }
    
    func configureLayout(){
        
        photoImage.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(100)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.height.equalTo(350)
        }
        
        playButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(480)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(50)
            make.width.equalTo(136)
            make.height.equalTo(32)
        }
        
        myListButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(480)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(200)
            make.width.equalTo(136)
            make.height.equalTo(32)
        }
        
        popularLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(550)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(25)
            make.height.equalTo(32)
        }
        
        popularImage1.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(580)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(25)
            make.height.equalTo(160)
            make.width.equalTo(100)
        }
        popularImage2.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(580)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(150)
            make.height.equalTo(160)
            make.width.equalTo(100)
        }
        popularImage3.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(580)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(275)
            make.height.equalTo(160)
            make.width.equalTo(100)
        }
//
        
    }
    func configureUI(){
        
        view.backgroundColor = .black
        
        photoImage.image = UIImage(named: "노량")
        photoImage.contentMode = .scaleAspectFill
        
        playButton.setImage(UIImage(named: "play_normal"), for: .normal)
        myListButton.setImage(UIImage(named: "mynetflix"), for: .normal)
        
        popularLabel.text = "지금 뜨는 콘텐츠"
        popularLabel.textColor = .white
        popularLabel.textAlignment = .left
        
        popularImage1.image = UIImage(named: "밀수")
        popularImage2.image = UIImage(named: "서울의봄")
        popularImage3.image = UIImage(named: "육사오")
    }
   

}
