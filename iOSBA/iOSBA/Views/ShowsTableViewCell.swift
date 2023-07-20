//
//  TableViewCell.swift
//  iOSBA
//
//  Created by Oswaldo Ferral on 18/07/23.
//

import UIKit

final class ShowsTableViewCell: UITableViewCell {
    
    // MARK: - IDENTIFIER
    
    static let identifier = String(describing: ShowsTableViewCell.self)
    
    // MARK: - IBOUTLETS
    
    @IBOutlet weak var imageCell: UIImageView!
    
    @IBOutlet weak var labelCell: UILabel!
    
    
    // MARK: -VARIABLES
    
    let imageCache = NSCache<AnyObject, AnyObject>()
    
    var task:URLSessionDataTask!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        accessoryType = .disclosureIndicator
    }

}

extension ShowsTableViewCell{
    
    func setupConfig(_ dataShow: tvshow?){
        
        labelCell.text = dataShow?.show.name
                
        guard let urlText = dataShow?.show.image?.medium else { return }
                
        guard let url = URL(string: urlText) else { return }
        
        imageCell.image = nil
        
        if let task = task {
            task.cancel()
        }
        
        if let imageFromCache = imageCache.object(forKey: url.absoluteString as AnyObject) as? UIImage {
            
            self.imageCell.image = imageFromCache
            
        }else{
            
            task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                
                guard
                    let data = data,
                    let newImage = UIImage(data: data)
                else {
                    
                    #if DEBUG
                    
                        print("No se puedo cargar la imagen")
                    
                    #endif
                    
                    return
                    
                }
                
                self.imageCache.setObject(newImage, forKey: url.absoluteString as AnyObject)
                
                DispatchQueue.main.async {
                    self.imageCell.image = newImage
                }
                
            }
            
        }

        task.resume()
                
    }
    
}
