import 'package:ecommerce/widgets/productListRow.dart';
import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Product List ",
          style: TextStyle(color: Colors.black45),
        ),
      ),
      body: _buildProductListPage(context),
    );
  }

  _buildProductListPage(context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
        child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              if (index == 0) {
                return _buildFilterWidgets(screenSize, context);
              } else if (index == 4) {
                return SizedBox(
                  height: 12,
                );
              } else {
                return _buildProductListRow();
              }
            }));
  }

  _buildFilterWidgets(Size screenSize, BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      width: screenSize.width,
      child: Card(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildfilterButton("Sırala", context),
              Container(
                color: Colors.black,
                width: 2,
                height: 24,
              ),
              _buildfilterButton("Filtrele", context),
            ],
          ),
        ),
      ),
    );
  }

  _buildfilterButton(String title, BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        children: [
          Icon(
            Icons.arrow_drop_down,
            color: Colors.black,
          ),
          SizedBox(width: 2),
          Text(title),
        ],
      ),
    );
  }

  _buildProductListRow() {
    return ProductListRow(
      name: "Kazak",
      currentPrice: 150,
      originalPrice: 300,
      discount: 50,
      imageUrl:
          "https://i.pinimg.com/originals/52/2b/12/522b12d358946efbab19d9aa0579abe1.jpg",
    );
  }
}

enum sirala {
  GelismisSiralama,
  FiyataGore,
}
