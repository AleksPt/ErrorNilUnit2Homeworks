import UIKit

struct OffersModel {
    var image: UIImage
    var toCity: String
    var fromCity: String
    var price: Int
    
    static func mockData() -> [OffersModel] {
        return [
            OffersModel.init(
                image: .dubai,
                toCity: "Дубай",
                fromCity: "из Москвы",
                price: 4855
            ),
            OffersModel.init(
                image: .rome,
                toCity: "Рим",
                fromCity: "из Санкт-Петербурга",
                price: 8460
            ),
            OffersModel.init(
                image: .kyoto,
                toCity: "Киото",
                fromCity: "из Москвы",
                price: 6235
            ),
            OffersModel.init(
                image: .hurghada,
                toCity: "Хургада",
                fromCity: "из Новосибирска",
                price: 10490
            ),
            OffersModel.init(
                image: .maldives,
                toCity: "Мальдивы",
                fromCity: "из Москвы",
                price: 15365
            ),
        ]
    }
}
