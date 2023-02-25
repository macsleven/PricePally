//
//  CategoryViewController.swift
//  pricepally
//
//  Created by Suleiman Abubakar on 21/02/2023.
//

import UIKit

class CategoryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    var frameSize: CGSize!
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        categoryCollectionView.showsVerticalScrollIndicator = false
        let layout = UICollectionViewFlowLayout()
        categoryCollectionView.collectionViewLayout = layout
        categoryCollectionView.register(CategoryColtnsVCell.self, forCellWithReuseIdentifier: "cell")

    }
    
    override func viewWillLayoutSubviews() {
      super.viewWillLayoutSubviews()
      guard let flowLayout = categoryCollectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
      flowLayout.sectionInset = UIEdgeInsets(top: 16, left: 0, bottom: 0, right: 0)
      flowLayout.invalidateLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
        frameSize = view.frame.size
        self.categoryCollectionView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.categoryCollectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CategoryColtnsVCell else { return UICollectionViewCell() }
       
        cell.img.image = UIImage(named: "catRice")
        cell.name.text = "Food Stuff"
        return cell
    }
    
}

extension CategoryViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat { 15 }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat { 0 }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let collectionViewFrameSize = categoryCollectionView.frame.size

    var cellWidth: CGFloat?
    cellWidth = collectionViewFrameSize.width / 2
    var size: CGSize?
    if cellWidth != nil {
        size = CGSize(width: (cellWidth ?? CGFloat()) - 8, height: cellWidth ?? CGFloat())
    }
    return size ?? CGSize()
  }
}
