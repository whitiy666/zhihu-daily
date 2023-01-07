import Foundation

struct ZhiHuStory {
    var title: String
    var gaPrefix: String?
    var image: String
    var type: Int = 0
    var hint: String
    var url: String
    var imgHue: String?
    var id: Int
    init(title: String, hint: String, image: String, url: String, id: Int) {
        self.title = title
        self.hint = hint
        self.image = image
        self.url = url
        self.id = id
    }
}
