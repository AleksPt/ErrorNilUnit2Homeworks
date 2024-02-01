import UIKit

struct OnboardingModel {
    var image: UIImage
    var title: String
    
    static func mockData() -> [OnboardingModel] {
        return [
            OnboardingModel(
                image: ._8,
                title: "Все билеты\nи посадочные талоны\nв одном приложении"
            ),
            OnboardingModel(
                image: ._2,
                title: "Регистрируйтесь\nна рейс онлайн,\nбез очередей"
            ),
            OnboardingModel(
                image: ._7,
                title: "Мгновенные\nуведомления\nоб изменениях рейса"
            ),
            OnboardingModel(
                image: ._5,
                title: "Приветственные\n700 миль уже\nна вашем счету"
            )
        ]
    }
}
