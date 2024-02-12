import UIKit

struct SneakersModel {
    var image: UIImage
    var title: String
    var price: Int
    var url: String
    
    static func mockData() -> [SneakersModel] {
        return [
            SneakersModel(
                image: .coast,
                title: "Nike Dunk Low \"Coast\"",
                price: 22_935,
                url: "https://poizon.shoes/nike/tproduct/631364411-870900287651-nike-dunk-low-coast"
            ),
            SneakersModel(
                image: .orange,
                title: "Nike Dunk High Retro \"Orange Blaze\" 2021",
                price: 18_735,
                url: "https://poizon.shoes/nike/tproduct/631364411-343445491521-nike-dunk-high-retro-orange-blaze-2021"
            ),
            SneakersModel(
                image: .splash,
                title: "Nike Dunk Low SE \"Splash\"",
                price: 13_935,
                url: "https://poizon.shoes/nike/tproduct/631364411-972983477311-nike-dunk-low-se-splash-fj4610-702"
            ),
            SneakersModel(
                image: .lakers,
                title: "Nike Dunk High \"Lakers\"",
                price: 19_635,
                url: "https://poizon.shoes/nike/tproduct/631364411-791649332331-nike-dunk-high-lakers-dd1399-500"
            )
        ]
    }
}
