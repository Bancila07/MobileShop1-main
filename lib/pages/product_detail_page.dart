import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  final String subtitle;
  final String title;
  final String icon;
  final String code;
  final String img;
  final String price;
  final String currency;
  final String promotionPrice;
  final List size;
  final List color;

  const ProductDetailPage({Key key, this.subtitle, this.icon,this.title, this.code, this.img, this.price,this.currency, this.promotionPrice, this.size, this.color}) : super(key: key);
  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int activeSize = 0;
  int activeColor = 0;
  String activeImg = '';
  int qty = 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      activeImg = widget.img;
    });
  }
  @override
  Widget build(BuildContext context) {
  }
  }