//
//  ViewController.swift
//  iOSBA
//
//  Created by Oswaldo Ferral on 18/07/23.
//

import UIKit

class MovieViewController: UIViewController {

    @IBOutlet weak var MovieTable: UITableView!
    
    let viewModel = MovieTableViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "TVshows"
        
        MovieTable.dataSource = self
        
        MovieTable.delegate = self
        
        configureTable()
        
    }


}

// MARK: - SETUP

extension MovieViewController{
    
    
    func observableMovieList(){
        
        
        
    }
    
    
    func configureTable() {
        
        let nib = UINib(nibName: "ShowsTableViewCell", bundle: nil)
        MovieTable.register(nib, forCellReuseIdentifier: ShowsTableViewCell.identifier)
        
    }
    
}

// MARK: - DATASOURCE

extension MovieViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 16
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ShowsTableViewCell.identifier, for: indexPath) as? ShowsTableViewCell else { return UITableViewCell()}
        
        return cell
        
        
    }
    
}


// MARK: -DELEGATE

extension MovieViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
}

