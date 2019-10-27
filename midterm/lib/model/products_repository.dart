import 'product.dart';

class ProductsRepository {
  static List<Product> loadProducts(Category category) {
    const allProducts = <Product> [
      Product(
        category: Category.hotel,
        id: 0,
        stars: 3,
        name: 'Polonia Hotel',
        address: 'Piłsudskiego 66, 50-020 Wrocław, Poland',
        phone: '+48-71-343-10-21',
        description: '206 elegant rooms and suites, including 3 rooms for disabled guests, equipped with all the modern facilities and free WiFi await you at Polonia Palace Hotel in Warsaw. Accommodation options at our Warsaw hotel include comfort rooms, suites and a fashionable English Apartment featuring a unique view of Warsaw.',
      ),
      Product(
        category: Category.hotel,
        id: 1,
        stars: 3,
        name: 'Gyeongju Hilton',
        address: '484-7, Bomun-ro, Gyeongju, 38117, Korea',
        phone: '+82-54-745-7799',
        description: 'Experience a modern, upscale experience in the ancient city of Gyeongju. Located in South Korea''s most historic city, the Hilton Gyeongju hotel is beautifully situated by Lake Bomun, and is surrounded by glorious countryside and a majestic mountain range. Explore the historic sites and attractions of the ancient capital of the Korean Silla Dynasty from our comfortable and stylish hotel.',
      ),
      Product(
        category: Category.hotel,
        id: 2,
        stars: 3,
        name: 'The Westin Grand Hotel Berlin',
        address: 'Friedrichstraße 158-164, 10117, Berlin, Germany',
        phone: '+49-30-2027-3420',
        description: 'The Westin Grand, Berlin located in the Mitte district – one of the most celebrated districts in the city, containing an impressive array of historic Berlin landmarks and attractions. Before World War II, the Mitte district was the wealthiest in the city; the very core of Berlin’s business, political and cultural life and has now been restored to its former glory. Walk to Brandenburg Gate, a monument that once represented access to the most important city of the Prussian kingdom. After the war this once flourishing area was left in a very bad state of disrepair with many of the buildings being completely destroyed. The district came under the control of the East German Government and was rebuilt as the center of the new East Berlin. Since reunification, our Mitte hotel rests along this great boulevard that has once again become the core showpiece of the city.',
      ),
      Product(
        category: Category.hotel,
        id: 3,
        stars: 3,
        name: 'Marina Bay Sands Hotel',
        address: 'Piłsudskiego 66, 50-020 Wrocław, Poland',
        phone: '+48-71-343-10-21',
        description: '206 elegant rooms and suites, including 3 rooms for disabled guests, equipped with all the modern facilities and free WiFi await you at Polonia Palace Hotel in Warsaw. Accommodation options at our Warsaw hotel include comfort rooms, suites and a fashionable English Apartment featuring a unique view of Warsaw.',
      ),
      Product(
        category: Category.hotel,
        id: 4,
        stars: 3,
        name: 'Carlton Hotel',
        address: '76 Bras Basah Road, Singapore 189558',
        phone: '+65-6338-8333',
        description: 'Strategically located along Bras Basah Road, Carlton Hotel Singapore is within walking distance to convention centres, historical landmarks, museums, shopping areas​and the entertainment belt. ',
      ),
      Product(
        category: Category.hotel,
        id: 5,
        stars: 3,
        name: 'Park Regis Singarpore',
        address: '23 Merchant Road, Singapore 058268',
        phone: '+65-6818-8888',
        description: 'Park Regis Singapore is centrally located in the city centre, within easy reach of Singapore''s vibrant entertainment and dining hubs such as Clarke Quay, Boat Quay and Chinatown. The hotel is close to Raffles Place and Marina Bay, Singapore''s commercial and entertainment hub. Perched along the Singapore River, the hotel is a mere 3 minutes walk away from Clarke Quay MRT train station.',
      ),
      Product(
        category: Category.hotel,
        id: 6,
        stars: 3,
        name: 'Hyatt Regency Bishkek',
        address: '191 Abdrahmanov St, Bishkek 720011, Kyrgyzstan',
        phone: '+996-312-661-234',
        description: 'Luxury 5 star hotel in Bishkek center for business or leisure. The only 5 star Hotel in Bishkek. It has inspiring view on Tien-Shan Mountain range and the ancient trading route The Silk Road. The Hotel is located right in the center of the Bishkek’s business and government district and cultural area including the Kyrgyz Republic Opera House and Art Museum.',
      ),
      Product(
        category: Category.hotel,
        id: 7,
        stars: 3,
        name: 'Ambassador Hotel',
        address: '32 Orozbekov St, Bishkek 720040, Kyrgyzstan',
        phone: '+996-312-979-898',
        description: 'One of our top picks in Bishkek. Offering a restaurant, Ambassador Hotel is located in Bishkek, a 5-minute walk from Ala-Too Square and Bishkek Train Station.',
      ),
    ];
    if (category == Category.all) {
      return allProducts;
    } else {
      return allProducts.where((Product p) {
        return p.category == category;
      }).toList();
    }
  }
}
