import UIKit
import SDWebImage

class BannerCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "BannerCollectionViewCell"
        
    //MARK: init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imgView)
        contentView.addSubview(titleLab)
        contentView.addSubview(contentLab)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        imgView.frame.size = layoutAttributes.size
        contentLab.frame = CGRect(x: 10, y: layoutAttributes.size.height - 30, width: layoutAttributes.size.width, height: 20)
    }
    
    
    var title: String? {
        get { titleLab.text }
        set {
            titleLab.text = newValue
            layTitleLab()
            func layTitleLab() {
                titleLab.frame.size.width = contentView.frame.size.width - 20;
                titleLab.sizeToFit()
                titleLab.frame.origin = CGPoint(x: 10, y: contentLab.frame.origin.y - titleLab.frame.height - 10)
            }
        }
    }
    
    var content: String? {
        get { contentLab.text }
        set { contentLab.text = newValue }
    }
    
    func image(url: String) {
        imgView.sd_setImage(with: URL(string: url))
    }
    
  
    
    private lazy var imgView = UIImageView()
    
    private lazy var titleLab: UILabel = {
        let lab = UILabel()
        lab.font = UIFont.boldSystemFont(ofSize: 23)
        lab.textColor = .white
        lab.numberOfLines = 0
        return lab
    }()
    
    private lazy var contentLab: UILabel = {
        let lab = UILabel()
        lab.font = UIFont.systemFont(ofSize: 14)
        lab.textColor = .init(white: 0.6, alpha: 0.8)
        return lab
    }()
}
