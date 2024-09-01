import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:travel_booking/presentaion/provider/flight_provider.dart';
import 'package:travel_booking/presentaion/screens/home_view.dart';
import 'package:travel_booking/presentaion/screens/result_view.dart';
import 'package:travel_booking/presentaion/screens/search_view.dart';

class MockFlightProvider extends Mock implements FlightProvider {}

void main() {
  testWidgets('HomeView displays SearchView when isResultScreen is false',
      (WidgetTester tester) async {
    // Arrange
    final mockProvider = MockFlightProvider();
    when(mockProvider.isResultScreen).thenReturn(false);

    // Act
    await tester.pumpWidget(
      ChangeNotifierProvider<FlightProvider>.value(
        value: mockProvider,
        child: MaterialApp(home: HomeView()),
      ),
    );

    // Assert
    expect(find.byType(SearchView), findsOneWidget);
    expect(find.byType(ResultView), findsNothing);
  });

  testWidgets('HomeView displays ResultView when isResultScreen is true',
      (WidgetTester tester) async {
    // Arrange
    final mockProvider = MockFlightProvider();
    when(mockProvider.isResultScreen).thenReturn(true);

    // Act
    await tester.pumpWidget(
      ChangeNotifierProvider<FlightProvider>.value(
        value: mockProvider,
        child: MaterialApp(home: HomeView()),
      ),
    );

    // Assert
    expect(find.byType(SearchView), findsNothing);
    expect(find.byType(ResultView), findsOneWidget);
  });
}
