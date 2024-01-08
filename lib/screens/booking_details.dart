import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'booking_provider.dart';



class NextScreen extends StatelessWidget {
  final DateTime selectedDate;
  final TimeOfDay selectedTime;

  NextScreen({required this.selectedDate, required this.selectedTime});

  @override
  Widget build(BuildContext context) {
    BookingProvider bookingProvider = Provider.of<BookingProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text("Next Screen"),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Selected Date: ${selectedDate.toString()}",
              style: TextStyle(fontSize: 18),
            ),
            Text(
              "Selected Time: ${selectedTime.format(context)}",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                bool isBooked = bookingProvider.isTimeSlotBooked(selectedTime);

                if (!isBooked && !bookingProvider.isTimeSlotAccepted) {
                  bookingProvider.setTime(selectedTime, true);
                  bookingProvider.isTimeSlotAccepted = true;
                }
              },
              style: ElevatedButton.styleFrom(
                primary: bookingProvider.isTimeSlotAccepted ? Colors.grey : Colors.blue,
                padding: EdgeInsets.all(15.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                onPrimary: bookingProvider.isTimeSlotAccepted ? null : Colors.blue,
              ),
              child: Text(
                "Accept",
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                BookingProvider bookingProvider = Provider.of<BookingProvider>(context, listen: false);
                bool isBooked = bookingProvider.isTimeSlotBooked(selectedTime);

                if (isBooked) {
                  bookingProvider.setTime(selectedTime, false);
                }
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.all(15.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Text(
                "Decline",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}