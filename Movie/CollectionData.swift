import UIKit

struct Section {
    let items: [Item]
}

struct Item {
    let picture: UIImage?
    let name: String
    let surName: String
    
    var fullName: String {
        name + " " + surName
    }
    
    let genreTitle: String
    let colors: [UIColor]?
}

struct Color {
    let colorFirst: UIColor
    let colorSecond: UIColor
    let colorThree: UIColor
}

class MockData {
    static func getData() -> [Section] {
        let sectionLogoItems = [
            Item(picture: .ivi, name: "", surName: "", genreTitle: "", colors: nil),
            Item(picture: .kinopoisk, name: "", surName: "", genreTitle: "", colors: nil),
            Item(picture: .kion, name: "", surName: "", genreTitle: "", colors: nil),
            Item(picture: .okko, name: "", surName: "", genreTitle: "", colors: nil),
            Item(picture: .premier, name: "", surName: "", genreTitle: "", colors: nil),
            Item(picture: .wink, name: "", surName: "", genreTitle: "", colors: nil),
        ]
        
        let sectionPostersItems = [
            Item(picture: .hollywood, name: "", surName: "", genreTitle: "", colors: nil),
            Item(picture: .expendables, name: "", surName: "", genreTitle: "", colors: nil),
            Item(picture: .future, name: "", surName: "", genreTitle: "", colors: nil),
            Item(picture: .guardians, name: "", surName: "", genreTitle: "", colors: nil),
            Item(picture: .oblivion, name: "", surName: "", genreTitle: "", colors: nil)
        ]
        
        let sectionActorsItems = [
            Item(picture: .bale, name: "Кристиан", surName: "Бейл", genreTitle: "", colors: nil),
            Item(picture: .demi, name: "Деми", surName: "Мур", genreTitle: "", colors: nil),
            Item(picture: .denzel, name: "Дензел", surName: "Вашингтон", genreTitle: "", colors: nil),
            Item(picture: .foster, name: "Джоди", surName: "Фостер", genreTitle: "", colors: nil),
            Item(picture: .killian, name: "Киллиан", surName: "Мёрфи", genreTitle: "", colors: nil),
            Item(picture: .natali, name: "Натали", surName: "Портман", genreTitle: "", colors: nil),
            Item(picture: .klint, name: "Клинт", surName: "Иствуд", genreTitle: "", colors: nil),
            Item(picture: .teron, name: "Шарлиз", surName: "Терон", genreTitle: "", colors: nil),
            Item(picture: .rassel, name: "Рассел", surName: "Кроу", genreTitle: "", colors: nil)
        ]
        
        let sectionGenresItems = [
            Item(
                picture: nil,
                name: "",
                surName: "",
                genreTitle: "Научная фантастика",
                colors: [.science1, .science2, .science3]
            ),
            Item(
                picture: nil,
                name: "",
                surName: "",
                genreTitle: "Триллеры",
                colors: [.triller1, .triller2, .triller3]
            ),
            Item(
                picture: nil,
                name: "",
                surName: "",
                genreTitle: "Романтические",
                colors: [.romantic1, .romantic2, .romantic3]
            ),
            Item(
                picture: nil,
                name: "",
                surName: "",
                genreTitle: "Комедии",
                colors: [.comedy1, .comedy2, .comedy3]
            ),
            Item(
                picture: nil,
                name: "",
                surName: "",
                genreTitle: "Боевики",
                colors: [.action1, .action2, .action3]
            ),
        ]
        
        let sectionLogo = Section(items: sectionLogoItems)
        let sectionPoster = Section(items: sectionPostersItems)
        let sectionActor = Section(items: sectionActorsItems)
        let sectionGenre = Section(items: sectionGenresItems)
        
        return [sectionLogo,sectionPoster, sectionActor, sectionGenre]
        
    }
}
