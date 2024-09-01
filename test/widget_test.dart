import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:travel_booking/domain/repositories/flight_repository.dart';

class MockFlightRepository extends Mock implements FlightRepository {}

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Create a mock instance of FlightRepository
    final mockFlightRepository = MockFlightRepository();

    // Pass the mockFlightRepository to MyApp
    // await tester.pumpWidget(
    //     MyApp(flightRepository: null)); // Ensure null safety in MyApp

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('1'), findsOneWidget);
    expect(find.text('0'), findsNothing);
  });
}
