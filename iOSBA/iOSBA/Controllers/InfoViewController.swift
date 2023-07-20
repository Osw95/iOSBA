//
//  InfoViewController.swift
//  iOSBA
//
//  Created by Oswaldo Ferral Mejia on 19/07/23.
//

import UIKit

class InfoViewController: UIViewController {
    
    // MARK: -IBOUTLET

    @IBOutlet weak var scrollInfoView: UIScrollView!
    
    @IBOutlet weak var StackInfoView: UIStackView!
    
    // MARK: -VARIABLES
    
    var infoData: infoDetail?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
    }

}

extension InfoViewController{
    
    func setupView () {
        
        print(infoData?.name ?? "Default")
        
        title = infoData?.name ?? "N/F"
                
        let CustomImage = CustomImageView()
        
        guard let ImageUrl = infoData?.image else { return }
        
        CustomImage.loadImage(from: URL(string: ImageUrl)!)
        
        
       let constraints = [
            CustomImage.heightAnchor.constraint(equalToConstant: 480),
        ]
        
        NSLayoutConstraint.activate(constraints)
        
        CustomImage.contentMode = .scaleAspectFill
        
        StackInfoView.addArrangedSubview(CustomImage)
        
        if let iv = InfoView.instanceFromNib(infoData) as? InfoView {
            
            StackInfoView.addArrangedSubview(iv)
            
        }

        
    }
    
}
