import UIKit

struct CocktailModel {
    
    struct Ingredients {
        let ingredient: String
        let value: String
    }
    
    var photo: UIImage
    var title: String
    var description: String
    var ingredients: [String: String]
    var recipe: [String]
    var history: String
    
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
                    "Лед в кубиках": "500 г"
                ],
                recipe: [
                        "1) Налей в стакан для смешивания красный вермут 25 мл и бурбон 50 мл",
                        "2) Добавь ангостуру биттер 1 дэш",
                        "3) Наполни стакан кубиками льда и размешай коктейльной ложкой",
                        "4) Перелей через стрейнер в охлажденный коктейльный бокал",
                        "5) Укрась коктейльной вишней на шпажке"
                        ],
                history: """
                        Классическая версия гласит: коктейль создали во Флоренции в 1919 году благодаря графу Камилло Негрони, который попросил бармена сделать его любимый коктейль «Американо» более крепким, заменив содовую на джин. Бармен украсил напиток апельсином вместо лимона, чтобы отличать его от других коктейлей и предшественника. После того, как новый коктейль появился в ассортименте бара, он сразу стал набирать популярность. Позже семья Негрони основала компанию Negroni Distillerie и стала выпускать готовый вариант напитка под названием «Antico Negroni 1919».
                        
                        Есть и иная версия, согласно которой графа Камилло Негрони никогда не существовало, а коктейль был придуман в 1857 году в Сенегале генералом Паскалем Оливье де Негрони, корсиканцем по происхождению. В статье от 2 февраля 1980 года в газете Corse Matin утверждается, что этот напиток был изобретён генералом в 1914 году.
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
                recipe:
                        [
                            "1) Наполни хайбол кубиками льда доверху",
                            "2) Налей гренадин 10 мл и серебряную текилу 50 мл",
                            "3) Долей апельсиновый сок доверху и аккуратно размешай коктейльной ложкой",
                            "4) Укрась кружком апельсина"
                        ]
                        ,
                history: """
                        Существует как минимум две версии происхождения этого напитка. Одни считают, что коктейль был придуман в 20-х годах прошлого века в Тихуане, маленьком мексиканском городке на границе с США, который во времена сухого закона стал местом паломничества американцев. По другой версии, «Текила санрайз» появилась чуть позже — примерно в 40-х. Мол, придумал его один из барменов ресторана в Фениксе, когда к нему подошел один из гостей и попросил приготовить что-нибудь новенькое с текилой. Для клиента было важно, чтобы коктейль можно было долго пить у бассейна, растягивая удовольствие.
                        
                        На пике популярности напиток оказался в бурные 70-е. Поговаривают, что хорошую службу для распространения напитка сослужила музыкальная группа Rolling Stones. Якобы однажды солисту группы Мику Джаггеру, который на очередной встрече с прессой заказал себе коктейль «Маргарита», бармен предложил попробовать «Текилу санрайз». Коктейль так понравился артисту, что вся группа с его подачи предпочитала именно этот напиток любым другим в своем американском туре 1972 года.
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
                recipe:
                        [
                            "1) Налей в шейкер лаймовый сок 10 мл, клюквенный сок 50 мл, ликер трипл сек 20 мл и цитрусовую водку 40 мл",
                            "2) Наполни шейкер кубиками льда и взбей",
                            "3) Перелей через стрейнер в охлажденный коктейльный бокал",
                            "4) Зажги над коктейлем горелку и выжми на нее масло из апельсиновой цедры"
                        ]
                        ,
                history: """
                        Культовый алкогольный коктейль «Космополитен», по одной из версий, был создан специально для утончённого сочетания Absolute Citron с водкой. По другой — главный женский коктейль изобрела женщина-бармен Черил Кук. За все время существования компоненты напитка менялись, за исключением водки. Классический рецепт появился, когда известный манхэттенский бармен Тоби Чеккини заменил «Трипл сек» на ликер «Куантро», а сок лимона — на сок лайма.

                        Популярным коктейль сделали симпатия поп-дивы Мадонны и сериал «Секс в большом городе», героини которого то и дело потягивали «Космополитен» во время своих посиделок. Ассоциацией барменов коктейль отнесён к разделу «Современная классика». Можно почувствовать себя частью истории, сделав этот аперитив самостоятельно.
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
                recipe:
                        [
                            "1) Наполни харрикейн кубиками льда доверху",
                            "2) Налей ликер блю кюрасао 20 мл и водку 50 мл",
                            "3) Долей спрайт доверху и аккуратно размешай коктейльной ложкой",
                            "4) Укрась долькой ананаса"
                        ]
                        ,
                history: """
                        Авторство рецепта "Голубой лагуны" приписывают Полю Гогену. Легенда гласит, что великий импрессионист придумал алкогольный напиток, проживая на Таити. Новый коктейль стал заменой любимому абсенту, от которого художник ранее отказался. Но эта версия не имеет документального подтверждения, хоть и звучит довольно интересно.

                        На самом деле эффектный голубой микс в 1960 году создал бармен по имени Энди МакЭлхон, сын знаменитого миксолога и автора популярных коктейлей Гарри МакЭлхона. Молодой человек назвал свое творение в честь исландского термального курорта, на котором  побывал накануне. Местные красоты поразили бармена настолько, что вдохновили на создание и дали имя новому коктейлю.
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
                recipe:
                        [
                            "1) Налей в стакан для смешивания красный вермут 25 мл и бурбон 50 мл",
                            "2) Добавь ангостуру биттер 1 дэш",
                            "3) Наполни стакан кубиками льда и размешай коктейльной ложкой",
                            "4) Перелей через стрейнер в охлажденный коктейльный бокал",
                            "5) Укрась коктейльной вишней на шпажке"
                        ]
                        ,
                history: """
                        Говорят, что этот крепкий микс придумала мать Уинстона Черчилля, который слыл большим поклонником виски. Но эта версия не имеет документального подтверждения.

                        Более правдоподобна история о том, что алкогольный напиток был создан в американском клубе Manhattan Club в Нью-Йорке, где его готовили на основе ржаного виски. Именно элитный клуб "Манхэттен" как место рождения напитка упоминал Вильям Граймс, известный коктейльный историк в своей книге "Straight Up or On the Rocks: The Story of American Cocktail". Коктейль быстро стал популярным в Нью-Йорке, а вскоре и по всей стране. По мере распространения его рецептура претерпела некоторые изменения. Например, на юге США в него стали добавлять бурбон, а в Миннесоте и Висконсине ржаной виски заменяли бренди. Популярность напитка быстро перенеслась из США в Англию, где его готовили в лучших барах Лондона.
                        """
            )
        ]
    }
}
