class NewsClass {
  late String news;
  late String link;
  late String pubDate;

  NewsClass({required this.news, required this.link, required this.pubDate});

  NewsClass.fromJson(Map<String, dynamic> json) {
    news = json['news'];
    link = json['link'];
    pubDate = json['pubDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['news'] = this.news;
    data['link'] = this.link;
    data['pubDate'] = this.pubDate;
    return data;
  }
}
