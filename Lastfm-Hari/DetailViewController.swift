//
//  DetailViewController.swift
//  Lastfm-Hari
//
//  Created by Hari Prasath on 08/03/2020.
//  Copyright © 2020 Hari Prasath. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var imgView: UIImageView?
    @IBOutlet weak var name: UILabel?
    @IBOutlet weak var artist: UILabel?
    @IBOutlet weak var mbid: UILabel?
    @IBOutlet weak var url: UILabel?
    var currentItem: playItems?
    
    override func viewDidLoad() {
        if currentItem != nil
        {
            guard let imageUrl = URL(string: currentItem?.imageLarge() ?? "") else { return}
            UrlConnection.fetchData(url: imageUrl, completionHandler: { data in
                self.imgView?.image = UIImage(data: data)
            })
            name?.text = currentItem?.name
            artist?.text = currentItem?.artist
            mbid?.text = currentItem?.mbid
            url?.text = currentItem?.url
        }
    }
    
    @IBAction func backClicked()
    {
        self.dismiss(animated: true, completion: nil)
    }
}
