import 'package:flutter/material.dart';

class DoctorDetailScreen extends StatefulWidget {
  @override
  _DoctorDetailScreenState createState() => _DoctorDetailScreenState();
}

class _DoctorDetailScreenState extends State<DoctorDetailScreen> {
  int selectedDateIndex = 2; // Default to Wed
  String selectedTime = "02:00 PM";

  final List<String> dates = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
  final List<String> days = ["21", "22", "23", "24", "25", "26"];

  final List<String> times = [
    "09:00 AM",
    "10:00 AM",
    "11:00 AM",
    "01:00 PM",
    "02:00 PM",
    "03:00 PM",
    "04:00 PM",
    "07:00 PM",
    "08:00 PM",
  ];

  final List<String> disabledTimes = [
    "09:00 AM",
    "11:00 AM",
    "01:00 PM",
    "08:00 PM",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/three');
                    },
                  ),
                  Text(
                    "Doctor Detail",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.favorite_border, color: Colors.blue[300]),
                ],
              ),

              SizedBox(height: 20),

              // Doctor Info
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      "https://cdn.prod.website-files.com/62d4f06f9c1357a606c3b7ef/65ddf3cdf19abaf5688af2f8_shutterstock_1933145801%20(1)-p-2000.jpg", // Replace with actual image
                      height: 80,
                      width: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Dr. Rishi",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      Text("Cardiologist",
                          style: TextStyle(color: Colors.grey)),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.blue, size: 16),
                          SizedBox(width: 4),
                          Text("4.7", style: TextStyle(color: Colors.blue)),
                          SizedBox(width: 8),
                          Icon(Icons.location_on, color: Colors.grey, size: 16),
                          Text("800m away",
                              style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 20),

              // About
              Text("About",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 4),
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipi elit, sed do eiusmod tempor incididunt ut laore et dolore magna aliqua...",
                style: TextStyle(color: Colors.grey[700]),
              ),
              TextButton(
                  onPressed: () {},
                  child:
                      Text("Read more", style: TextStyle(color: Colors.blue))),

              // Dates
              SizedBox(height: 10),
              SizedBox(
                height: 70,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: dates.length,
                  itemBuilder: (context, index) {
                    bool isSelected = index == selectedDateIndex;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedDateIndex = index;
                        });
                      },
                      child: Container(
                        width: 60,
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.blue : Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(dates[index],
                                style: TextStyle(
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.black)),
                            Text(days[index],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.black)),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              Divider(height: 30),

              // Time Slots
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: times.map((time) {
                  bool isDisabled = disabledTimes.contains(time);
                  bool isSelected = selectedTime == time;

                  return GestureDetector(
                    onTap: isDisabled
                        ? null
                        : () {
                            setState(() {
                              selectedTime = time;
                            });
                          },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? Colors.blue
                            : isDisabled
                                ? Colors.grey.shade200
                                : Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            color: isDisabled
                                ? Colors.grey.shade300
                                : Colors.blue.shade200),
                      ),
                      child: Text(
                        time,
                        style: TextStyle(
                          color: isDisabled
                              ? Colors.grey
                              : isSelected
                                  ? Colors.white
                                  : Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),

              Spacer(),

              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/eight');
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 55),
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    "Book Appointment",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
