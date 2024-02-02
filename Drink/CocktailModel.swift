import UIKit

struct CocktailModel {
    var photo: UIImage
    var title: String
    var description: String
    var ingredients: [String: String]
    var recipe: String
    
    static func mockData() -> [CocktailModel] {
        return [
            CocktailModel(
                photo: .negroni,
                title: "Негрони",
                description: "Крепкий горький коктейль на основе джина с добавлением биттера и красного вермута. Идеален как в качестве аперитива, так и дижестива. Один из самых популярных коктейлей в мире, потрясающе вкусный и гармоничный.",
                ingredients: [
                    "Бурбон": "50 мл",
                    "Красный вермут": "25 мл",
                    "Ангостура биттер": "1 мл",
                    "Коктейльная вишня красная": "5 г",
                    "Лед в кубиках": "500 г",
                ],
                recipe: """
                        1) Налей в стакан для смешивания красный вермут 25 мл и бурбон 50 мл
                        2) Добавь ангостуру биттер 1 дэш
                        3) Наполни стакан кубиками льда и размешай коктейльной ложкой
                        4) Перелей через стрейнер в охлажденный коктейльный бокал
                        5) Укрась коктейльной вишней на шпажке
                        """
            ),
            CocktailModel(
                photo: .tequila,
                title: "Текила санрайз",
                description: "Слабоалкогольный цитрусовый лонг на основе текилы с добавлением гренадина и апельсинового сока. Простой, но очень вкусный и красивый: переходящий в оранжевый цвет красный гренадин действительно напоминает восходящее солнце.",
                ingredients: [
                    "Серебряная текила": "50 мл",
                    "Гренадин": "10 мл",
                    "Апельсиновый сок": "150 мл",
                    "Апельсин": "30 г",
                    "Лед в кубиках": "180 г",
                ],
                recipe: """
                        1) Наполни хайбол кубиками льда доверху
                        2) Налей гренадин 10 мл и серебряную текилу 50 мл
                        3) Долей апельсиновый сок доверху и аккуратно размешай коктейльной ложкой
                        4) Укрась кружком апельсина
                        """
            ),
            CocktailModel(
                photo: .cosmopolitan,
                title: "Космополитен",
                description: "Кисло-сладкий коктейль на основе цитрусовой водки с добавлением трипл-сека и клюквенного сока. О нём знает каждый, кто хоть раз видел \"Секс в большом городе\". В сериале его в основном пьют женщины, но на самом деле этот коктейль любят люди во всем мире вне зависимости от пола",
                ingredients: [
                    "Цитрусовая водка Царская": "40 мл",
                    "Трипл сек Fruko Schulz": "20 мл",
                    "Клюквенный сок": "50 мл",
                    "Лаймовый сок": "10 г",
                    "Апельсиновая цедра": "1 шт",
                    "Лед в кубиках": "200 г",
                ],
                recipe: """
                        1) Налей в шейкер лаймовый сок 10 мл, клюквенный сок 50 мл, ликер трипл сек 20 мл и цитрусовую водку 40 мл
                        2) Наполни шейкер кубиками льда и взбей
                        3) Перелей через стрейнер в охлажденный коктейльный бокал
                        4) Зажги над коктейлем горелку и выжми на нее масло из апельсиновой цедры
                        """
            ),
            CocktailModel(
                photo: .blueLag,
                title: "Голубая лагуна",
                description: "Cладкий освежающий лонг на водке с добавлением ликёра блю кюрасао,  который придаёт коктейлю нежный голубой оттенок. Есть легенда, что \"Голубую лагуну\" придумал художник Поль Гоген на Таити, но вряд ли он предложил бы добавлять в коктейль спрайт.",
                ingredients: [
                    "Водка Царская": "50 мл",
                    "Ликер блю кюрасао Fruko Schulz": "20 мл",
                    "Спрайт": "150 мл",
                    "Ананас": "30 г",
                    "Лед в кубиках": "200 г",
                ],
                recipe: """
                        1) Наполни харрикейн кубиками льда доверху
                        2) Налей ликер блю кюрасао 20 мл и водку 50 мл
                        3) Долей спрайт доверху и аккуратно размешай коктейльной ложкой
                        4) Укрась долькой ананаса
                        """
            ),
            CocktailModel(
                photo: .manhattan,
                title: "Манхэттен",
                description: "Классический коктейль на основе бурбона с добавлением красного вермута. На вкус \"Манхэттен\" сладковатый с травяными нотками, которые привносит вермут и капля ангостуры. Кстати, ходят слухи, что придумала его мать Уинстона Черчилля. Возможно, и сам Премьер любил пропустить бокальчик этого замечательного напитка",
                ingredients: [
                    "Бурбон": "50 мл",
                    "Красный вермут": "25 мл",
                    "Ангостура биттер": "1 мл",
                    "Коктейльная вишня красная": "5 г",
                    "Лед в кубиках": "300 г",
                ],
                recipe: """
                        1) Налей в стакан для смешивания красный вермут 25 мл и бурбон 50 мл
                        2) Добавь ангостуру биттер 1 дэш
                        3) Наполни стакан кубиками льда и размешай коктейльной ложкой
                        4) Перелей через стрейнер в охлажденный коктейльный бокал
                        5) Укрась коктейльной вишней на шпажке
                        """
            )
        ]
    }
}
