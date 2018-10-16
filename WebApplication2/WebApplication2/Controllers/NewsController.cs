[Route("api/[controller]")]
public class NewsController : Controller
{
    private IEnumerable<News> _news;

    public NewsController()
    {
        _news = new List<News> {
                new News()
                {
                    Title = "Incendie volontaire à la gendarmerie de Grenoble : la section de recherches saisie de l'enquête",
                    Content = "Le feu a pris dans un entrepôt technique vaste de 2 000 mètres carrés et a touché plusieurs garages et bureaux mais aucun logement de la caserne n'a été touché. Un gendarme a néanmoins été légèrement blessé en tentant d'intervenir en premier lieu. Une vingtaine de véhicules sérigraphiés et civils de la gendarmerie ont été touchés.",
                    Date = new DateTimeOffset(new DateTime(2017, 09, 21, 08, 07, 00)),
                    NewsPaper = "Le dauphiné"
                },
                new News()
                {
                    Title = "A New York, le sort de l’accord nucléaire iranien dans l’impasse",
                    Content = "Les signataires de l’accord conclu en 2015 se sont retrouvés mercredi à l’ONU dans une ambiance tendue, alors que Donald Trump menace toujours de dénoncer le texte.",
                    Date = new DateTimeOffset(new DateTime(2017, 09, 21, 06, 44, 00)),
                    NewsPaper = "Le Monde"
                },
                new News()
                {
                    Title = "Avec Airlab, Airparif veut développer des projets concrets pour lutter contre la pollution",
                    Content = "L’organisme indépendant qui surveille la qualité de l’air en Ile-de-France met en place une structure favorisant l’émergence et l’accompagnement de projets innovants.",
                    Date = new DateTimeOffset(new DateTime(2017, 09, 20, 18, 55, 00)),
                    NewsPaper = "Le Monde"
                }
            };
    }

    [HttpGet]
    public IEnumerable<News> Get()
    {
        return _news;
    }

    [HttpGet("{newspaper}")]
    public IEnumerable<News> Get(string newspaper)
    {
        return _news.Where(p => p.NewsPaper.Equals(newspaper, StringComparison.OrdinalIgnoreCase)).ToList();
    }
}