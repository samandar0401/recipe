// import 'package:categorylogin/recipe_app/category_reviews/presentation/view/create_reviews_event.dart';
// import 'package:categorylogin/recipe_app/create_reviews/presentation/view/create_reviews_event.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../../../core/utils.dart';
// import '../../../../category_reviews/presentation/view/create_reviews_bloc.dart';
// import '../../view/create_review_state.dart';
//
//
// class CreateReviewRecommendSectionOption extends StatelessWidget {
//   const CreateReviewRecommendSectionOption({
//     super.key,
//     required this.text,
//     required this.value,
//   });
//
//   final String text;
//   final bool value;
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<CreateReviewBloc, CreateReviewState>(
//       builder: (context, state) => Row(
//         children: [
//           Text(
//             text,
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 15,
//               fontWeight: FontWeight.w300,
//             ),
//           ),
//           Radio(
//             value: value,
//             fillColor: WidgetStateColor.fromMap({
//               WidgetState.any: AppColors.redpinkmain,
//             }),
//             groupValue: state.doesRecommend,
//             onChanged: (value) => context.read<CreateReviewBloc>().add(
//               CreateReviewRecommendOrNot(value: value!) as CreateReviewEvent,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
