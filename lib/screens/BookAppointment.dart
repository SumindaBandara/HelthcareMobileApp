import 'package:flutter/material.dart';
import '../models/topdoctor.dart';
import '../models/appointment.dart';
import '../services/appointment_service.dart';

class AppointmentScreen extends StatefulWidget {
  final Doctor doctor;

  const AppointmentScreen({Key? key, required this.doctor}) : super(key: key);

  @override
  _AppointmentScreenState createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  int _selectedPayment = -1;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void _submitAppointment(String paymentMethod) async {
    final age = int.tryParse(_ageController.text.trim());
    if (age == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter a valid age')),
      );
      return;
    }

    final newAppointment = Appointment(
      doctorName: widget.doctor.name,
      specialty: widget.doctor.specialty,
      patientName: _nameController.text.trim(),
      age: age,
      phone: _phoneController.text.trim(),
      paymentMethod: paymentMethod,
      createdAt: DateTime.now(),
    );

    await AppointmentService.addAppointment(newAppointment);

    Navigator.pushReplacementNamed(context, '/eleven', arguments: {
      'name': newAppointment.patientName,
      'age': newAppointment.age.toString(),
      'phone': newAppointment.phone,
    });
  }

  void _showCardPaymentSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 20,
            right: 20,
            top: 20,
          ),
          child: Wrap(
            children: [
              Center(
                child: Container(
                  height: 5,
                  width: 60,
                  margin: EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Text("Card Payment",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(labelText: 'Card Number'),
                keyboardType: TextInputType.number,
                obscureText: true,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Expiry Date (MM/YY)'),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'CVV'),
                keyboardType: TextInputType.number,
                obscureText: true,
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                  _submitAppointment("Card");
                },
                icon: Icon(Icons.check),
                label: Text("Pay LKR 2500.00",
                    style: TextStyle(fontSize: 16, color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: Size(double.infinity, 50),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _handleConfirm() {
    if (_formKey.currentState!.validate()) {
      if (_selectedPayment == 0) {
        _showCardPaymentSheet();
      } else if (_selectedPayment == 1) {
        _submitAppointment("OnDay");
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please select a payment method')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Appointment"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pushReplacementNamed(context, '/three'),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(widget.doctor.image),
                    ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.doctor.name,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        Text(widget.doctor.specialty,
                            style: TextStyle(color: Colors.grey)),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.blue),
                            Text(" ${widget.doctor.rating}"),
                            SizedBox(width: 10),
                            Icon(Icons.location_on, color: Colors.grey),
                            Text(" ${widget.doctor.distance}"),
                          ],
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(height: 20),
                Text("Patient details",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(hintText: "Name"),
                  validator: (value) => value == null || value.trim().isEmpty
                      ? 'Name is required'
                      : null,
                ),
                TextFormField(
                  controller: _ageController,
                  decoration: InputDecoration(hintText: "Age"),
                  keyboardType: TextInputType.number,
                  validator: (value) => value == null || value.trim().isEmpty
                      ? 'Age is required'
                      : null,
                ),
                TextFormField(
                  controller: _phoneController,
                  decoration: InputDecoration(hintText: "Phone Number"),
                  keyboardType: TextInputType.phone,
                  validator: (value) => value == null || value.trim().isEmpty
                      ? 'Phone number is required'
                      : null,
                ),
                SizedBox(height: 20),
                Text("Total cost",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text("LKR 2500.00", style: TextStyle(fontSize: 16)),
                SizedBox(height: 20),
                Text("Payment options",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ListTile(
                  leading: Radio(
                    value: 0,
                    groupValue: _selectedPayment,
                    onChanged: (int? value) {
                      setState(() {
                        _selectedPayment = value!;
                      });
                    },
                  ),
                  title: Text("Card Payment"),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.credit_card, color: Colors.blue),
                      Icon(Icons.payment, color: Colors.blue),
                    ],
                  ),
                ),
                ListTile(
                  leading: Radio(
                    value: 1,
                    groupValue: _selectedPayment,
                    onChanged: (int? value) {
                      setState(() {
                        _selectedPayment = value!;
                      });
                    },
                  ),
                  title: Text("On day Payment"),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _handleConfirm,
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                  ),
                  child: Text("Confirm",
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: 3,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.assignment), label: "Reports"),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: "Notification"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
