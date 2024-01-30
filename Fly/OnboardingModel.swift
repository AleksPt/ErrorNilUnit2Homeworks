import Foundation
import UIKit

struct OnboardingModel {
    var image: UIImage
    var title: String
    
    static func mockData() -> [OnboardingModel] {
        return [
            OnboardingModel(
                image: ._1,
                title: "Все билеты и посадочные талоны в одном приложении"
            ),
            OnboardingModel(
                image: ._2,
                title: "Регистрируйтесь на борт онлайн, без очередей"
            ),
            OnboardingModel(
                image: ._3,
                title: "Мгновенные уведомления об изменениях рейса"
            ),
            OnboardingModel(
                image: ._4,
                title: "Приветственные 700 миль уже на вашем счету"
            )
        ]
    }
}
