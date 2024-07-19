import 'package:demo_product_clear_architech/domain/entities/product_entity.dart';
import 'package:demo_product_clear_architech/presentation/bloc/product_remote_bloc.dart';
import 'package:demo_product_clear_architech/presentation/bloc/product_remote_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddPage extends StatelessWidget {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(context),
    );
  }

  _buildAppBar() {
    return AppBar(
      title: const Text(
        "Add page",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
      ),
      centerTitle: true,
    );
  }

  _buildBody(BuildContext context) {
    final TextEditingController txtName = TextEditingController();
    final TextEditingController txtPrice = TextEditingController();

    saveProduct() {
      ProductEntity productEntity =
          ProductEntity(name: txtName.text, price: int.parse(txtPrice.text));
      BlocProvider.of<ProductRemoteBloc>(context)
          .add(SaveProduct(productEntity));
      txtName.clear();
      txtPrice.clear();
      Navigator.pop(context);
    }

    return SingleChildScrollView(
        child: Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Name",
            style: TextStyle(
                color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            padding: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
                border: Border.all(), borderRadius: BorderRadius.circular(10)),
            child: TextField(
              controller: txtName,
              decoration: const InputDecoration(border: InputBorder.none),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Price",
            style: TextStyle(
                color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            padding: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
                border: Border.all(), borderRadius: BorderRadius.circular(10)),
            child: TextField(
              controller: txtPrice,
              decoration: const InputDecoration(border: InputBorder.none),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Center(
              child: MaterialButton(
                onPressed: saveProduct,
                hoverElevation: 0,
                hoverColor: Colors.transparent,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(12)),
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                  child: const Text("Add"),
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
