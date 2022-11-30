import 'package:ecommerce/utilities/constants.dart';
import 'package:flutter/material.dart';

class ProductListRow extends StatelessWidget {
  ProductListRow(
      {super.key,
      this.name,
      this.currentPrice,
      this.originalPrice,
      this.discount,
      this.imageUrl});

  String? name;
  int? currentPrice;
  int? originalPrice;
  int? discount;
  String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildProductItemCard(context),
        _buildProductItemCard(context),
      ],
    );
  }

  _buildProductItemCard(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(Constansts.ROUTE_PRODUCT_DETAIL);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.only(left: 7),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  width: MediaQuery.of(context).size.width / 2.2,
                  height: 250,
                  child: Image.network(
                    imageUrl.toString(),
                    fit: BoxFit.cover,
                  )),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Column(
                  children: [
                    Text(
                      name.toString(),
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "\$$currentPrice",
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(width: 8),
                        Text(
                          "  \$$originalPrice",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                              decoration: TextDecoration.lineThrough,
                              decorationStyle: TextDecorationStyle.solid,
                              decorationThickness: 2),
                        ),
                        SizedBox(width: 8),
                        Text(
                          "\%$discount",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
