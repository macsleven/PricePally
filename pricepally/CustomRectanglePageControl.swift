import UIKit

class CustomRectanglePageControl: UIPageControl {
    
    var rectangleSize = CGSize(width: 12, height: 2)
    var rectangleSpacing: CGFloat = 10
    
    override func layoutSubviews() {
        super.layoutSubviews()
        createRectangles()
    }
    
    private func createRectangles4() {
        if !self.subviews.isEmpty {
            for i in self.subviews {
                willRemoveSubview(i)
            }
        }
        for i in 0..<numberOfPages {
            let currentWidth = i == currentPage ? 18 : rectangleSize.width
            let rectangle = UIButton()
            let x = CGFloat(i) * (rectangleSize.width + rectangleSpacing)
            
            rectangle.layer.cornerRadius = 24
            rectangle.layer.masksToBounds = true
            rectangle.tag = i
            if i == currentPage {
                rectangle.frame = CGRect(x: x, y: 0, width: currentWidth, height: rectangleSize.height)
                rectangle.backgroundColor = UIColor(red: 0.98, green: 0.722, blue: 0.078, alpha: 1)
            } else {
                rectangle.frame = CGRect(x: x, y: 0, width: currentWidth, height: rectangleSize.height)
                rectangle.backgroundColor = UIColor(red: 0.878, green: 0.878, blue: 0.878, alpha: 1)
            }
             self.addSubview(rectangle)
        }
    }
    
    func createRectangles() {
        subviews.forEach { $0.removeFromSuperview() }

        for i in 0..<numberOfPages {
            let currentWidth = i == currentPage ? 18 : rectangleSize.width
            let rectangle = UIButton(frame: CGRect(x: CGFloat(i) * (rectangleSize.width + rectangleSpacing), y: 0, width: rectangleSize.width, height: rectangleSize.height))
            rectangle.backgroundColor = i == currentPage ? UIColor.white : UIColor.lightGray
            rectangle.layer.cornerRadius = rectangleSize.height / 2
            rectangle.tag = i
            
            if i == currentPage {
                // Set the size of the current page rectangle to be larger
                rectangle.frame.size = CGSize(width: currentWidth, height: rectangleSize.height * 2)
                rectangle.backgroundColor = UIColor(red: 0.98, green: 0.722, blue: 0.078, alpha: 1)
            } else {
                rectangle.frame.size = CGSize(width: currentWidth, height: rectangleSize.height * 2)
                rectangle.backgroundColor = UIColor(red: 0.878, green: 0.878, blue: 0.878, alpha: 1)
            }
            
            addSubview(rectangle)
        }
    }

    override var currentPage: Int {
        didSet {
            createRectangles()
        }
    }
    
    override var numberOfPages: Int {
        didSet {
            createRectangles()
        }
    }
    
    override var hidesForSinglePage: Bool {
        get {
            return true
        }
        set {
            super.hidesForSinglePage = true
        }
    }
    
    override var intrinsicContentSize: CGSize {
        let width = CGFloat(numberOfPages - 1) * rectangleSize.width + CGFloat(numberOfPages - 1) * rectangleSpacing + 18
        let height = rectangleSize.height
        return CGSize(width: width, height: height)
    }
}
