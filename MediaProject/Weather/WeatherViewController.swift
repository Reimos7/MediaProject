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
    
 
    
    let locationTextField = UITextField()
    let checkButton = UIButton()
    let weatherLabel1 = UILabel()
    let weatherLabel2 = UILabel()
    
    
    
    var list = MainWeather(weather: [], countryName: sys(country: ""))
    
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
        
        callRequest()
        
    }
    
    func callRequest() {
        
        let url = "\(APIURL.weatherURL)\(locationTextField.text!)"
        
        let header: HTTPHeaders = ["appid": APIKey.weatherKey]
        
        AF.request(url, method: .get, headers: header).validate(statusCode: 200..<500).responseDecodable(of: MainWeather.self)
        { response in
            switch response.result {
            case .success(let value):
               
                self.list = value
               
                self.weatherLabel1.text = "\(self.list.countryName.country)"
                self.weatherLabel2.text = self.list.weather.description
                
                
            case .failure(let error):
                print(error)
            }
        }
        
    }

    
}
    

