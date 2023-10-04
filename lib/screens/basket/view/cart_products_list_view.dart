import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shopping_application/screens/basket/providers/all_cart_items_provider.dart';
import 'package:flutter_shopping_application/screens/productInformation/model/cart_item_model.dart';
import 'package:flutter_shopping_application/utilities/app_colors.dart';
import 'package:flutter_shopping_application/utilities/app_text.dart';
import 'package:flutter_shopping_application/utilities/helper_methods.dart';

class CartProductsListView extends ConsumerStatefulWidget {
  const CartProductsListView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CartProductsListViewState();
}

class _CartProductsListViewState extends ConsumerState<CartProductsListView> {
  late Future<List<CartItemModel>?> _fetchCartProducts;

  Future<List<CartItemModel>?> _fetchAllCartItems() async {
    return await ref.read(allCartItemsProvider.notifier).getAllCartItems();
  }

  @override
  void initState() {
    _fetchCartProducts = _fetchAllCartItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cartList = ref.watch(allCartItemsProvider);
    return Container(
      height: 560.h,
      width: double.infinity,
      margin: EdgeInsets.only(top: 20.h, bottom: 10.h),
      child: FutureBuilder<List<CartItemModel>?>(
          future: _fetchCartProducts,
          builder: (context, snapShot) {
            if (snapShot.connectionState == ConnectionState.done) {
              return Container(
                height: 560.h,
                width: double.infinity,
                margin: EdgeInsets.only(top: 20.h, bottom: 10.h),
                child: ListView.builder(
                  itemCount: cartList!.length,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    final data = cartList[index];
                    return Container(
                      width: 114.h,
                      height: 160.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //product image
                          Container(
                            margin: EdgeInsets.only(top: 10.h),
                            width: 114.w,
                            height: 160.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.w),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(data.imageUrl),
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //product name and delete button
                              Row(
                                children: [
                                  Container(
                                    width: 200.w,
                                    margin:
                                        EdgeInsets.only(top: 10.h, left: 10.w),
                                    child: AppText(
                                      text: data.productName,
                                      color: AppColors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      ref
                                          .read(allCartItemsProvider.notifier)
                                          .deleteProduct(data.productId);
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(top: 10.h),
                                      child: Icon(
                                        Icons.delete_outline,
                                        color: AppColors.primaryDark,
                                        size: 30.w,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              //price
                              Container(
                                margin: EdgeInsets.only(left: 12.w),
                                child: AppText(
                                  text: "${data.totalPrice} (\$)",
                                  color: AppColors.grey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              Container(
                                margin: EdgeInsets.only(top: 10.h),
                                child: Row(
                                  children: [
                                    //color
                                    Container(
                                      margin: EdgeInsets.only(left: 12.w),
                                      width: 33.w,
                                      height: 33.h,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(int.parse(data.colorCode)),
                                      ),
                                    ),
                                    //size
                                    Container(
                                      width: 30,
                                      height: 30,
                                      margin: EdgeInsets.only(left: 10.w),
                                      padding: EdgeInsets.all(5.w),
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white),
                                      child: AppText(
                                        text: data.size,
                                        color: AppColors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            } else {
              return HelperMethods.showLoadingDialog();
            }
          }),
    );
  }
}
