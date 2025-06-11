import '../models/prodect_model.dart';

class ECommerceController{
  List<Product> products = [
    Product(
      name: 'Bluetooth Earphones',
      price: 1299.00,
      description: 'Wireless earphones with 10m range and fast charging.',
    ),
    Product(
      name: 'Fitness Band',
      price: 1899.00,
      description: 'Track steps, sleep, and heart rate with a sleek design.',
    ),
    Product(
      name: 'Smartphone Holder',
      price: 299.00,
      description: 'Flexible mobile holder for desk or bed use.',
    ),
    Product(
      name: 'Laptop Cooling Pad',
      price: 799.00,
      description: 'Dual fan cooling pad with adjustable height.',
    ),
    Product(
      name: 'USB Type-C Cable',
      price: 249.00,
      description: '1.5m fast-charging braided USB Type-C cable.',
    ),
    Product(
      name: 'Wireless Mouse',
      price: 599.00,
      description: '2.4GHz wireless mouse with ergonomic design.',
    ),
    Product(
      name: 'Power Bank 10000mAh',
      price: 1099.00,
      description: 'Fast-charging power bank with dual USB ports.',
    ),
    Product(
      name: 'Mobile Back Cover',
      price: 199.00,
      description: 'Shockproof and stylish mobile back cover.',
    ),
    Product(
      name: 'LED Ring Light',
      price: 999.00,
      description: '10-inch ring light with tripod and phone holder.',
    ),
    Product(
      name: 'Mini Bluetooth Speaker',
      price: 699.00,
      description: 'Portable speaker with powerful bass and mic support.',
    ),
  ];
  List<Product> cartItems = [];

  void addProduct(Product product){
    products.add(product);
    print('product added!!!');
  }

  void addFavouriteProduct(int index,bool flag){
    products[index].isFav = flag;
  }

  void addToCart(Product product){
    cartItems.add(product);
  }

  void removeToCart(Product product){
    cartItems.removeWhere((element) => element.name == product.name,);
    print('Product removed from cart');
  }
}