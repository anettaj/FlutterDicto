import 'package:flutter/material.dart';

class DynamicPage extends StatelessWidget {
  const DynamicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Text('''
          
          Api when value is passed
          
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../Components/CartCard.dart';
import '../Components/ColorList.dart';
import '../Components/Size.dart';
import '../Pages/ShippingDetailsPage.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  late Future<Map<String, dynamic>> _cartDataFuture;
  late String _cartTotal = '';
  bool isempty=false;

  @override
  void initState() {
    super.initState();
    _cartDataFuture = _fetchCartData();
  }

  Future<Map<String, dynamic>> _fetchCartData() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String customerId = prefs.getString('id') ?? '';
      final response = await http.post(
        Uri.parse('https://camerakonnect.com/api/cart-view.php'),
        body: {'customerid': customerId},
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body) as Map<String, dynamic>;
        setState(() {
          _cartTotal = jsonData['cart_total'] ?? '';
        });
        return jsonData;
      } else {
        throw 'HTTP Error: {response.statusCode}';
      }
    } catch (error) {
      throw 'Error fetching cart data: error';
    }
  }

  Future<void> _deleteProduct(String productId) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String customerId = prefs.getString('id') ?? '';
      final response = await http.post(
        Uri.parse('https://camerakonnect.com/api/cart-delete.php'),
        body: {
          'customerid': customerId,
          'productid': productId,
        },
      );

      if (response.statusCode == 200) {
        // Product deleted successfully, refresh cart data
        setState(() {
          _cartDataFuture = _fetchCartData();
        });
      } else {
        throw 'HTTP Error: {response.statusCode}';
      }
    } catch (error) {
      throw 'Error deleting product from cart: error';
    }
  }

  @override
  Widget build(BuildContext context) {
    double H = ScreenSize.Height(context);
    double W = ScreenSize.Width(context);
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text('Cart'),
        ),
        body: FutureBuilder<Map<String, dynamic>>(
          future: _cartDataFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error fetching cart data. Tap to try again.'),
              );
            } else if (snapshot.hasData) {
              Map<String, dynamic> cartData = snapshot.data!;
              List<dynamic> items = cartData['data'] ?? [];

              if (items.isEmpty) {
                isempty=true;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: double.infinity,
                      height: H*0.3,
                      child: Image.asset('assets/cartempty.jpg'),
                    ),
                    Text('Your Cart is empty'),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);

                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              0), // Set the border radius to 0 for rectangular shape
                        ),
                        backgroundColor: CartButtonColor, // Set the button's background color to pink
                      ),

                      child: Text(
                        'Continue Shopping',
                        style: TextStyle(color: Colors
                            .white), // Set text color to white for better contrast
                      ),
                    ),
                  ],
                );
              }

              return SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                      children: List.generate(
                        items.length,
                            (index) => Stack(
                          children: [
                            CartCard(
                              image: items[index]['product_image'] ?? '',
                              title: items[index]['product_name'] ?? '',
                              price: items[index]['product_price'] ?? '',
                              onIncrease: (quantity) {},
                              onDecrease: (quantity) {},
                              onDelete: () {
                                _deleteProduct(items[index]['product_id'] ?? '');
                              },
                            ),
                            Positioned(
                              right: 10,
                              top: 10,
                              child: IconButton(
                                onPressed: () {
                                  _deleteProduct(items[index]['product_id'] ?? '');
                                },
                                icon: Icon(Icons.delete),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    
                    ),
                  ],
                ),
              );
            } else {
              return SizedBox.shrink();
            }
          },
        ),
        
    );
  }
}

          
          
          '''),
        ),
      ),
    );
  }
}
