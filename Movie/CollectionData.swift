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
}

class MockData {
    static func getData() -> [Section] {
        let sectionLogoItems = [
            Item(picture: .ivi, name: "", surName: "", genreTitle: ""),
            Item(picture: .kinopoisk, name: "", surName: "", genreTitle: ""),
            Item(picture: .kion, name: "", surName: "", genreTitle: ""),
            Item(picture: .okko, name: "", surName: "", genreTitle: ""),
            Item(picture: .premier, name: "", surName: "", genreTitle: ""),
            Item(picture: .wink, name: "", surName: "", genreTitle: ""),
        ]
        
        let sectionPostersItems = [
            Item(picture: .hollywood, name: "", surName: "", genreTitle: ""),
            Item(picture: .expendables, name: "", surName: "", genreTitle: ""),
            Item(picture: .future, name: "", surName: "", genreTitle: ""),
            Item(picture: .guardians, name: "", surName: "", genreTitle: ""),
            Item(picture: .oblivion, name: "", surName: "", genreTitle: "")
        ]
        
        let sectionActorsItems = [
            Item(picture: nil, name: "Кристиан", surName: "Бейл", genreTitle: ""),
            Item(picture: nil, name: "Деми", surName: "Мур", genreTitle: ""),
            Item(picture: nil, name: "Дензел", surName: "Вашингтон", genreTitle: ""),
            Item(picture: nil, name: "Джоди", surName: "Фостер", genreTitle: ""),
            Item(picture: nil, name: "Киллиан", surName: "Мёрфи", genreTitle: ""),
            Item(picture: nil, name: "Натали", surName: "Портман", genreTitle: ""),
            Item(picture: nil, name: "Клинт", surName: "Иствуд", genreTitle: ""),
            Item(picture: nil, name: "Шарлиз", surName: "Терон", genreTitle: ""),
            Item(picture: nil, name: "Рассел", surName: "Кроу", genreTitle: "")
        ]
        
        let sectionGenresItems = [
           Item(picture: nil, name: "", surName: "", genreTitle: "Научная фантастика"),
           Item(picture: nil, name: "", surName: "", genreTitle: "Триллеры"),
           Item(picture: nil, name: "", surName: "", genreTitle: "Романтические"),
           Item(picture: nil, name: "", surName: "", genreTitle: "Комедии"),
           Item(picture: nil, name: "", surName: "", genreTitle: "Боевики"),
        ]
        
        let sectionLogo = Section(items: sectionLogoItems)
        let sectionPoster = Section(items: sectionPostersItems)
        let sectionActor = Section(items: sectionActorsItems)
        let sectionGenre = Section(items: sectionGenresItems)
        
        return [sectionLogo,sectionPoster, sectionActor, sectionGenre]
        
    }
}
