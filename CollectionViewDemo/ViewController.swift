//
//  ViewController.swift
//  CollectionViewDemo
//
//  Created by Mahesh Prasad on 22/10/19.
//  Copyright © 2019 Create Apps. All rights reserved.
//

import UIKit

struct Item {
    var imageName: String
}

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var item: [Item] = [Item(imageName: "1"),
                        Item(imageName: "2"),
                        Item(imageName: "3"),
                        Item(imageName: "4"),
                        Item(imageName: "5"),
                        Item(imageName: "6"),
                        Item(imageName: "7"),
                        Item(imageName: "8"),
                        Item(imageName: "9"),
                        Item(imageName: "10"),
                        Item(imageName: "11"),
                        Item(imageName: "12"),
                        Item(imageName: "13"),
                        Item(imageName: "14"),
                        Item(imageName: "15"),
                        Item(imageName: "16"),
                        Item(imageName: "17"),
                        Item(imageName: "18"),
                        Item(imageName: "19"),
    ]
    var collectionViewFlowLayout: UICollectionViewFlowLayout!
    let cellIdentifier = "CollectionViewItemCell"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupCollectionView()
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let nib = UINib(nibName: "CollectionViewItemCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: cellIdentifier)
    }
    
    private func setupCollectionViewItemSize() {
        if collectionViewFlowLayout == nil {
            let numberOfItemPerRow: CGFloat = 2
            let lineSpacing: CGFloat = 5
            let interItemSpacing: CGFloat = 5
            
            let width = (collectionView.frame.width - (numberOfItemPerRow - 1) * interItemSpacing) / numberOfItemPerRow
            let height = width
            
            collectionViewFlowLayout.itemSize = CGSize(width: width, height: height)
            collectionViewFlowLayout.sectionInset = UIEdgeInsets.zero
            collectionViewFlowLayout.scrollDirection = .vertical
            collectionViewFlowLayout.minimumLineSpacing = lineSpacing
            collectionViewFlowLayout.minimumInteritemSpacing = interItemSpacing
            
            collectionView.setCollectionViewLayout(collectionViewFlowLayout, animated: true)
        }
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return item.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! CollectionViewItemCell
        
        cell.imageView.image = UIImage(named: item[indexPath.item].imageName)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("didSelectItem: \(indexPath)")
    }
}
