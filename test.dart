
class categoriess {
  final int id;
  final String name;
  final String image;

  const categoriess ({
    required this.id,
    required this.name,
    required this.image,
  });
  factory categoriess .fromJson(Map<String, dynamic> json)=>categoriess (
    id: json['id'],
    name: json['name'],
    image: json['image'],

  );

  Map<String, dynamic>tojson() =>
      {
        'id':id,
        'name':name,
        'image':image,

      };
}
