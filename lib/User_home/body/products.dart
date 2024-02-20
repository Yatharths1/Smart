


class Product {
  int temp1;
  final int id;
  final String title, description, type;
  final List<String> images;
  final double rating, price;
  final bool isFavourite, isPopular;

  Product({
    this.temp1 = 0,
    required this.id,
    required this.images,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    required this.title,
    required this.price,
    required this.type,
    required this.description,
  });
}

// Our demo Products

List<Product> demoProducts = [
  Product(
    id: 1,
    images: [
      "images/jimjam.jpg",
    ],
    title: "JimJam Biscuits",
    price: 25,
    description: description,
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
    type: "Biscuits"
  ),
  Product(
    id: 2,
    images: [
      "images/maggie.png",
    ],
    title: "Maggie Noodles (Pack of 2)",
    price: 28,
    description: description1,
    rating: 4.1,
    isPopular: true,
    type: "Snacks"
  ),
  Product(
    id: 3,
    images: [
      "images/vaseline.png",
    ],
    title: "Vaseline Body Lotion 400ml",
    price: 243,
    description: description2,
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
    type: "Beauty Products"
  ),
  Product(
    id: 4,
    images: [
      "images/pepsi.png",
    ],
    title: "Pepsi 750ml",
    price: 40,
    description: description3,
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
    type: "Cold Drinks"
  ),
];

const String description =
    "Britannia Jim Jam Cream Biscuits are loved by almost all age groups. "
    "The crispy texture of biscuits complemented by the sweet flavour of cream "
    "inside and top of all the jam at the center top sprinkled with the sugar crystals"
    " to make this biscuit best of all. "
    "Britannia biscuits and cookies for long has been a part of every home, "
    "sharing those moments of joy. Believing in delivering fresh and healthy products, "
    "Britannia India manufactures some of India's favourite brands like 50-50, Tiger, "
    "NutriChoice, Bourbon, Good Day, Milk Bikis and Little Hearts.";

const String description1 = "India’s largest and most loved Noodles brand, "
    "MAGGI 2-minute Noodles, now comes with the goodness of Iron. ";

const String description2 = " India’s No.1 Body Lotion - Vaseline Deep Moisture. "
    "It penetrates 5 layers deep into your skin to give you long lasting moisturisation, "
    "even during harsh winters.";

const String description3 = "Pepsi is the pop that shakes things up. "
    "Pepsi is ubiquitous on just about every social occasion. "
    "Also known to be a party starter.";