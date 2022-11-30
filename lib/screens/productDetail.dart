import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.chevron_left,
              color: Colors.black,
              size: 40,
            )),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Welcome To Product Detail Page",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: _buildProductDetail(context),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  _buildProductDetail(BuildContext context) {
    return ListView(
      children: [
        Container(
          padding: EdgeInsets.all(4),
          child: Column(
            children: [
              _builProductImages(),
              _buildProducttitle(),
              SizedBox(height: 12),
              _buildProductPrice(),
              SizedBox(height: 12),
              _buildDivider(),
              SizedBox(height: 12),
              _buildFurtherInfo(),
              SizedBox(height: 12),
              _buildDivider(),
              SizedBox(height: 12),
              _buildSizeArea(),
              SizedBox(height: 12),
              _builInfo(),
            ],
          ),
        )
      ],
    );
  }

  _builProductImages() {
    TabController imagesController = TabController(length: 3, vsync: this);
    return Padding(
      padding: EdgeInsets.all(15),
      child: Container(
        height: 250,
        child: Center(
          child: DefaultTabController(
              length: 3,
              child: Stack(
                children: [
                  TabBarView(controller: imagesController, children: [
                    Image.network(
                        "https://cdn-gant.akinon.net/products/2020/08/12/21569/525be531-b267-4ec8-84bd-c426de366ce3_size750x937_quality100_cropCenter.jpg"),
                    Image.network(
                        "https://cdn-occ.akinon.net/products/2022/01/20/307620/71c780c5-3983-4d27-9968-fc3591ee7e42_size780x780_quality100_cropCenter.jpg"),
                    Image.network(
                        "https://cdn-gant.akinon.net/products/2020/08/12/21569/525be531-b267-4ec8-84bd-c426de366ce3_size750x937_quality100_cropCenter.jpg"),
                  ]),
                  Container(
                    alignment: FractionalOffset(0.5,
                        1.1), // elemanın  x kordinatında tam ortaya y kordinatının son noktasının 1biraaz üstüne koy demek
                    child: TabPageSelector(
                      controller: imagesController,
                      color: Colors.white,
                      selectedColor: Colors.black,
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  _buildProducttitle() {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Center(
        child: Text(
          "Jack Jones Kazak",
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
      ),
    );
  }

  _buildProductPrice() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: const [
          Text(
            "\$100",
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          SizedBox(width: 8),
          Text("\$200",
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                  decoration: TextDecoration.lineThrough)),
          SizedBox(width: 8),
          Text("\%50  indirim",
              style: TextStyle(
                fontSize: 12,
                color: Colors.blue,
              )),
        ],
      ),
    );
  }

  _buildDivider() {
    return Divider(
      color: Colors.black,
      thickness: 0.5,
    );
  }

  _buildFurtherInfo() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          Icon(
            Icons.local_offer,
            color: Colors.grey,
          ),
          SizedBox(width: 12),
          Text(
            "Daha fazla bilgi için tıklayınız",
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  _buildSizeArea() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            children: [
              Icon(Icons.straighten, color: Colors.grey), // beden tablosu
              SizedBox(width: 12),
              Text(
                "Beden :  M",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
          Text(
            "Beden Tablosu",
            style: TextStyle(color: Colors.blue),
          ),
        ],
      ),
    );
  }

  _builInfo() {
    TabController tabController = TabController(length: 2, vsync: this);
    //this farklı cihazlarda uyumluluk için kullanıyoruz
    return Container(
      child: Column(
        children: [
          TabBar(controller: tabController, tabs: [
            Tab(
              child:
                  Text("Ürün Bilgisi ", style: TextStyle(color: Colors.black)),
            ),
            Tab(
              child: Text("Yıkama  Bilgisi ",
                  style: TextStyle(color: Colors.black)),
            )
          ]),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            height: 400,
            child: TabBarView(controller: tabController, children: [
              Text("%60 Pamuk , %30 Polyester",
                  style: TextStyle(color: Colors.black)),
              Text("30 Derecede Yıkayınız ",
                  style: TextStyle(color: Colors.black)),
            ]),
          )
        ],
      ),
    );
  }

  _buildBottomNavigationBar() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: Row(
        children: [
          Flexible(
              fit: FlexFit.tight,
              flex: 0.5.toInt(),
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.list,
                        color: Colors.white,
                      ),
                      SizedBox(width: 4),
                      Text(
                        "İstek Listesi",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ))),
          Flexible(
              fit: FlexFit.tight,
              flex: 1.5.toInt(),
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.greenAccent),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ),
                      SizedBox(width: 4),
                      Text(
                        "Sepete Ekle",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  )))
        ],
      ),
    );
  }
}
