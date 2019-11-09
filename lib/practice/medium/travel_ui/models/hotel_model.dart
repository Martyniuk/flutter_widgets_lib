class Hotel {
  String imageUrl;
  String name;
  String address;
  var price;

  Hotel({
    this.imageUrl,
    this.name,
    this.address,
    this.price,
  });
}

final List<Hotel> hotels = [
  Hotel(
    imageUrl: 'assets/images/middle_travel_ui/hotel0.jpg',
    name: 'Hotel 0',
    address: '404 Great St',
    price: 175,
  ),
  Hotel(
    imageUrl: 'assets/images/middle_travel_ui/hotel1.jpg',
    name: 'Hotel 1',
    address: '404 Great St',
    price: 300,
  ),
  Hotel(
    imageUrl: 'assets/images/middle_travel_ui/hotel2.jpg',
    name: 'Hotel 2',
    address: '404 Great St',
    price: 'dohuя',
  ),
];