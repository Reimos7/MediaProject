//
//  PracticeLottoViewController.swift
//  MediaProject
//
//  Created by 홍석평 on 6/11/24.
//

import UIKit
import SnapKit
import Alamofire

struct PracticeLotto: Decodable{
    let drwNoDate: String   // 날짜
    let totSellamnt: Int    // 총 당첨금액
    let drwNo: Int          // 회차
}

class PracticeLottoViewController: UIViewController {
    
    let lottoTextField = UITextField()
    let checkButton  = UIButton()
    let resultLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        configureHierarchy()
        configureLayout()
        configureUI()
    }
    
    
    func configureHierarchy(){
        view.addSubview(lottoTextField)
        view.addSubview(checkButton)
        view.addSubview(resultLabel)
    }
    
    
    func configureLayout(){
        
        lottoTextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.width.equalTo(300)
            make.height.equalTo(60)
        }
        checkButton.snp.makeConstraints { make in
            make.top.equalTo(lottoTextField.snp.bottom).offset(20)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.height.equalTo(100)
            make.width.equalTo(100)
        }
        resultLabel.snp.makeConstraints { make in
            make.top.equalTo(lottoTextField.snp.bottom).offset(150)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.height.equalTo(100)
            make.width.equalTo(350)
        }
    }
    
    
    func configureUI(){
        
        view.backgroundColor = .white
        lottoTextField.backgroundColor = .lightGray
        
        resultLabel.backgroundColor = .black
        resultLabel.textColor = .white
        
        checkButton.backgroundColor = .red
        checkButton.setTitle("버튼", for: .normal)
        checkButton.setTitleColor(.white, for: .normal)
        checkButton.addTarget(self, action: #selector(checkButtonClicked), for: .touchUpInside)
        
    }
    @objc func checkButtonClicked(){
        
        // APIURL에서 lottoURL사용, 텍스트필드에 입력한 텍스트 -> 회차정보
        let url = "\(APIURL.lottoURL)\(lottoTextField.text!)"
        
        AF.request(url).responseDecodable(of: PracticeLotto.self)
        { response in
            
            switch response.result{
                // 성공
            case .success(let value):
                
                print(value)
                // self -> 내가 가지고 있는 명확한 프로퍼티를 확인
                // -> 실행이 끝나버리니까 붙잡고 있는 상황
                self.resultLabel.text = "\(value.drwNo)회차 \(value.drwNoDate)날에 \(value.totSellamnt.formatted())원"
                
            case .failure(let error):
                print(error)
                
                self.resultLabel.text = "올바른 값을 입력해주세요."
            }
        }
        
    }
    

   

}
