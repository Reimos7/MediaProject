//
//  LottoViewController.swift
//  MediaProject
//
//  Created by 홍석평 on 6/9/24.
//

import UIKit
import Alamofire
import SnapKit


struct Lotto: Decodable{
    let drwNoDate: String  // 추첨 날짜
    let totSellamnt: Int
    static var drwNo: Int? // 로또 회차
}


class LottoViewController: UIViewController {
    // 예시
    var lottoNumbers = ""
    
    let numberTextField = UITextField()
    let infoLabel = UILabel()
    let lottoInfoLabel = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
       
        
        configureHierarchy()
        configureLayout()
        configureUI()
        
        createPickerView()
        
    }
    // 피커뷰 생성
    func createPickerView(){
        // 세팅
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        numberTextField.tintColor = .clear
        
        // 텍스트필드를 입력 수단으로 설정
        numberTextField.inputView = pickerView
        
    }
    
    func configureHierarchy(){
        
        view.addSubview(numberTextField)
        view.addSubview(infoLabel)
        view.addSubview(lottoInfoLabel)
        
    }
    func configureLayout(){
        numberTextField.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(50)
        }
        infoLabel.snp.makeConstraints { make in
            make.top.equalTo(numberTextField.snp.bottom).offset(20)
            make.leading.equalTo(20)
            make.height.equalTo(50)
        }
        lottoInfoLabel.snp.makeConstraints { make in
            make.top.equalTo(numberTextField.snp.bottom).offset(20)
            make.leading.equalTo(300)
            make.height.equalTo(50)
        }
        
        
    }
    func configureUI(){
        
        view.backgroundColor = .white
        numberTextField.backgroundColor = .gray
        infoLabel.text = "당첨번호 안내"
        lottoInfoLabel.textColor = .lightGray
        lottoInfoLabel.text = "추첨일자"
        
        
    }
    
   
    
}
extension LottoViewController: UIPickerViewDelegate,UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
       
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return lottoNumbers.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
         return "lottoNumbers"
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
       
            
            let url = "\(APIURL.lottoURL)"
           
            // Swift.DecodingError.keyNotFound 에러대응
            // 1. URL 맞는지 확인
            // 2. responseString으로 확인하기 식판에 담기지 않는 내용 확인
            // 3. struct의 키들을 옵셔널로 바꾸자 그럼 value를 print 했을때 확인 가능
    //        AF.request(url).responseString { response in
    //            print(response)
    //        }
    //
            AF.request(url).responseDecodable(of: Lotto.self)
            { response in
                switch response.result{
                case .success(let value):
                    
                    print(value)
                    // self -> 내가 가지고 있는 명확한 프로퍼티를 확인
                    // -> 실행이 끝나버리니까 붙잡고 있는 상황
                    
                    self.lottoInfoLabel.text = "\(value.drwNoDate)추첨"
                    
                case .failure(let error):
                    print(error)
                    
                    self.lottoInfoLabel.text = "에러"
                }
            }
            
            
            
            
        
        
    }
    
    
}
