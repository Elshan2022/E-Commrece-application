import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shopping_application/navigation/routes_name.dart';
import 'package:flutter_shopping_application/screens/home/providers/all_products_provider.dart';
import 'package:flutter_shopping_application/screens/products/model/stored_product_model.dart';
import 'package:flutter_shopping_application/utilities/app_colors.dart';
import 'package:flutter_shopping_application/utilities/app_decoration.dart';
import 'package:flutter_shopping_application/utilities/app_text.dart';
import 'package:flutter_shopping_application/utilities/dimensions.dart';
import 'package:go_router/go_router.dart';

class ProductsWidget extends ConsumerStatefulWidget {
  const ProductsWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProductsWidgetState();
}

class _ProductsWidgetState extends ConsumerState<ProductsWidget> {
  late Future<void> _fetchProducts;

  Future<void> _fetchAllProducts() async {
    await ref.read(allProductsProvider.notifier).fetchAllProducts();
  }

  @override
  void initState() {
    super.initState();
    _fetchProducts = _fetchAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    final productList = ref.watch(allProductsProvider);
    final filterList = ref.watch(filteredProductsProvider);
    final isEmpty = productList!.isNotEmpty && filterList!.isEmpty;

    return FutureBuilder(
        future: _fetchProducts,
        builder: (context, snapShot) {
          if (snapShot.connectionState == ConnectionState.done) {
            if (isEmpty) {
              return Container(
                margin: EdgeInsets.only(top: 160.h, left: 65.w),
                child: const AppText(
                  text: "There are no products available",
                  color: AppColors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              );
            } else {
              return _productsGridView(isEmpty ? productList : filterList);
            }
          } else {
            return SizedBox(
              width: double.infinity,
              height: Dimensions.height - 350,
              child: const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryDark,
                ),
              ),
            );
          }
        });
  }

  GridView _productsGridView(List<StoredProductModel>? productList) {
    return GridView.builder(
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
        return InkWell(
          onTap: () {
            context.pushNamed(RoutesName.productInformation,
                pathParameters: {"index": "$index"});
          },
          child: Container(
            margin: EdgeInsets.only(top: 20.h),
            decoration: AppDecorations.pageDecoration,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          width: 32.w,
                          height: 32.w,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: const Icon(
                            Icons.favorite_border,
                            color: Colors.red,
                          ),
                        ),
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
          ),
        );
      },
    );
  }
}
