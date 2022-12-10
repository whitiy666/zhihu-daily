//
//  HomeViewController.swift
//  zhihunews-work
//
//  Created by 白鑫 on 2022/12/10.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.view.addSubview(Bar)

        
    }
    
    lazy var Bar:UINavigationBar = {
        let Bar = UINavigationBar(frame: CGRect(x: 0, y: 50, width: self.view.bounds.width, height: 50))
        Bar.barTintColor = .white
        Bar.pushItem(onMakeNavitem(), animated: true)
        
        return Bar
    }()
    
    lazy var barLeft:UIBarButtonItem = {
        
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
            partTopText.text = "10"
            partTopText.font = UIFont.systemFont(ofSize: 20)
            return partTopText
        }()
        
        lazy var partFootText:UILabel = {
            let partFootText = UILabel(frame: CGRectMake(10, 20, 50, 20))
            partFootText.text = "十二月"
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
        
    
  
    
    
}
