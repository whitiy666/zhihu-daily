

import UIKit

class HomeViewController: UIViewController {
   
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(Bar)
        self.view.addSubview(collectionView)

        request()
    }
    
    
    
    
   // ⚠️：appbar部分
    
    lazy var Bar:UINavigationBar = {
        let Bar = UINavigationBar(frame: CGRect(x: 0, y: 50, width: self.view.bounds.width, height: 50))
        Bar.barTintColor = .white
        Bar.pushItem(onMakeNavitem(), animated: true)
        
        return Bar
    }()
    
    private func request() {
        PartModel.reqest { entry in
            if entry.type == .banner {
                self.bannerMake = BannerMake(model: entry.model)
                self.collectionView.delegate = self.bannerMake
                self.collectionView.dataSource = self.bannerMake
                self.collectionView.reloadData()
            }
            
        } failure: { error in
            
        }

    }
    
    
    lazy var barLeft:UIBarButtonItem = {
        
        let calendar:Calendar = Calendar.current;
        let date = Date();
        let day = calendar.component(.day, from: date);
        let dayStr = String(day)
        let month = calendar.component(.month, from: date)
        var monthStr = "";
        switch month{
        case 1:monthStr = "一月"
            break
        case 2:monthStr = "二月"
            break
        case 3:monthStr = "三月"
            break
        case 4:monthStr = "四月"
            break
        case 5:monthStr = "五月"
            break
        case 6:monthStr = "六月"
            break
        case 7:monthStr = "七月"
            break
        case 8:monthStr = "八月"
            break
        case 9:monthStr = "9月"
            break
        case 10:monthStr = "十月"
            break
        case 11:monthStr = "十一月"
            break
        case 12:monthStr = "十二月"
            break
        default:
            monthStr = "异常月份"
            break
        }
       //低情商：简单粗暴
        //高情商：朴实，简明扼要✅
        
        
        
        
        
        
        lazy var part:UIView = {
            let part = UIView(frame: CGRectMake(0, 0, 170, 40))
            part.addSubview(partTopText)
            part.addSubview(partFootText)
            part.addSubview(partRight)
            part.addSubview(partRightText)
            //part.backgroundColor = .red
            return part
        }()
        
        lazy var partRight:UIView = {
            let partRight = UIView(frame: CGRectMake(50, 5, 2, 30))
            
            partRight.backgroundColor = .gray
            return partRight
        }()
        
        lazy var partRightText:UILabel = {
            let partRightText = UILabel(frame: CGRectMake(65, 0, 90, 40))
            partRightText.text = "知乎日报"
            partRightText.font = UIFont.systemFont(ofSize: 23)
            partRightText.font = UIFont.boldSystemFont(ofSize: 20)
            return partRightText
        }()
        
        lazy var partTopText:UILabel = {
            let partTopText = UILabel(frame: CGRectMake(15, 0, 30, 25))
            partTopText.text = dayStr
            partTopText.font = UIFont.systemFont(ofSize: 20)
            return partTopText
        }()
        
        lazy var partFootText:UILabel = {
            let partFootText = UILabel(frame: CGRectMake(10, 20, 50, 20))
            partFootText.text = monthStr
            partFootText.font = UIFont.systemFont(ofSize: 10)
            return partFootText
        }()
        
        let barLeft = UIBarButtonItem()
       // barLeft.width = 30
        barLeft.customView = part
        return barLeft
        
    }()
    
    
    lazy var partRight:UIBarButtonItem = {
        
        lazy var part:UIView={
            let part = UIView(frame: CGRectMake(0, 0, 40, 40))
            part.addSubview(imageView)
            
            return part
        }()
        
       
        
        lazy var imageView:UIImageView = {
        
            let imageView = UIImageView(frame: CGRectMake(0, 5, 30, 30))
            imageView.image = UIImage(named: "icon")
            imageView.layer.cornerRadius = imageView.frame.size.width/2
            imageView.layer.masksToBounds = true
            return imageView
        }()
        
        let partRight = UIBarButtonItem()
        partRight.customView = part
        
        return partRight
        
        
    }()
    
    
    
    
    
    func onMakeNavitem()->UINavigationItem{
            
            let navigationitem = UINavigationItem()
            
            navigationitem.title = ""
        
            navigationitem.setLeftBarButton(barLeft, animated: true)
            navigationitem.setRightBarButton(partRight, animated: true)
            return navigationitem
        }
        
    
    
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let collecionView = UICollectionView(frame: CGRect(x: 0, y: 100, width: self.view.frame.width, height: self.view.frame.width), collectionViewLayout: layout)
        collecionView.register(BannerCollectionViewCell.self, forCellWithReuseIdentifier: BannerCollectionViewCell.identifier)
        collecionView.isPagingEnabled = true
        return collecionView
    }()
    
    private var bannerMake: BannerMake!
    
    
    
  
    
    
}
