import 'package:flutter/material.dart';

class Product {
  final String name;

  const Product(this.name);
}

typedef void CardChangedCallback(Product product, bool inCart);

class ShoppingListItem extends StatelessWidget {
  final Product product;
  final bool inCart;
  final CardChangedCallback onCartChanged;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onCartChanged(product, !inCart);
      },
      leading: CircleAvatar(
        backgroundColor: _getColor(context),
        child: Text(product.name[0]),
      ),
      title: Text(
        product.name,
        style: _getTextStyle(context),
      ),
    );
  }

  Color _getColor(BuildContext context) {
    return inCart ? Colors.black54 : Theme.of(context).primaryColor;
  }

  TextStyle _getTextStyle(BuildContext context) {
    if (!inCart) return null;

    return TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  ShoppingListItem({Product product, this.inCart, this.onCartChanged})
      : product = product,
        super(key: ObjectKey(product));
}

class ShoppingList extends StatefulWidget {
  final List<Product> products;

  ShoppingList({Key key, this.products}) : super(key: key);

  @override
  State createState() {
    return _ShoppingListState();
  }
}

class _ShoppingListState extends State<ShoppingList> {
  Set<Product> _shoppingCart = Set<Product>();

  void _handleCartChanged(Product product, bool inCart) {
    setState(() {
      if (inCart) {
        _shoppingCart.add(product);
      } else {
        _shoppingCart.remove(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping List'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        children: widget.products.map((Product product) {
          return ShoppingListItem(
            product: product,
            inCart: _shoppingCart.contains(product),
            onCartChanged: _handleCartChanged,
          );
        }).toList(),
      ),
    );
  }
}
