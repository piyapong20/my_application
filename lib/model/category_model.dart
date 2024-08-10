class CategoryModel {
  int id;
  String categoryNameTh;
  String categoryNameEn;
  String categorySlugTh;
  String categorySlugEn;
  int categoryActive;
  DateTime createdAt;
  DateTime updatedAt;

  CategoryModel({
    required this.id,
    required this.categoryNameTh,
    required this.categoryNameEn,
    required this.categorySlugTh,
    required this.categorySlugEn,
    required this.categoryActive,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      categoryNameTh: json['category_name_th'],
      categoryNameEn: json['category_name_en'],
      categorySlugTh: json['category_slug_th'],
      categorySlugEn: json['category_slug_en'],
      categoryActive: json['category_active'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}
