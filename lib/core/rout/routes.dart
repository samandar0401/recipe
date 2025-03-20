class Routes{
  static const String categories = '/categories';
  static const String categoryDetail = '/category-detail';
  static const String recipeDetail = '/recipe-detail/:recipeId';
  static const String login = '/login-detail';
  static const String home = '/home-page';
  static const String community = '/community';
  static const String reviews = '/reviews';
  static const String createReviews = '/createReviews/:recipeId';
  static const String reView='/reviews/:recipeId';
  static String getCreateReview(int recipeId) => '/create-review/$recipeId';
  static const String createReview = '/create-review/:recipeId';

}