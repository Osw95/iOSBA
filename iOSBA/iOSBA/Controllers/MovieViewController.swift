//
//  ViewController.swift
//  iOSBA
//
//  Created by Oswaldo Ferral on 18/07/23.
//

import UIKit


class MovieViewController: UIViewController {
    
    // MARK: -IBOUTLET

    @IBOutlet weak var MovieTable: UITableView!
    
    // MARK: -VARIABLES
    
    let viewModel = MovieTableViewModel()
    
    var refresh = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.delegate = self
        
        title = "TVshows"
        
        MovieTable.dataSource = self
        
        MovieTable.delegate = self
        
        viewModel.getMovies()
        
        configureTable()
        
        observableMovieList()
        
        
        
    }


}

// MARK: - SETUP

extension MovieViewController{
    
    
    func observableMovieList(){
        
        viewModel.tvShows.bind { [weak self] _ in
            DispatchQueue.main.async {
                self?.MovieTable.reloadData()
            }
        }
        
    }
    
    
    func configureTable() {
        
        refresh.addTarget(self, action: #selector(pullToRefresh), for: UIControl.Event.valueChanged)
        
        MovieTable.addSubview(refresh)
        
        let nib = UINib(nibName: "ShowsTableViewCell", bundle: nil)
        MovieTable.register(nib, forCellReuseIdentifier: ShowsTableViewCell.identifier)
        
    }
    
    @objc func pullToRefresh(send: UIRefreshControl){
        
        viewModel.getMovies()
        
        DispatchQueue.main.async {
            
            self.refresh.endRefreshing()
            
        }
        
    }
    
}

// MARK: - DATASOURCE

extension MovieViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.tvShows.value?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ShowsTableViewCell.identifier, for: indexPath) as? ShowsTableViewCell else {
            
            return UITableViewCell()
            
        }
        
        cell.setupConfig(viewModel.tvShows.value?[indexPath.row])
            
        return cell
        
    }
    
}


// MARK: -DELEGATE

extension MovieViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
}

extension MovieViewController: alertProtocol{
    
    func alertMsg(_ title:String ,_ msg: String) {
        
        let alertController = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
            self.viewModel.getMovies()
        }
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel) { (_) in
            
        }
        
        alertController.addAction(cancelAction)
        
        alertController.addAction(okAction)
        
        self.present(alertController, animated: true, completion: nil)
        
    }
    
}

