import 'package:app_based_on_bloc/cart/business_logic/cubit/cart_cubit.dart';
import 'package:app_based_on_bloc/product/business_logic/cubit/product_cubit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth/business_logic/cubit/auth_cubit.dart';
import 'service_locator.dart';
import 'package:badges/badges.dart' as badges;

@RoutePage()
class ApplicationScreen extends StatelessWidget {
  const ApplicationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Container(),
      appBar: AppBar(
        title: const Text('Easy Till'),
        centerTitle: true,
        actions: [
          BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              return badges.Badge(
                badgeContent: Text(state.productsInCart.length.toString()),
                position: badges.BadgePosition.custom(
                  top: 0,
                  end: 0,
                ),
                child: IconButton(
                  onPressed: () {}, //TODO : move to Cart details
                  icon: const Icon(Icons.shopping_cart_sharp),
                ),
              );
            },
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: BlocBuilder<ProductCubit, ProductState>(
        bloc: getIt.get<ProductCubit>(),
        builder: (context, state) {
          if (state.isLoadingProduct) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          }

          if (state.errorLoadingProduct) {
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      getIt.get<ProductCubit>().getProducts();
                    },
                    icon: const Icon(
                      Icons.refresh,
                      size: 50,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text("${state.message}"),
                ],
              ),
            );
          }

          if (state.products?.isEmpty ?? true) {
            return const Center(
              child: Text("Aucun produits répertorier"),
            );
          }

          var products = state.products!;

          return RefreshIndicator(
            onRefresh: () async {
              getIt.get<ProductCubit>().getProducts();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ListView.separated(
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 12),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  var product = products[index];
                  return InkWell(
                    onTap: () {}, //TODO : redirect to product details
                    child: ListTile(
                      dense: false,
                      leading: Container(
                        width: 80,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          image: DecorationImage(
                            image: NetworkImage(
                              'https://www.wallpaperup.com/uploads/wallpapers/2015/06/14/722374/0fdc9692df5740bc64b2a80b7b522a48-1000.jpg',
                            ),
                          ),
                        ),
                      ),
                      title: Text(product.name),
                      subtitle: Text('\$ ${product.unitPrice}'),
                      trailing: IconButton(
                        onPressed: () {
                          context.read<CartCubit>().addToCart(product);
                        },
                        icon: const Icon(Icons.add_shopping_cart_sharp),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
