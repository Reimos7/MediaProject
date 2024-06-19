//
//  WeatherViewController.swift
//  MediaProject
//
//  Created by 홍석평 on 6/11/24.
//

import UIKit
import SnapKit
import Alamofire
import CoreLocation // 1. 위치 프레임 워크 임포트 . 위치를 사용하고 싶을때 사용

class WeatherViewController: UIViewController {
    
 
    
    let locationTextField = UITextField()
    let checkButton = UIButton()
    let weatherLabel1 = UILabel()
    let weatherLabel2 = UILabel()
    let weatherLabel3 = UILabel()
    
    let locationButton = UIButton()
    
    // 2. 위치 매니저 생성: 위치에 대한 대부분을 담당
    let locationManager = CLLocationManager()

    
    var list = WeatherInfo(coord: Coord(lon: 0, lat: 0), weather: [], wind: Wind(speed: 0, deg: 0), sys: Sys(country: ""), name: "", main: Main(temp: 0, humidity: 0))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHierarchy()
        configureLayout()
        configureUI()
        locationManager.delegate = self
    }
    func configureHierarchy(){
        view.addSubview(locationTextField)
        view.addSubview(checkButton)
        view.addSubview(weatherLabel1)
        view.addSubview(weatherLabel2)
        view.addSubview(weatherLabel3)
        view.addSubview(locationButton)
        
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
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
        weatherLabel2.snp.makeConstraints { make in
            make.top.equalTo(weatherLabel1.snp.bottom).offset(30)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
        weatherLabel3.snp.makeConstraints { make in
            make.top.equalTo(weatherLabel2.snp.bottom).offset(30)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
        locationButton.snp.makeConstraints { make in
            make.top.equalTo(weatherLabel3.snp.bottom).offset(30)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
    }
    func configureUI(){
        view.backgroundColor = .orange
        
        locationTextField.backgroundColor = .white
        
        checkButton.backgroundColor = .red
        checkButton.addTarget(self, action: #selector(checkButtonClicked), for: .touchUpInside)
        
        weatherLabel1.backgroundColor = .white
        weatherLabel2.backgroundColor = .white
        weatherLabel3.backgroundColor = .white
        
        
        locationButton.backgroundColor = .red
        locationButton.addTarget(self, action: #selector(locationButtonClicked), for: .touchUpInside)
        
    }
    
    @objc func locationButtonClicked(){
        print(#function)
        checkDeviceLocationAuthorization()
        
    }
    @objc func checkButtonClicked(){
        
       // callRequest(location: nil)
        
    }
    
    func callRequest(location: CLLocationCoordinate2D) {
        
        let url = "\(APIURL.weatherURL)&lat=\(location.latitude)&lon=\(location.longitude)&appid=\(APIKey.weatherKey)"
        

        //let header: HTTPHeaders = ["appid": APIKey.weatherKey]
        
        AF.request(url).responseDecodable(of: WeatherInfo.self)
        { response in
            switch response.result {
            case .success(let value):
               
                self.list = value
               
                let tempSet = value.main.temp - 273.15
                let weatherTemp = Int(tempSet)
                
                self.weatherLabel1.text = "지금은 \(weatherTemp) ℃ 에요"
                self.weatherLabel2.text = "\(value.main.humidity)% 만큼 습해요"
                self.weatherLabel3.text = "\(value.wind.speed)m/s의 바람이 불어요"
                print(value.sys.country)
                
                
                
                
            case .failure(let error):
                print(error)
                print("오류다")
            }
        }
        
    }

    
}
    

extension WeatherViewController {
    // 1) 사용자에게 권한 요청을 하기 위해 , iOS 위치 서비스 활성화 여부 체크
    func checkDeviceLocationAuthorization(){
        
        if CLLocationManager.locationServicesEnabled(){
            
            // 2) 현재 사용자 위치 권한 상태 확인
            checkCurrentLocationAuthorization()
        } else {
            print("위치 서비스가 꺼져있어서, 위치 권한 요청을 할 수 없어요.")
        }
    }
    
    func checkCurrentLocationAuthorization(){
        var status: CLAuthorizationStatus
        // 소프트웨어 버전이 14.0 버전이상이라면 *은 마이너 버전 포함
        if #available(iOS 14.0, *){
            status = locationManager.authorizationStatus
        } else{
            status = CLLocationManager.authorizationStatus()
        }
        
        switch status {
        case .notDetermined:
            print("이 권한에서만 권한 문구를 띄울 수 잇음")
            
            // 정확도.. best로 설정하면 플랫폼에 맞게 대응해줌 애플워치 아이폰 만보기 예시
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            
            locationManager.requestWhenInUseAuthorization()
        
        case .denied:
            print("사용자가 위치 서비스 사용을 거부")
        
        case .authorizedWhenInUse:
            print("위치 정보 알려달라고 로직을 구성 할 수 있음")
            // 현재 사용자가 위치하고 있는 현재 정보에 대해서 달라는 의미
            // didUpdateLocations을 실행 시켜줌
            locationManager.startUpdatingLocation()
      
        default:
            print(status)
        }


    }
    
    
}

// 3. 위치 관련 프로토콜 선언 : CLLocationManagerDelegate
extension WeatherViewController: CLLocationManagerDelegate{
    
    // 5. 사용자 위치를 성공적으로 가지고 온 경우
    // 코드 구성에 따라 여러번 호출이 될 수도 있다
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        print(#function)
        print(locations)
        
        if let coordinate = locations.last?.coordinate{
//            print(coordinate)
           print(coordinate.latitude)  // 위도
            print(coordinate.longitude) // 경도
            callRequest(location: coordinate)
            locationManager.stopUpdatingLocation()
           // setRegionAndAnnotation(center: coordinate)
        }
        
        // 업데이트를 멈춤 서비스에 따라 호출 하는지 아닌지에 따라 다름
        // startUpdatingLocationd을 했으면 더이상 위치를 안받아도 되는 시점에서는 stop을 외쳐야 합니다
        locationManager.startUpdatingLocation()
        
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
            checkDeviceLocationAuthorization()
        }

        func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
            checkDeviceLocationAuthorization()
        }
}

