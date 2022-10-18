import 'dart:developer';

import 'package:ecommerse/core/constents.dart';
import 'package:ecommerse/screens/allproducts/controller/all_product_provider.dart';
import 'package:ecommerse/screens/allproducts/view/men_all_product.dart';
import 'package:ecommerse/screens/allproducts/view/screen_all_product.dart';
import 'package:ecommerse/screens/allproducts/view/women_all_product.dart';
import 'package:ecommerse/screens/authentication/view/screen_forgetpassword.dart';
import 'package:ecommerse/screens/authentication/view/screen_login.dart';
import 'package:ecommerse/screens/home/controller/screen_home_provider.dart';
import 'package:ecommerse/screens/home/view/screen_home.dart';
import 'package:ecommerse/screens/splash/view/screen_spalsh.dart';
import 'package:ecommerse/widget/product_view_widget.dart';
import 'package:ecommerse/widget/tabbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenallCategory extends StatelessWidget {
  const ScreenallCategory({super.key});

  @override
  Widget build(BuildContext context) {
    log('called');
    final data = Provider.of<ScreenAllProductProvider>(context, listen: false);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            data.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: ConstentsItems.kBlackColor,
          ),
        ),
      ),
      body: Builder(builder: (context) {
        final tabController =
            TabController(length: 3, vsync: Scaffold.of(context));
        return Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            //color: Colors.yellow

            gradient: ConstentsItems.kBgColor,
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: Icon(
                        Icons.sort_sharp,
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      hintText: 'Search Tech Talk',
                    ),
                  ),
                  ConstentsItems.ksizedBox20,
                  TabbarWidget(
                    tabController: tabController,
                    tabs: const [
                      Tab(text: 'ALL'),
                      Tab(text: 'MEN'),
                      Tab(text: 'WOMEN'),
                    ],
                  ),
                  ConstentsItems.ksizedBox20,
                  Expanded(
                    child: TabBarView(
                      controller: tabController,
                      physics: const NeverScrollableScrollPhysics(),
                      children: const [
                        AllProductViewWidget(
                            imageurl: 'assets/images/shirtimage.png',
                            productName: 'productName',
                            productPrice: 'productPrice'),
                        MenAllProduct(
                            imageurl: 'assets/images/dressimage.png',
                            productName: 'productName',
                            productPrice: 'productPrice'),
                        WomenAllProduct(
                            imageurl: 'assets/images/womenimage.png',
                            productName: 'productName',
                            productPrice: 'productPrice'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
