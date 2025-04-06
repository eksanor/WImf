import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  double dailyCalorieGoal = 2000; // Example calorie goal
  double consumedCalories = 1200; // Example current calorie count

  @override
  Widget build(BuildContext context) {
    double progressPercentage =
        consumedCalories.toDouble() / dailyCalorieGoal.toDouble();

    // Determine the chart color based on progress percentage
    Color chartColor;
    if (progressPercentage <= 0.5) {
      chartColor = Colors.red;
    } else if (progressPercentage > 0.5 && progressPercentage <= 0.8) {
      chartColor = Colors.yellow;
    } else {
      chartColor = Colors.green;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Container(
          // Adding the background image
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/bg2.png'), // Path to bg2.png
              fit: BoxFit.cover,
            ),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile section with circle icon and username
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9), // Semi-transparent box
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/user_icon.png'),
                    ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Cookie Crumble',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Gender: F | Age: 20 | Height: \n5\'5" | Weight: 56kg | Activity\nLevel: Moderate',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 2),
              Container(
                padding: const EdgeInsets.all(16), // Padding inside the box
                margin: const EdgeInsets.symmetric(
                    vertical: 12), // Space around the box
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(
                      0.9), // Grey background matching the surrounding
                  borderRadius: BorderRadius.circular(8), // Rounded corners
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text for "Daily Calorie Goal" with the condition for exceeding
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            progressPercentage > 1
                                ? "Daily Calorie Goal\nExceeded by ${(consumedCalories - dailyCalorieGoal).toStringAsFixed(1)} cal"
                                : "Daily Calorie Goal",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: progressPercentage > 1
                                  ? Colors.red
                                  : Colors.black,
                            ),
                          ),
                        ),
                        CircularPercentIndicator(
                          radius: 60.0,
                          lineWidth: 10.0,
                          percent:
                              progressPercentage > 1 ? 1 : progressPercentage,
                          center: Text(
                            '${consumedCalories.toStringAsFixed(0)} cal',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          progressColor: chartColor,
                          backgroundColor: Colors.grey[300]!,
                          circularStrokeCap: CircularStrokeCap.round,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    // Line below the goal
                    Divider(color: Colors.grey, thickness: 1),
                    const SizedBox(height: 8),
                    // Actual calorie goal value in a smaller font
                    Text(
                      '${consumedCalories.toStringAsFixed(0)} / ${dailyCalorieGoal.toStringAsFixed(0)} cal',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color:
                            progressPercentage > 1 ? Colors.red : Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    // Explanation in even smaller font
                    Text(
                      "This value is based on your daily calorie intake and your set goal.",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.black.withOpacity(0.9),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 2),
              // Health-related clickable boxes
              _buildClickableBox(context, 'Health Conditions: PCOD/PCOS'),
              const SizedBox(height: 8),
              _buildClickableBox(context, 'Allergies: Egg, Gluten'),
              const SizedBox(height: 8),
              _buildFamilyBox(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildClickableBox(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        // Handle box click
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Widget _buildFamilyBox(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle family box click
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Family',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            _buildFamilyMemberBox('Mother', 'Thyroid Imbalance', 'None'),
            const SizedBox(height: 8),
            _buildFamilyMemberBox('Father', 'None', 'Dust'),
            const SizedBox(height: 8),
            _buildFamilyMemberBox('Brother', 'Lactose Intolerance', 'Milk'),
          ],
        ),
      ),
    );
  }

  Widget _buildFamilyMemberBox(
      String name, String healthConditions, String allergies) {
    return GestureDetector(
      onTap: () {
        // Handle family member click
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey[200]!.withOpacity(0.8),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            const SizedBox(height: 4),
            Text('Health Conditions: $healthConditions',
                style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 4),
            Text('Allergies: $allergies', style: const TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
