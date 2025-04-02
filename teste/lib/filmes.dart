class Filme {
  late String title;
  late int year;
  late String text;

  Filme(){
    title = "";
    year = 0;
    text = "";
  }

  Filme.n(this.text, this.title, this.year);

  Filme.fromJson(Map<String, dynamic> json):
    title = json['title'] as String,
    year = json['year'] as int,
    text = json['text'] as String;

  Map<String, dynamic> toJson() => {
    'text' :  text,
    'year' : year,
    'title' : title
  };
}