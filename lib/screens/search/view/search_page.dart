import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shopping_application/screens/home/providers/all_products_provider.dart';
import 'package:flutter_shopping_application/screens/products/model/stored_product_model.dart';
import 'package:flutter_shopping_application/screens/search/providers/search_provider.dart';
import 'package:flutter_shopping_application/utilities/app_colors.dart';
import 'package:flutter_shopping_application/utilities/app_decoration.dart';
import 'package:flutter_shopping_application/utilities/app_text.dart';
import 'package:go_router/go_router.dart';

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  final TextEditingController _search = TextEditingController();

  List<StoredProductModel>? _searchList = [];

  @override
  Widget build(BuildContext context) {
    final productList = ref.watch(allProductsProvider);

    return Material(
      child: Container(
        decoration: AppDecorations.pageDecoration,
        child: SingleChildScrollView(
          child: Column(
            children: [
              _searchTexFormField(context),
              _searchList!.isEmpty
                  ? _productsGridView(productList)
                  : _productsGridView(_searchList)
            ],
          ),
        ),
      ),
    );
  }

  Container _searchTexFormField(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50.h, left: 16.w, right: 16.w),
      height: 42.h,
      child: TextFormField(
        controller: _search,
        cursorColor: AppColors.grey,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(bottom: 5.h),
          hintText: "Search product",
          filled: true,
          fillColor: Colors.white,
          prefixIcon: IconButton(
              onPressed: () {
                context.pop();
              },
              icon: const Icon(Icons.arrow_back_ios, color: AppColors.grey)),
          enabledBorder: AppDecorations.searchTextFieldDecoration,
          disabledBorder: AppDecorations.searchTextFieldDecoration,
          focusedBorder: AppDecorations.searchTextFieldDecoration,
          errorBorder: AppDecorations.searchTextFieldDecoration,
          border: AppDecorations.searchTextFieldDecoration,
        ),
        onChanged: (value) {
          setState(() {
            _searchList = ref.watch(searchProvider(value));
          });
        },
      ),
    );
  }

  Container _productsGridView(List<StoredProductModel>? productList) {
    return Container(
      margin: EdgeInsets.only(left: 16.w, right: 16.w),
      child: GridView.builder(
        padding: EdgeInsets.zero,
        primary: false,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: productList!.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          crossAxisSpacing: 10,
          mainAxisExtent: 287,
          maxCrossAxisExtent: 250,
        ),
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(top: 20.h),
            decoration: AppDecorations.pageDecoration,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //image and favorite icon
                Stack(
                  children: [
                    Container(
                      height: 207.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.w),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  productList[index].imageUrl.toString()))),
                    ),
                    Positioned(
                      left: 140.w,
                      top: 10.h,
                      child: Container(
                        width: 32.w,
                        height: 32.w,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: const Icon(Icons.favorite_border,
                            color: Colors.red),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 20.h,
                  margin: EdgeInsets.only(top: 12.h),
                  child: AppText(
                    maxLines: 1,
                    text: productList[index].productName.toString(),
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  height: 20.h,
                  margin: EdgeInsets.only(top: 5.h),
                  child: AppText(
                    maxLines: 1,
                    text: productList[index].manufacture.toString(),
                    color: AppColors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
