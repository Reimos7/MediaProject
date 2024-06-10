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
    let drwNoDate: String
    let totSellamnt: Int
    static var drwNo: Int?
    
    
}

class LottoViewController: UIViewController {
    
   
    let lottoCount = Array(1...1000)
    
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
            make.trailing.equalTo(20)
            make.height.equalTo(50)
        }
        
        
    }
    func configureUI(){
        
        view.backgroundColor = .white
        numberTextField.backgroundColor = .gray
        infoLabel.text = "당첨번호 안내"
        
        
    }
    
}
extension LottoViewController: UIPickerViewDelegate,UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
       
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return lottoCount.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return "\(lottoCount)"
    }
    
    
}
