class Productmodel {
  final int id;
  final String title;
  final dynamic price;
  final String description;
  final String image;
  final String category;

  final RatingModel rating;
  Productmodel({
    required this.category,
    required this.id,
    required this.description,
    required this.image,
    required this.price,
    required this.title,
    required this.rating,
  });
  // factory Productmodel.fromJson(jsonData) {
  //   return Productmodel(
  //       id: jsonData['id'],
  //       description: jsonData['description'],
  //       image: jsonData['image'],
  //       price: jsonData['price'],
  //       title: jsonData['title'],
  //       rating: RatingModel.fromJson(jsonData['rating']));
  factory Productmodel.fromJson(jsonData) {
    return Productmodel(
      category: jsonData['category'],
      id: jsonData['id'],
      description: jsonData['description'],
      image: jsonData['image'],
      price: (jsonData['price']), // ✅ يحوّل int إلى double
      title: jsonData['title'],
      rating: RatingModel.fromJson(jsonData['rating']),
    );
  }
}

class RatingModel {
  final double rate;
  final int count;

  RatingModel({
    required this.rate,
    required this.count,
  });
  // factory RatingModel.fromJson(jsonData) {
  //   return RatingModel(rate: jsonData['rate'], count: jsonData['count']);
  // }
  factory RatingModel.fromJson(jsonData) {
    return RatingModel(
      rate: (jsonData['rate'] as num).toDouble(), // ✅ يحوّل int إلى double
      count: jsonData['count'],
    );
  }
}
