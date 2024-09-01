import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:travel_booking/presentaion/provider/flight_provider.dart';
import 'package:travel_booking/presentaion/widgets/booking_card_widget.dart';

class MockFlightProvider extends Mock implements FlightProvider {}

void main() {
  testWidgets('BookingCard interacts with FlightProvider correctly',
      (WidgetTester tester) async {
    // Arrange
    final mockProvider = MockFlightProvider();

    // Act
    await tester.pumpWidget(
      ChangeNotifierProvider<FlightProvider>.value(
        value: mockProvider,
        child: MaterialApp(home: BookingCard()),
      ),
    );

    // Assert
    expect(find.byType(Autocomplete<String>), findsOneWidget);
    expect(find.byType(DropdownButtonFormField<String>), findsNWidgets(2));
  });
}
