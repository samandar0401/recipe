// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:go_router/go_router.dart';
//
// import '../../../../core/rout/routes.dart';
// import '../../../../core/utils.dart';
// import '../../../category_reviews/presentation/view/create_reviews_bloc.dart';
// import '../../../common/presentation/widgets/recipe_app_bar.dart';
// import '../../../common/presentation/widgets/recipe_bottom_navigation_bar.dart';
// import '../view/create_review_state.dart';
// import '../widget/create_review/create_review_add_photo_section.dart';
// import '../widget/create_review/create_review_cancel_and_submit_section.dart';
// import '../widget/create_review/create_review_rating_section.dart';
// import '../widget/create_review/create_review_recipe_section.dart';
// import '../widget/create_review/create_review_recommend_section.dart';
// import '../widget/create_review/create_review_review_section.dart';
//
// class CreateReviewView extends StatelessWidget {
//   const CreateReviewView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBody: true,
//       appBar: RecipeAppBar(title: "Leave A Review",actions: [],),
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 36.w),
//         child: BlocListener<CreateReviewBloc, CreateReviewState>(
//           listener: (context, state) async {
//             // nothing
//             if (state.status == CreateReviewStatus.submitted) {
//               await showDialog(
//                 context: context,
//                 barrierDismissible: false,
//                 builder: (context) {
//                   return Center(
//                     child: Dialog(
//                       backgroundColor: Colors.white,
//                       child: Container(
//                         width: 276.w,
//                         height: 359.h,
//                         padding: EdgeInsets.symmetric(horizontal: 36.w, vertical: 36.h),
//                         child: Column(
//                           spacing: 20.h,
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             SizedBox(
//                               width: 170.w,
//                               child: Text(
//                                 "Thank you for your Review!",
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                   color: AppColors.bacround,
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                               ),
//                             ),
//                             SvgPicture.asset("assets/icons/big-tick.svg"),
//                             Text(
//                               "Lorem ipsum dolor sit amet pretium cras id dui pellentesque ornare.",
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                 color: AppColors.bacround,
//                                 fontSize: 13,
//                               ),
//                             ),
//                             RecipeTextButtonContainer(
//                               text: "Go Back",
//                               textColor: Colors.white,
//                               containerColor: AppColors.redpinkmain,
//                               containerWidth: 207.w,
//                               containerHeight: 45.h,
//                               fontSize: 20,
//                               fontWeight: FontWeight.w600,
//                               callback: () => context.pop(),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               );
//               if (context.mounted) {
//                 if (context.canPop()) {
//                   context.pop();
//                 } else {
//                   context.go(Routes.home);
//                 }
//               }
//             }
//           },
//           child: Column(
//             children: [
//               const CreateReviewRecipeSection(),
//               SizedBox(height: 23.h),
//               const CreateReviewRatingSection(),
//               SizedBox(height: 30),
//               const CreateReviewReviewSection(),
//               SizedBox(height: 10),
//               const CreateReviewAddPhotoSection(),
//               SizedBox(height: 23),
//               const CreateReviewRecommendSection(),
//               Spacer(),
//               const CreateReviewCancelAndSubmitSection(),
//               SizedBox(height: 120.h)
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: RecipeBottomNavigationBar(),
//     );
//   }
// }
