// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:categorylogin/recipe_app/category_reviews/data/model/reviews_model.dart';
// import 'package:categorylogin/recipe_app/create_reviews/presentation/widget/reviews_resipe_rating_and_reviews.dart';
// import 'package:categorylogin/recipe_app/recipe_detail/data/model/detail_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:go_router/go_router.dart';
// import '../../../../core/rout/routes.dart';
// import '../../../../core/utils.dart';
// import 'reviews_recipe_item_user.dart';
//
// class ReviewsRecipeItem extends StatelessWidget {
//   const ReviewsRecipeItem({
//     super.key,
//     required this.recipe,
//   });
//
//   final RecipeDetailModel recipe;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 224.h,
//       padding: EdgeInsets.symmetric(horizontal: 36.w, vertical: 30.h),
//       decoration: BoxDecoration(
//         color: AppColors.redpinkmain,
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Row(
//         spacing: 15.w,
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular(14),
//             child: CachedNetworkImage(
//               imageUrl: recipe.photo,
//               width: 164.w,
//               height: 164.h,
//               fit: BoxFit.cover,
//             ),
//           ),
//           Column(
//             spacing: 8,
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 recipe.title,
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 20,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//               ReviewsRecipeRatingAndReviews(
//                 rating: recipe.rating,
//                 reviews: recipe.reviewsCount,
//               ),
//               ReviewsRecipeItemUser(user: recipe.user),
//               RecipeTextButtonContainer(
//                 text: "Add Review",
//                 fontSize: 15.spMin,
//                 textColor: AppColors.redpinkmain,
//                 containerColor: Colors.white,
//                 containerWidth: 126.w,
//                 containerHeight: 24.h,
//                 containerPaddingH: 10,
//                 callback: () => context.push(Routes.getCreateReview(recipe.id)),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }