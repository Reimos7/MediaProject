//
//  MovieTableViewCell.swift
//  MediaProject
//
//  Created by 홍석평 on 6/10/24.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    static let identifier = "MovieTableViewCell"
    
    let titleLabel = UILabel()
    let dayLabel = UILabel()
    
    
    // 변경되지 않는 정적인 데이터를 세팅 즉 초기화 해주는 코드
    // NIB == XIB >>> XIB가 없다면 이 코드는 실행x
    // 그릇을 세팅해주는 초기화 구문이니까 코드로만 만들때는 사용 못하는 코드
//    override func awakeFromNib() {
//        super.awakeFromNib()
//
//    }
//
    // 위에 코드랑 같다고 보면 됨 코드 베이스일때 사용하는 초기화 코드임
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // VC view => contentView 로 바뀐다
        // contentView.addSubview를 해야 버튼 동작에 이슈가 없음.
        contentView.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.edges.equalTo(contentView.safeAreaLayoutGuide)
        }
        titleLabel.textColor = .brown
        titleLabel.font = .boldSystemFont(ofSize: 20)
    }
    // init이랑 세트임
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
