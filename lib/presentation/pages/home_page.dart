import 'package:demo_product_clear_architech/presentation/bloc/product_remote_bloc.dart';
import 'package:demo_product_clear_architech/presentation/bloc/product_remote_event.dart';
import 'package:demo_product_clear_architech/presentation/bloc/product_remote_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(),
    );
  }

  _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text(
        "List product",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
      ),
      centerTitle: true,
      actions: [
        IconButton(
            onPressed: () {
              context.goNamed("addPage");
            },
            icon: const Icon(Icons.add))
      ],
    );
  }

  _buildBody() {
    return BlocBuilder<ProductRemoteBloc, ProductRemoteState>(
      builder: (_, state) {
        if (state is ProductRemoteLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is ProductRemoteFail) {
          return const Center(
            child: Icon(Icons.refresh),
          );
        }

        if (state is ProductRemoteDone) {
          return ListView.builder(
              itemCount: state.products!.length,
              itemBuilder: (context, index) {
                final product = state.products![index];
                return Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black38, width: 1),
                      borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.all(15),
                  margin: const EdgeInsets.all(15),
                  child: ListTile(
                    title: Text(product.name!),
                    subtitle: Text(product.price.toString()),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.edit)),
                        const SizedBox(
                          width: 10,
                        ),
                        IconButton(
                            onPressed: () {
                              BlocProvider.of<ProductRemoteBloc>(context)
                                  .add(DeleteProduct(product.id!));
                            },
                            icon: const Icon(Icons.delete_forever)),
                      ],
                    ),
                  ),
                );
              });
        }

        return const Center(
          child: Text("fail"),
        );
      },
    );
  }
}
