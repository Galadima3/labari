import 'package:labari/models/categorie_model.dart';
List<CategorieModel> getCategories(){

  List<CategorieModel> myCategories = <CategorieModel>[];
  CategorieModel categorieModel;

  //1
  categorieModel = CategorieModel();
  categorieModel.categorieName = "Finance";
  categorieModel.imageAssetUrl = "https://images.unsplash.com/photo-1611974789855-9c2a0a7236a3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDF8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60";
  myCategories.add(categorieModel);

  //2
  categorieModel = CategorieModel();
  categorieModel.categorieName = "Entertainment";
  categorieModel.imageAssetUrl = "https://images.unsplash.com/photo-1574375927938-d5a98e8ffe85?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8bmV0ZmxpeHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60";
  myCategories.add(categorieModel);

  //3
  categorieModel = CategorieModel();
  categorieModel.categorieName = "General";
  categorieModel.imageAssetUrl = "https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60";
  myCategories.add(categorieModel);

  //4
  categorieModel = CategorieModel();
  categorieModel.categorieName = "Health";
  categorieModel.imageAssetUrl = "https://images.unsplash.com/photo-1526256262350-7da7584cf5eb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzF8fGhlYWx0aHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60";
  myCategories.add(categorieModel);

  //5
  categorieModel = CategorieModel();
  categorieModel.categorieName = "Science";
  categorieModel.imageAssetUrl = "https://images.unsplash.com/photo-1614935151651-0bea6508db6b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8c2NpZW5jZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60";
  myCategories.add(categorieModel);

  //6
  categorieModel = CategorieModel();
  categorieModel.categorieName = "Sports";
  categorieModel.imageAssetUrl = "https://images.unsplash.com/photo-1508098682722-e99c43a406b2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8c29jY2VyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60";
  myCategories.add(categorieModel);

  //7
  categorieModel = CategorieModel();
  categorieModel.categorieName = "Technology";
  categorieModel.imageAssetUrl = "https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
  myCategories.add(categorieModel);

  return myCategories;

}