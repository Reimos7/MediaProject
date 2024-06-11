//
//  WeatherViewController.swift
//  MediaProject
//
//  Created by 홍석평 on 6/11/24.
//

import UIKit
import SnapKit
import Alamofire

class WeatherViewController: UIViewController {
    
    struct Weather: Decodable{
        
        let temp: Double
        let wind: Double
        
    }
    
    let locationTextField = UITextField()
    let checkButton = UIButton()
    let weatherLabel1 = UILabel()
    let weatherLabel2 = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        configureHierarchy()
        configureLayout()
        configureUI()
        
    }
    func configureHierarchy(){
        view.addSubview(locationTextField)
        view.addSubview(checkButton)
        view.addSubview(weatherLabel1)
        view.addSubview(weatherLabel2)
        
    }
    func configureLayout(){
        locationTextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.height.equalTo(50)
            make.width.equalTo(200)
        }
        checkButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(250)
            make.height.equalTo(50)
            make.width.equalTo(50)
        }
        weatherLabel1.snp.makeConstraints { make in
            make.top.equalTo(locationTextField.snp.bottom).offset(30)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.width.equalTo(100)
            make.height.equalTo(50)
        }
        weatherLabel2.snp.makeConstraints { make in
            make.top.equalTo(weatherLabel1.snp.bottom).offset(30)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.width.equalTo(100)
            make.height.equalTo(50)
        }
    }
    func configureUI(){
        view.backgroundColor = .white
        
        locationTextField.backgroundColor = .lightGray
        
        checkButton.backgroundColor = .red
        checkButton.addTarget(self, action: #selector(checkButtonClicked), for: .touchUpInside)
        
        weatherLabel1.backgroundColor = .lightGray
        weatherLabel2.backgroundColor = .lightGray
        
    }
    @objc func checkButtonClicked(){
        
        
        let url = "\(APIURL.weatherURL)"
        
        AF.request(url).responseDecodable(of: Weather.self)
        { response in
            
            switch response.result{
                // 성공
            case .success(let value):
                print(value)
                self.weatherLabel1.text = "\(value.temp)도 입니다"
                self.weatherLabel2.text = "\(value.wind)m/s의 바람"
               
               
                
            case .failure(let error):
                print(error)
                self.weatherLabel1.text = "오류"
                self.weatherLabel2.text = "오류"
                
                
            }
        }
        
    }
    }
    
    
    

