//
//  FavoritesViewController.swift
//  iOSBA
//
//  Created by Oswaldo Ferral on 18/07/23.
//

import UIKit

class FavoritesViewController: UIViewController {
    
    //MARK: -IBOUTLETS
    
    @IBOutlet weak var FavoriteTable: UITableView!
    
    // MARK: -VARIABLES
    
    let viewModel = FavoriteTableViewModel()
    
    var refresh = UIRefreshControl()
    
    // MARK: CONTROLLER LIFECICLE

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTable()
        
        observableFavoriteList()
        
        viewModel.getDataCoreData()
        
        FavoriteTable.dataSource = self
        
        FavoriteTable.delegate = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        
        viewModel.getDataCoreData()
        
    }
    

}

// MARK: - SETUP

extension FavoritesViewController{
    
    func observableFavoriteList () {
        
        viewModel.tvShowFavorites.bind { [weak self] _ in
            DispatchQueue.main.async {
                self?.FavoriteTable.reloadData()
            }
        }
        
    }
    
    func configureTable(){
        
        refresh.addTarget(self, action: #selector(pullToRefresh), for: UIControl.Event.valueChanged)
        
        FavoriteTable.addSubview(refresh)
        
        let nib = UINib(nibName: "ShowsTableViewCell", bundle: nil)
        
        FavoriteTable.register(nib, forCellReuseIdentifier: ShowsTableViewCell.identifier)
        
        title = "Favorites"
        
        navigationController?.navigationBar.tintColor = .white
    }
    
    @objc func pullToRefresh(send: UIRefreshControl){
        
        viewModel.getDataCoreData()
        
        DispatchQueue.main.async {
            
            self.refresh.endRefreshing()
            
        }
        
    }
    
    func loadDataCell(_ dataCell:Tvshow) -> dataForCell<Tvshow> {
        
        let resource = dataForCell<Tvshow>(name: dataCell.name, image: dataCell.imageMedium)
        
        return resource
    }
    
}

// MARK: - DATASOURCE

extension FavoritesViewController:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 85
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.tvShowFavorites.value?.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ShowsTableViewCell.identifier, for: indexPath) as? ShowsTableViewCell else {
            
            return UITableViewCell()
            
        }
        
        if let dataSend = viewModel.tvShowFavorites.value?[indexPath.row]{
            
            cell.setupConfig(loadDataCell(dataSend))
            
        }
        
       
            
        return cell
        
    }
    
    
}

// MARK: - DELEGATE

extension FavoritesViewController:UITableViewDelegate {
    

    
}
