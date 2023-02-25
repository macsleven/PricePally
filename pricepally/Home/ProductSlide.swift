//
//  SlideView.swift
//  pricepally
//
//  Created by Suleiman Abubakar on 21/02/2023.
//

import UIKit
import Alamofire

class ProductSlide: UICollectionViewCell {

    @IBOutlet weak var featureImage: UIImageView!
    
    @IBOutlet weak var selectOtherType: UIButton!
    
    @IBOutlet weak var productCurrentPrice: UILabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var oldPriceTxt: UILabel!
    open override func awakeFromNib() {
        super.awakeFromNib()
        selectOtherType.layer.borderColor = UIColor(red: 0.702, green: 0.337, blue: 0.106, alpha: 1).cgColor
        selectOtherType.layer.borderWidth = 1
        selectOtherType.layer.cornerRadius = 4
    }
    
    func configure(with product: Product) {
       
        let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: product.productPrice)
        let braceString: NSMutableAttributedString = NSMutableAttributedString(string: "(")
        let braceCloseString: NSMutableAttributedString = NSMutableAttributedString(string: ")")
                attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSRange(location: 0, length: attributeString.length))
            attributeString.append(braceCloseString)
            braceString.append(attributeString)
        self.oldPriceTxt.attributedText = braceString
        self.productName.text = product.productName
        self.productCurrentPrice.text = product.productPrice
        if let imageURL = URL(string: product.productImages) {
            AF.download(imageURL).responseData { response in
                switch response.result {
                case .success(let data):
                    DispatchQueue.main.async {
                        self.featureImage.image = UIImage(data: data)
                    }
                case .failure(let error):
                    print("Error downloading image: \(error)")
                }
            }
        } else {
            print("Invalid image URL:")
        }
    }
}
