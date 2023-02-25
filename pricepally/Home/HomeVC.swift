//
//  ViewController.swift
//  pricepally
//
//  Created by Suleiman Abubakar on 21/02/2023.
//

import UIKit

class HomeVC: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var horizontallyScrollableStackView: UIStackView!
    @IBOutlet weak var dashBoardScrollView: UIScrollView!
    @IBOutlet weak var parentScrollView: UIScrollView!
    @IBOutlet weak var dashBoardPgCtrl: CustomRectanglePageControl!
    @IBOutlet weak var FeatureProductCollection: UICollectionView!

    var activityView = UIActivityIndicatorView()
    var apiService: APIServiceProtocol = APIService()
    var featureProducts: [Product] = [Product]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setupTopSlide()
        self.setupFeatureProducts()
        dashBoardPgCtrl.numberOfPages = 3
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.loadProducts()
        self.showActivityIndicatory()
    }
    
    func showActivityIndicatory() {
        activityView = UIActivityIndicatorView(style: .medium)
        activityView.color = .black
        activityView.center = self.view.center
        self.view.addSubview(activityView)
    }

    @objc
    func loadProducts() {
        DispatchQueue.main.async {
            self.featureProducts.removeAll()
            self.activityView.startAnimating()
        }
        DispatchQueue.global().async {
            self.apiService.getProducts { response, error in
                if error != nil {
                    DispatchQueue.main.async {
                        self.activityView.stopAnimating()
                        self.FeatureProductCollection.reloadData()
                    }
                    return
                }
                if let res = response {
            
                    DispatchQueue.main.async {
                        self.activityView.stopAnimating()
                        self.featureProducts.append(contentsOf: res.products)
                        self.FeatureProductCollection.reloadData()
                    }
                }
            }
        }
        
    }
    
    func setupTopSlide() {
        for _ in 0...2 {
            if let slideView = Bundle.main.loadNibNamed("SlideView", owner: nil, options: nil)!.first as? SlideView {
                slideView.translatesAutoresizingMaskIntoConstraints = false
                slideView.widthAnchor.constraint(equalToConstant: self.view.frame.width * 0.8).isActive = true
                slideView.heightAnchor.constraint(equalToConstant: horizontallyScrollableStackView.frame.height).isActive = true
                horizontallyScrollableStackView.addArrangedSubview(slideView)
            }
        }
        dashBoardScrollView.delegate = self
    }
    
    func setupFeatureProducts() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionViewFrameSize = FeatureProductCollection.frame.size

        var cellWidth: CGFloat?
        cellWidth = collectionViewFrameSize.width / 1.7
        var size: CGSize?
        if cellWidth != nil {
            size = CGSize(width: (cellWidth ?? CGFloat()) - 8, height: 300)
        }
        layout.itemSize = size ?? CGSize()
        
        FeatureProductCollection.collectionViewLayout = layout
        FeatureProductCollection.dataSource = self
        FeatureProductCollection.delegate = self
        FeatureProductCollection.register(UINib(nibName: "ProductSlide", bundle: nil), forCellWithReuseIdentifier: "productSlide")
    }
    
    @IBAction func pageCtrlClick(_ sender: Any) {
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        switch scrollView {
        case dashBoardScrollView:
            let page = round(dashBoardScrollView.contentOffset.x / scrollView.frame.width)
            dashBoardPgCtrl.currentPage = Int(page)
        default: break
        }
    }

}

extension HomeVC: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return featureProducts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productSlide", for: indexPath) as? ProductSlide else {return UICollectionViewCell() }
        let product = self.featureProducts[indexPath.row]
    
        cell.configure(with: product)
        
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}
