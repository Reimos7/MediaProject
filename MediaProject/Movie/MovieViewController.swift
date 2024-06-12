//
//  MovieViewController.swift
//  MediaProject
//
//  Created by 홍석평 on 6/10/24.
//

import UIKit
import SnapKit
import Alamofire




class MovieViewController: UIViewController {
    
    var list = BoxOffice(boxOfficeResult: Movie(boxofficeType: "", showRange: "", dailyBoxOfficeList: []))
    
    let movieTextField = UITextField()
    let searchButton = UIButton()
    let tableView = UITableView()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 120
        
        self.tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: MovieTableViewCell.identifier)
        
        configureHierarchy()
        configureLayout()
        configureUI()
       
    }
    func configureHierarchy(){
        view.addSubview(movieTextField)
        view.addSubview(searchButton)
        view.addSubview(tableView)
    }
    
    func configureLayout(){
        
 
        movieTextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(50)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.height.equalTo(50)
            make.width.equalTo(250)
        }
        searchButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(50)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(280)
            make.height.equalTo(70)
            make.width.equalTo(100)
        }
        tableView.snp.makeConstraints { make in
            // 4가지 모서리를 다 채워주는 형태
            //make.edges.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(movieTextField.snp.bottom).offset(10)
            make.left.right.bottom.equalTo(view)
        }
       
    
    }
    
    func configureUI(){
        view.backgroundColor = .white
        tableView.backgroundColor = .white
        //movieTextField.textColor = .white
        movieTextField.backgroundColor = .lightGray
        searchButton.backgroundColor = .lightGray
        searchButton.setTitle("검색", for: .normal)
        searchButton.setTitleColor(.blue, for: .normal)
        searchButton.addTarget(self, action: #selector(searchButtonClicked), for: .touchUpInside)
        
        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: MovieTableViewCell.identifier)
        
    }
    
    @objc func searchButtonClicked(){
        
       // callRequestMovieInfo(query: movieTextField.text!)
        let url = "\(APIURL.movieURL)\(movieTextField.text!)"
        AF.request(url).responseDecodable(of: BoxOffice.self)
        { response in
            switch response.result{
            case .success(let value):
                self.list = value
                self.tableView.reloadData()
                
            case .failure(let error):
                print(error)
                
                
            }
        }
    }
    
//    func callRequestMovieInfo(query: String){
//        let param: Parameters = [
//            "query": query
//        ]
//        
//
//        
//        
//        
//        
//        
//        
//    }
}

extension MovieViewController: UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // 10개 미만일 경우도 설정
        if list.boxOfficeResult.dailyBoxOfficeList.count < 10 {
            return list.boxOfficeResult.dailyBoxOfficeList.count
        } else {
            return 10

        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier, for: indexPath) as! MovieTableViewCell
        
        let data = list.boxOfficeResult.dailyBoxOfficeList[indexPath.row]
        
        cell.titleLabel.text = data.movieNm
        cell.dayLabel.text = data.openDt
        
        return cell
    }
    
    
}
