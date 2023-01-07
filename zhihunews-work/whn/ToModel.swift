import UIKit
import Alamofire
import SwiftyJSON

class PartModel: NSObject {
    enum responseType {
        case banner
        case table
    }
    
    var date: String
    var stories: Array <ZhiHuStory> = []
    init(date: String) {
        self.date = date
    }
    static func reqest(latest: @escaping((model: PartModel, type: responseType))->Void, failure: @escaping(Error)->Void) {
        AF.request("https://news-at.zhihu.com/api/3/news/latest").response { entry in
            let data = try! JSON(data: entry.data!).rawValue as! Dictionary <String, Any>
            debugPrint(data)
            
            let bannerModel = PartModel(date: data["date"] as! String)
            for entry in data["top_stories"] as! Array<Dictionary<String,Any>> {
                var headStory = ZhiHuStory(title: entry["title"] as! String,
                                       hint: entry["hint"] as! String,
                                       image: entry["image"] as! String,
                                       url: entry["url"] as! String,
                                       id: entry["id"] as! Int)
                headStory.gaPrefix = entry["ga_prefix"] as? String
                headStory.imgHue = entry["image_hue"] as? String
                bannerModel.stories.append(headStory)
            }
            latest((bannerModel, .banner))
            
            let storyModel = PartModel(date: data["date"] as! String)
            for entry in data["stories"] as! Array<Dictionary<String,Any>> {
                var headStory = ZhiHuStory(title: entry["title"] as! String,
                                       hint: entry["hint"] as! String,
                                       image: (entry["images"] as! Array)[0],
                                       url: entry["url"] as! String,
                                       id: entry["id"] as! Int)
                headStory.gaPrefix = entry["ga_prefix"] as? String
                headStory.type = entry["type"] as! Int
                storyModel.stories.append(headStory)
            }
            latest((storyModel, .table))
        }
    }
}

