//
//  NameTableViewCell.swift
//  Lesson2_06
//
//  Created by Askar on 28.10.2023.
//

import UIKit

final class NameTableViewCell: UITableViewCell {
    
    private lazy var wholeView = UIView()
    
    private lazy var imageIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    private lazy var nameLabel1: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    private lazy var chevronIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "threepoints")
        imageView.tintColor = .gray
        return imageView
    }()
    
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(name: String, imageName: String) {
        imageIcon.image = UIImage(named: imageName)
        nameLabel.text = name
        nameLabel1.text = name
    }
}

//MARK: - Setup UI

private extension NameTableViewCell {
    
    func setupUI() {
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        addSubview(wholeView)
        wholeView.addSubview(imageIcon)
        wholeView.addSubview(nameLabel)
        wholeView.addSubview(nameLabel1)
        wholeView.addSubview(chevronIcon)
    }
    
    func setupConstraints() {
        wholeView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(10)
        }
        imageIcon.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.size.equalTo(self.snp.height).multipliedBy(0.4)
            make.centerY.equalToSuperview()
        }
        nameLabel.snp.makeConstraints { make in
//            make.top.bottom.equalToSuperview()
            make.leading.equalTo(imageIcon.snp.trailing).offset(15)
            make.trailing.equalTo(chevronIcon.snp.leading)
            make.top.equalTo(imageIcon.snp.top)
        }
        nameLabel1.snp.makeConstraints { make in
//            make.top.bottom.equalToSuperview()
            make.leading.equalTo(imageIcon.snp.trailing).offset(15)
            make.top.equalTo(nameLabel.snp.top).offset(25)
       
            make.trailing.equalTo(chevronIcon.snp.leading)
        }
        chevronIcon.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.size.equalTo(self.snp.height).multipliedBy(0.2)
            make.centerY.equalToSuperview()
        }
    }
}

