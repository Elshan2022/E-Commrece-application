import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shopping_application/screens/products/model/product_model.dart';
import 'package:flutter_shopping_application/screens/products/providers/product_categorie_provider.dart';
import 'package:flutter_shopping_application/screens/products/providers/product_detail_provider.dart';
import 'package:flutter_shopping_application/screens/products/providers/product_image_provider.dart';
import 'package:flutter_shopping_application/screens/products/providers/product_saver_provider.dart';
import 'package:flutter_shopping_application/screens/products/view/product_bottom_sheet.dart';
import 'package:flutter_shopping_application/screens/products/view/product_categories.dart';
import 'package:flutter_shopping_application/screens/products/view/product_detail_list.dart';
import 'package:flutter_shopping_application/screens/products/view/product_image.dart';
import 'package:flutter_shopping_application/utilities/app_colors.dart';
import 'package:flutter_shopping_application/utilities/app_decoration.dart';
import 'package:flutter_shopping_application/utilities/app_text.dart';
import 'package:flutter_shopping_application/utilities/helper_methods.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uuid/uuid.dart';

class ProductDetail extends ConsumerStatefulWidget {
  const ProductDetail({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProductDetailState();
}

class _ProductDetailState extends ConsumerState<ProductDetail> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FocusNode _productNameFocusNode = FocusNode();
  final FocusNode _manufactureFocusNode = FocusNode();
  final FocusNode _priceFocusNode = FocusNode();
  final FocusNode _descriptionFocusNode = FocusNode();

  final TextEditingController _productName = TextEditingController();
  final TextEditingController _manufacture = TextEditingController();
  final TextEditingController _price = TextEditingController();
  final TextEditingController _description = TextEditingController();

  @override
  void dispose() {
    _productName.dispose();
    _manufacture.dispose();
    _price.dispose();
    _description.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: AppDecorations.pageDecoration,
        child: Container(
          margin: EdgeInsets.only(left: 16.w, right: 16.w),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _title(),
                  const ProductImage(),
                  Container(
                    margin: EdgeInsets.only(top: 10.h),
                    child: _productsTextFormField(
                      _productNameFocusNode,
                      1,
                      _productName,
                      "Product name",
                      (value) {
                        if (value!.isEmpty) {
                          return "Product name is required";
                        } else {
                          return null;
                        }
                      },
                      TextInputType.text,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.h),
                    child: _productsTextFormField(
                      _manufactureFocusNode,
                      1,
                      _manufacture,
                      "Manufacture",
                      (value) {
                        if (value!.isEmpty) {
                          return "Manufacture is required";
                        } else {
                          return null;
                        }
                      },
                      TextInputType.text,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.h),
                    child: _productsTextFormField(
                      _priceFocusNode,
                      1,
                      _price,
                      "Price (\$)",
                      (value) {
                        if (value!.isEmpty) {
                          return "Price is required";
                        } else {
                          return null;
                        }
                      },
                      TextInputType.number,
                    ),
                  ),
                  SizedBox(height: 15.h),
                  const Divider(color: AppColors.grey),
                  _colorsTitle(),
                  SizedBox(height: 10.h),
                  const ProductDetailList(),
                  _buttonForAddingColors(),
                  const ProductCategories(),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 10.h),
                    child: _productsTextFormField(
                      _descriptionFocusNode,
                      10,
                      _description,
                      "Description",
                      (value) {
                        if (value!.isEmpty) {
                          return "Description is required";
                        } else {
                          return null;
                        }
                      },
                      TextInputType.name,
                    ),
                  ),
                  _uploadButton(),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container _uploadButton() {
    final productImage = ref.watch(productImageProvider);
    final categories = ref.watch(selectedProductCategoriesProvider);
    final productDetail = ref.watch(productDetailProvider);

    return Container(
      width: double.infinity,
      height: 50.h,
      margin: EdgeInsets.only(top: 20.h),
      child: ElevatedButton(
        onPressed: () async {
          if (productImage == null ||
              categories.categoriesName.isEmpty ||
              productDetail.isEmpty ||
              _formKey.currentState?.validate() == false) {
            HelperMethods.showSnackBar(
              context,
              "Please fill in all fields",
              Colors.red,
            );
          } else {
            showDialog(
                context: context,
                builder: (context) {
                  return FutureBuilder(
                    future: ref.read(productProvider.notifier).saveProduct(
                          ProductModel(
                            categories: categories.categoriesName,
                            description: _description.text,
                            manufacture: _manufacture.text,
                            price: _price.text,
                            productDetailList: productDetail,
                            productName: _productName.text,
                            uuid: const Uuid().v4(),
                          ),
                        ),
                    builder: (context, snapShot) {
                      if (snapShot.connectionState == ConnectionState.done) {
                        return HelperMethods.showDoneDialog();
                      } else {
                        return HelperMethods.showLoadingDialog();
                      }
                    },
                  );
                });
          }
        },
        style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryDark),
        child: const AppText(
          text: "Upload product",
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }

  InkWell _buttonForAddingColors() {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          isScrollControlled: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.w),
              topRight: Radius.circular(15.w),
            ),
          ),
          context: context,
          builder: (context) {
            return ProductBottomSheet();
          },
        );
      },
      child: Container(
        margin: EdgeInsets.only(top: 10.h),
        width: double.infinity,
        height: 54.h,
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.grey),
            borderRadius: BorderRadius.circular(15.w)),
        child: const Center(
          child: AppText(
            text: "Click to add product's color,size and quantity",
            color: AppColors.black,
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Container _colorsTitle() {
    return Container(
      margin: EdgeInsets.only(top: 10.h),
      child: const AppText(
        text: "Colors,Size,Quantity",
        color: AppColors.black,
        fontSize: 18,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  TextFormField _productsTextFormField(
      FocusNode focusNode,
      int maxLine,
      TextEditingController controller,
      String hintText,
      String? Function(String?) validator,
      TextInputType textInputType) {
    return TextFormField(
      focusNode: focusNode,
      controller: controller,
      cursorColor: AppColors.grey,
      keyboardType: textInputType,
      maxLines: maxLine,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: GoogleFonts.inter(
          color: AppColors.grey,
          fontSize: 16.sp,
          fontWeight: FontWeight.w300,
        ),
        enabledBorder: AppDecorations.productTextFormFieldDecoration,
        disabledBorder: AppDecorations.productTextFormFieldDecoration,
        focusedBorder: AppDecorations.productTextFormFieldDecoration,
        errorBorder: AppDecorations.productTextFormFieldDecoration,
        border: AppDecorations.productTextFormFieldDecoration,
      ),
      validator: validator,
    );
  }

  Align _title() {
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: 42.h,
        margin: EdgeInsets.only(top: 40.h, bottom: 20.h),
        child: const AppText(
          text: "Product Detail",
          color: AppColors.black,
          fontSize: 22,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
