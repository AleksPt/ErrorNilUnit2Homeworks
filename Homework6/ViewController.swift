import UIKit

struct CityGuide {
    let photoImage: UIImage
    let titleLabel: String
    let descriptionLabel: String
    let fullOverview: String
}

final class ViewController: UIViewController {
    
    // MARK: - Public Properties
    var delegate: AboutCityDelegate?
    
    // MARK: - Private Properties
    private let tableData = [
        CityGuide(
            photoImage: .barсelona,
            titleLabel: "Барселона",
            descriptionLabel: """
            Население Барселоны — 1 608 680 человек. Это второй город в Испании по численности населения после Мадрида и десятый в Европейском союзе.
            """,
            fullOverview: """
            Подавляющее большинство туристов стремится попасть в Барселону в летний сезон, чтобы совместить традиционный забег по культовым местам мегаполиса с расслабляющим пляжным отдыхом и походами на фестивали, которыми так богата каталонская столица. Антибонусы, которые автоматически прилагаются к высокому сезону, – это огромные толпы путешественников, осаждающих все знаковые достопримечательности и пляжи мегаполиса в сочетании с сильной жарой. А вот в мае, июне и второй половине сентября в Барселоне уже значительно тише, просторнее и даже чуть-чуть дешевле, поэтому планировать путешествие на эти месяцы вполне имеет смысл (если, конечно, не жаль пожертвовать пляжным релаксом). Получить свою порцию веселья можно и зимой: Рождество и Парад Трех Королей в каталонской столице отмечаются с большой помпезностью и размахом.
            """
        ),
        CityGuide(
            photoImage: .havana,
            titleLabel: "Гавана",
            descriptionLabel: """
            Столица и крупнейший город Республики Куба, политический, экономический и культурный центр страны, одна из 16 её провинций.
            """,
            fullOverview: """
            На Кубе ходят в обращении две разные по весу валюты: кубинское песо (CUP) и кубинское конвертируемое песо (CUC). Кук – намного дороже, чем местная валюта, и предназначается в основном для туристов. А обозначаются они очень похоже. По этой причине стоит внимательно присматриваться к ценникам в магазинах: если знак $ имеет одну черточку – речь идет о национальной валюте, если две – о конвертируемой. В ближайшем будущем Совет министров Кубы планирует унифицировать денежное обращение страны, постепенно перейдя от системы двух валют к единой кубинской валюте.
            
            Отдыхая в Гаване, обязательно нужно посвятить время неспешной прогулке по Старому городу (Habana Vieja). Непременно загляните в крепость Parque Histórico Militar Morro-Cabaña. Отсюда можно не только полюбоваться прекрасным панорамным видом на город, но и стать свидетелем изумительного исторического действа. Каждый день в 20:00 под открытым небом проходит церемония Cañonazo: актеры, одетые в военные обмундирования солдат 18-го века, воспроизводят стрельбу из пушки, которая традиционно сопровождала закрытие городских врат. © «wikiway.com» копирование материалов запрещено.
            """
        ),
        CityGuide(
            photoImage: .inch,
            titleLabel: "Инчхон",
            descriptionLabel: "Город и порт на Корейском полуострове в Республике Корея. Аванпорт Сеула в заливе Канхваман Жёлтого моря.",
            fullOverview: """
            Крупнейший южнокорейский город Инчхон стал развиваться, как туристический центр сравнительно недавно. Он расположен поблизости от Сеула, всего в 24 км и привлекает отдыхающих со всего мира развитой современной развлекательной инфраструктурой. Отдых в Инчхоне может быть, как элитным, так и бюджетным.

            Лучшее время для поездки в Инчхон – период с апреля по октябрь. В это время здесь царит теплая погода, температура воздуха достигает 28 градусов. Летом в город прибывает большое количество любителей пляжного отдыха. Береговая полоса тянется на несколько десятков километров, пляжи оборудованы шезлонгами и зонтами, есть развлечения для детей и прокат оснащения для водных видов спорта.
            """
        ),
        CityGuide(
            photoImage: .vancouver,
            titleLabel: "Ванкувер",
            descriptionLabel: "Город на западном побережье Канады, крупнейший населённый пункт провинции Британская Колумбия и третий по величине в Канаде. В 2010 году в Ванкувере проводились XXI зимние Олимпийские игры.",
            fullOverview: """
            Лучшее место для обзора впечатляющей панорамы Ванкувера – круглая смотровая площадка Vancouver Lookout, венчающая небоскреб Harbor Center на высоте 168 метров. К этому сооружению, напоминающему летающую тарелку пришельцев из космоса, ведет лифт с прозрачным корпусом. В нижнем ярусе площадки действует ресторан Top of Vancouver. Столики установлены на медленно вращающейся платформе, совершающей полный оборот на 360° за 55 минут. Во время обеда посетители имеют возможность не спеша рассмотреть весь город. Отсюда видны окружающие Ванкувер горы, острова в океане.
            """
        )
    ]
    
    private lazy var tableView: UITableView = {
        $0.dataSource = self
        $0.delegate = self
        $0.register(TableCell.self, forCellReuseIdentifier: "cell")
        $0.backgroundColor = .systemBackground
        return $0
    }(UITableView(frame: view.frame, style: .insetGrouped))
    
    // MARK: - Overrides Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Cities Guide 🧭"
        navigationController?.navigationBar.prefersLargeTitles = true
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        view.addSubview(tableView)
    }
}

// MARK: - Extensions
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableCell
        let item = tableData[indexPath.row]
        cell.configCell(item: item)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = AboutCity()
        
        self.delegate?.setInfoAboutCity(
            image: tableData[indexPath.row].photoImage,
            title: tableData[indexPath.row].titleLabel,
            description: tableData[indexPath.row].descriptionLabel
        )
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
