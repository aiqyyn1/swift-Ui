//
//  ViewController.swift
//  Lesson2_06
//
//  Created by Askar on 23.09.2023.
//

import UIKit
import SnapKit

final class ViewController: UIViewController {
    
    private let privetstvie10 = ["Hello", "Привет", "Сәлем", "Merhaba", "iHola", "Bonjour", "Hallo!", "Ciao", "你好", "こんにちは"]
    private let privetstvie5 = ["Annyeonghaseyo", "Marhaban", "Hallo", "Olá", "Hej"]
    private let privetstvie55 = ["Cześć", "¿Qué onda?", "Pryvit", "Hei", "Halló"]
    private let images = ["random1", "random2", "random3", "random4", "random5", "random6", "random7", "random8", "random9", "random10"]
    private let images1 = ["korean", "arabian", "vanpersie", "portugal", "swed"]
    private let images2 = ["lewa", "suarez", "ukrain", "haaland", "ice"]
    private let sections = ["To Do (10)", "To Do (5)" , "To Do (5)"]
    
    private lazy var namesTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(NameTableViewCell.self, forCellReuseIdentifier: "NameTableViewCell")
        return tableView
    }()
    private lazy var navBar : UIView = {
         let label = UIView()

        return label
    }()
  
    private lazy var navIconCalendar : UIImageView = {
         let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "calendar")
        return image
    }()
    private lazy var navText: UILabel = {
         let label = UILabel()
        label.text =  "To Do List"
        label.font = UIFont.boldSystemFont(ofSize: 25)
        return label
    }()
    private lazy var navText1 : UILabel = {
        let label = UILabel()
        label.text = "8 tasks, 3 completed"
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    private lazy var navIconSearch : UIImageView = {
        let image = UIImageView()
       image.contentMode = .scaleAspectFit
       image.image = UIImage(named: "search")
       return image
    }()
    let navView: UIView = {
           let navView = UIView()
           navView.backgroundColor = .systemGray5
     
           return navView
       }()
       let navButton1: UILabel = {
           let navButton1 = UILabel()
           navButton1.text = "YESTERDAY"
           navButton1.font = UIFont.boldSystemFont(ofSize: 12)
           return navButton1
       }()
       let todayView: UIView = {
           let todayVIew = UIView()
           todayVIew.backgroundColor = .black
           
           todayVIew.layer.cornerRadius = 15
           return todayVIew
       }()
       let navButton2: UILabel = {
           let navButton2 = UILabel()
           navButton2.text = "TODAY (10)"
           navButton2.textColor = .white
           navButton2.font = UIFont.boldSystemFont(ofSize: 12)
           return navButton2
       }()
       let navButton3: UILabel = {
           let navButton3 = UILabel()
           navButton3.text = "TOMORROW"
           navButton3.font = UIFont.boldSystemFont(ofSize: 12)

           return navButton3
       }()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        view.backgroundColor = .systemBackground
        namesTableView.dataSource = self
        namesTableView.delegate = self
        
        setupUI()
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 10
        case 1:
            return 5
        case 2:
            return 5
        default:
            return 0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NameTableViewCell", for: indexPath) as! NameTableViewCell

        switch indexPath.section {
        case 0:
            cell.configure(name: privetstvie10[indexPath.row], imageName: images[indexPath.row])
        case 1:
            cell.configure(name: privetstvie5[indexPath.row], imageName: images1[indexPath.row])
        default:
            cell.configure(name: privetstvie55[indexPath.row], imageName: images2[indexPath.row])
        }
        
        return cell
    }
}

//MARK: - Table view delegate methods
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        (view.window?.windowScene?.screen.bounds.height ?? 0) * 0.1
    }
}

// MARK: - UI setup methods
private extension ViewController {
    
    func setupUI() {
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        view.addSubview(namesTableView)
        view.addSubview(navBar)
        view.addSubview(navView)
        navView.addSubview(navButton1)
        navView.addSubview(todayView)
        todayView.addSubview(navButton2)
        navView.addSubview(navButton3)
        navBar.addSubview(navIconCalendar)
        navBar.addSubview(navText)
        navBar.addSubview(navIconSearch)
        navBar.addSubview(navText1)
    }
    
    func setupConstraints() {
        namesTableView.snp.makeConstraints { make in
//            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
//            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.width.equalTo(view)
            make.height.equalTo(view)
            make.top.equalTo(navView.snp.top).offset(45)
            make.center.equalToSuperview()
//            make.leading.trailing.equalToSuperview().inset(20)
        
        }
        navBar.snp.makeConstraints{make in
            make.width.equalTo(400)
            make.height.equalTo(100)
            make.topMargin.equalTo(20)
          
        }
        navIconCalendar.snp.makeConstraints{make in
            make.width.equalTo(30)
            make.top.equalTo(navText.snp.top)
            make.leading.equalToSuperview().offset(20)
            make.height.equalTo(30)
        }
        navText.snp.makeConstraints{make in
//            make.right.equalTo(navIconCalendar.snp.left).offset(235)
//            make.topMargin.equalTo(15)
            make.centerX.equalToSuperview().offset(-10)
        
        }
        navIconSearch.snp.makeConstraints{make in
            make.width.equalTo(30)
            make.height.equalTo(30)
            make.top.equalTo(navText.snp.top)
            make.trailing.equalToSuperview().offset(-40)
//            make.right.equalTo(navText.snp.left).offset(20)
//            make.topMargin.equalTo(15)
        }
        navText1.snp.makeConstraints{ make in
            make.centerX.equalToSuperview().offset(-10)
            make.topMargin.equalTo(35)
        
        }
        navView.snp.makeConstraints { make in
                  make.width.equalToSuperview().multipliedBy(1)
                  make.height.equalToSuperview().multipliedBy(0.05)
                  make.top.equalTo(110)
              }

              navButton1.snp.makeConstraints { make in
                  make.centerX.equalToSuperview().offset(-130)
                  make.centerY.equalToSuperview()
              }
              todayView.snp.makeConstraints { make in
                  make.centerX.centerY.equalToSuperview()
                  make.height.equalTo(30)
                  make.width.equalTo(100)
              }
              navButton2.snp.makeConstraints { make in
                  make.centerX.equalToSuperview()
                  make.centerY.equalToSuperview()
              }
              navButton3.snp.makeConstraints { make in
                  make.centerX.equalToSuperview().offset(130)
                  make.centerY.equalToSuperview()
              }
    }
}

