import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:photo_gallery/photo_details_screen.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
    bool _productListInProgress = false;
    List<Product> productList = [];

    @override
  void initState() {
    super.initState();
    _getProductList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Gallery App'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Visibility(
        visible: _productListInProgress == false,
        replacement: const Center(
            child: CircularProgressIndicator(),
        ),
        child: ListView.separated(
            itemCount: productList.length,
            itemBuilder: (context, index){
              return _buildProductItem(productList[index]);
            },
          separatorBuilder: (_, __) => const Divider(),
        ),
      ),

    );
  }

  Future<void> _getProductList() async {
    _productListInProgress = true;
    setState(() { });
    const String url = 'https://jsonplaceholder.typicode.com/photos';
    Uri uri = Uri.parse(url);
    Response response = await get(uri);

    if(response.statusCode == 200){
      // data decode
      final decodedData = jsonDecode(response.body);
          // get the list
      // final jsonProductList = decodedData['data'];
       final jsonProductList = decodedData;
      // loop over the list
      for(Map<String, dynamic> p in jsonProductList){
        Product product = Product(
            albumId: p['albumId'] ?? '',
            id: p['id'] ?? '',
            title: p['title'] ?? '',
            url: p['url'] ?? '',
            thumbnailUrl: p['thumbnailUrl'] ?? '',
        );
        productList.add(product);
      }

    }else{
       ScaffoldMessenger.of(context).showSnackBar(
         const SnackBar(content: Text('Get Product failed! Try again.')),
       );
    }

    _productListInProgress = false; // loader off
    setState(() { }); // say do loader off

  }

  Widget _buildProductItem(Product product) {
    return ListTile(
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (context) {
            return PhotoDetailsScreen(
              imgUrl: product.url.toString(),
              title: product.title.toString(),
              id: product.id.toString(),
            );
          })),
           leading: Image.network(product.thumbnailUrl,
           height: 60, width: 50,),
            title: Text(product.title),
          );
  }


}


class Product{

  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  Product(
      {required this.albumId,
        required this.id,
        required this.title,
        required this.url,
        required this.thumbnailUrl,
      });

}


