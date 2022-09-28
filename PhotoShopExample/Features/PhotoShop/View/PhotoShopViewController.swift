//
//  PhotoShopViewController.swift
//  PhotoShopExample
//
//  Created by Nesrin Bozan on 26.09.2022.
//

import UIKit
import SnapKit

protocol PhotoShopOutPut{
    func changeLoading(isLoad: Bool)
    func saveDatas(values: [Photo])
}

final class PhotoShopViewController: UIViewController { // Farklı  bir yerde türetilme işlemi olmayacağı için final tanımlandı, performanstan kazanıldı.
    
    private let labelTitle: UILabel = UILabel()
    private let tableView: UITableView = UITableView()
    private let indicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    private lazy var photos: [Photo] = []
    lazy var viewModel: IPhotoShopViewModel = PhotoShopViewModel()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        viewModel.setDelegate(output: self)
        viewModel.fetchItems()
        

    }
    private func configure(){
        view.addSubview(labelTitle)
        view.addSubview(tableView)
        view.addSubview(indicator)
        drawDesign()
        makeTableView()
        makeLabel()
        makeIndicator()
        
     
        
        
        
    }
    private  func drawDesign(){
        tableView.delegate = self
        tableView.dataSource = self

        DispatchQueue.main.async { // UI değiştirme için Main Queue yapmak daha avantajlı
            self.view.backgroundColor = .white
            self.labelTitle.font = .boldSystemFont(ofSize: 25)
            self.labelTitle.text = "PhotoShop"
            self.labelTitle.textColor = .magenta
            self.indicator.color = .red
        }
        indicator.startAnimating()
    }

  

}

extension PhotoShopViewController: PhotoShopOutPut{
    func changeLoading(isLoad: Bool) {
        isLoad ? indicator.startAnimating() : indicator.stopAnimating()
    }
    func saveDatas(values: [Photo]) {
       photos = values
        tableView.reloadData()
    }
    
}

extension PhotoShopViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = photos[indexPath.row].title ?? ""
        return cell
    }
    
    
}


extension PhotoShopViewController{
    
   private func makeTableView(){
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(labelTitle.snp.bottom ).offset(5)
            make.bottom.equalToSuperview()
            make.left.right.equalTo(labelTitle)
            
        }
        
    }
  private  func makeLabel(){
        labelTitle.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.left.equalTo(view).offset(10)
            make.right.equalTo(view).offset(-10)
            make.height.greaterThanOrEqualTo(10)
        }
    }
    
  private  func makeIndicator(){
        indicator.snp.makeConstraints { (make) in
            make.height.equalTo(labelTitle)
            make.right.equalTo(labelTitle).offset(-5)
            make.top.equalTo(labelTitle)
        }
    }
}
