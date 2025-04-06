import 'package:flutter/material.dart';
import 'package:flutter_application_1/InitialPages/MyHomePage.dart';

class RewardPoints extends StatelessWidget {
  const RewardPoints({super.key, required String username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rewards'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => MyHomePage(username: 'Cookie')),
            ); // Redirect to the homepage route
          },
        ),
      ),
      body: Stack(
        children: [
          // Background image with reduced opacity
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bg2.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Semi-transparent overlay to adjust opacity
          Container(
            color: Colors.white
                .withOpacity(0.3), // Adjust the overlay opacity here
          ),
          // Main content
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Row(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage('assets/points_icon.png'),
                      ),
                      SizedBox(width: 16),
                      Text(
                        'Reward Points: 1500',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Available Coupons:',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                    children: [
                      _buildCouponBox('Flat 10% OFF on next purchase', 1200),
                      _buildCouponBox('Free Shipping on orders over \$50', 300),
                      _buildCouponBox(
                          'Buy 1 Get 1 Free on selected items', 700),
                      _buildCouponBox('25% OFF on first order', 0),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCouponBox(String coupon, int price) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.local_offer,
            color: Colors.pink,
            size: 30,
          ),
          Text(
            coupon,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            '$price points',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          OutlinedButton(
            onPressed: () {
              // Implement redemption logic here
            },
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.black), // Black border
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12), // Rounded corners
              ),
              backgroundColor:
                  Colors.white.withOpacity(0.7), // White background
            ),
            child: const Text(
              'Redeem',
              style: TextStyle(
                color: Colors.black, // Black text
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
