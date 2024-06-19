import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:labari/src/features/news/domain/categorie_model.dart';

List<CategorieModel> newsCategories = [
  //Business
  CategorieModel(
      categorieName: "Business",
      imageAssetUrl:
          "https://images.unsplash.com/photo-1611974789855-9c2a0a7236a3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDF8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60"),

  //Entertainment
  CategorieModel(
      categorieName: "Entertainment",
      imageAssetUrl:
          "https://images.unsplash.com/photo-1574375927938-d5a98e8ffe85?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8bmV0ZmxpeHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60"),

  //General
  CategorieModel(
      categorieName: "General",
      imageAssetUrl:
          "https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60"),

  //Health
  CategorieModel(
      categorieName: "Health",
      imageAssetUrl:
          "https://images.unsplash.com/photo-1526256262350-7da7584cf5eb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzF8fGhlYWx0aHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60"),

  //Science
  CategorieModel(
      categorieName: "Science",
      imageAssetUrl:
          "https://images.unsplash.com/photo-1614935151651-0bea6508db6b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8c2NpZW5jZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60"),

  //Sports
  CategorieModel(
      categorieName: "Sports",
      imageAssetUrl:
          "https://images.unsplash.com/photo-1508098682722-e99c43a406b2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8c29jY2VyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60"),

  //Technology
  CategorieModel(
      categorieName: "Technology",
      imageAssetUrl:
          "https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80"),
];


final newsCategoriesListProvider = Provider<List<CategorieModel>>((ref) => newsCategories);