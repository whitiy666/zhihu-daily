import Foundation

// MARK: - BannerModel
class BannerModel: Codable {
    let date: String
    let stories, topStories: [Story]

    enum CodingKeys: String, CodingKey {
        case date, stories
        case topStories = "top_stories"
    }

    init(date: String, stories: [Story], topStories: [Story]) {
        self.date = date
        self.stories = stories
        self.topStories = topStories
    }
}

// MARK: - Story
class Story: Codable {
    let imageHue, title: String
    let url: String
    let hint, gaPrefix: String
    let images: [String]?
    let type, id: Int
    let image: String?

    enum CodingKeys: String, CodingKey {
        case imageHue = "image_hue"
        case title, url, hint
        case gaPrefix = "ga_prefix"
        case images, type, id, image
    }

    init(imageHue: String, title: String, url: String, hint: String, gaPrefix: String, images: [String]?, type: Int, id: Int, image: String?) {
        self.imageHue = imageHue
        self.title = title
        self.url = url
        self.hint = hint
        self.gaPrefix = gaPrefix
        self.images = images
        self.type = type
        self.id = id
        self.image = image
    }
}
