import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shopping_application/navigation/routes_name.dart';
import 'package:flutter_shopping_application/utilities/app_colors.dart';
import 'package:flutter_shopping_application/utilities/app_decoration.dart';
import 'package:go_router/go_router.dart';

class SearchTextFormField extends ConsumerStatefulWidget {
  const SearchTextFormField({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SearchTextFormFieldState();
}

class _SearchTextFormFieldState extends ConsumerState<SearchTextFormField> {
  late TextEditingController _searchController;

  @override
  void initState() {
    _searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42.h,
      child: TextFormField(
        controller: _searchController,
        cursorColor: AppColors.grey,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(bottom: 5.h),
          hintText: "Search",
          filled: true,
          fillColor: Colors.white,
          prefixIcon: const Icon(Icons.search, color: AppColors.grey),
          enabledBorder: AppDecorations.searchTextFieldDecoration,
          disabledBorder: AppDecorations.searchTextFieldDecoration,
          focusedBorder: AppDecorations.searchTextFieldDecoration,
          errorBorder: AppDecorations.searchTextFieldDecoration,
          border: AppDecorations.searchTextFieldDecoration,
        ),
        onTap: () {
          context.pushNamed(RoutesName.search);
        },
      ),
    );
  }
}
