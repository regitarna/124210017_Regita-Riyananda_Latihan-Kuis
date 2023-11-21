class News {
  final int? count;
  final String? next;
  final dynamic previous;
  final List<Results>? results;

  var summary;

  var title;


  News({
    this.count,
    this.next,
    this.previous,
    this.results, required int id, required String title,
    required String url, required String image_url,
    required String news_site, required String summary, required String published_at,
    required String updated_at, required bool featured,
    required List<dynamic> launches, required List<dynamic> events,
  });

  var user = [
    News(
        id : 21581,
        title: "McAlister: Space Station Gap Would Be “Not Great, But Not Irrecoverable”",
        url: "https://spacepolicyonline.com/news/mcalister-space-station-gap-would-be-not-great-but-not-irrecoverable/",
        image_url: "https://spacepolicyonline.com/wp-content/uploads/2023/04/ISS-great-image-300x176.jpg",
        news_site: "SpacePolicyOnline.com",
        summary: "As the International Space Station celebrates its 25th anniversary, the Director of NASA’s Commercial Space Division said today that the agency is working closely with partners to avoid a space […]",
        published_at: "2023-11-21T03:49:15Z",
        updated_at: "2023-11-21T04:11:02.369000Z",
        featured: false,
        launches: [],
        events: []
    )

  ];

  News.fromJson(Map<String, dynamic> json)
      : count = json['count'] as int?,
        next = json['next'] as String?,
        previous = json['previous'],
        results = (json['results'] as List?)?.map((dynamic e) => Results.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'count' : count,
    'next' : next,
    'previous' : previous,
    'results' : results?.map((e) => e.toJson()).toList()
  };
}

class Results {
  final int? id;
  final String? title;
  final String? url;
  final String? imageUrl;
  final String? newsSite;
  final String? summary;
  final String? publishedAt;
  final String? updatedAt;
  final bool? featured;
  final List<dynamic>? launches;
  final List<dynamic>? events;

  Results({
    this.id,
    this.title,
    this.url,
    this.imageUrl,
    this.newsSite,
    this.summary,
    this.publishedAt,
    this.updatedAt,
    this.featured,
    this.launches,
    this.events, required String image_url, required String news_site, required String published_at, required String updated_at,
  });


  Results.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        title = json['title'] as String?,
        url = json['url'] as String?,
        imageUrl = json['image_url'] as String?,
        newsSite = json['news_site'] as String?,
        summary = json['summary'] as String?,
        publishedAt = json['published_at'] as String?,
        updatedAt = json['updated_at'] as String?,
        featured = json['featured'] as bool?,
        launches = json['launches'] as List?,
        events = json['events'] as List?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'title' : title,
    'url' : url,
    'image_url' : imageUrl,
    'news_site' : newsSite,
    'summary' : summary,
    'published_at' : publishedAt,
    'updated_at' : updatedAt,
    'featured' : featured,
    'launches' : launches,
    'events' : events
  };
}