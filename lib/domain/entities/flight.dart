class AllFightsRespondModel {
  List<BestFlights>? bestFlights;

  AllFightsRespondModel({
    this.bestFlights,
  });
}

class BestFlights {
  List<Flights>? flights;
  List<Layovers>? layovers;
  int? totalDuration;
  CarbonEmissions? carbonEmissions;
  int? price;
  String? type;
  String? airlineLogo;
  String? departureToken;

  BestFlights(
      {this.flights,
      this.layovers,
      this.totalDuration,
      this.carbonEmissions,
      this.price,
      this.type,
      this.airlineLogo,
      this.departureToken});
}

class Flights {
  DepartureAirport? departureAirport;
  DepartureAirport? arrivalAirport;
  int? duration;
  String? airplane;
  String? airline;
  String? airlineLogo;
  String? travelClass;
  String? flightNumber;
  String? legroom;
  List<String>? extensions;
  bool? overnight;
  bool? oftenDelayedByOver30Min;
  List<String>? ticketAlsoSoldBy;

  Flights(
      {this.departureAirport,
      this.arrivalAirport,
      this.duration,
      this.airplane,
      this.airline,
      this.airlineLogo,
      this.travelClass,
      this.flightNumber,
      this.legroom,
      this.extensions,
      this.overnight,
      this.oftenDelayedByOver30Min,
      this.ticketAlsoSoldBy});
}

class DepartureAirport {
  String? name;
  String? id;
  String? time;

  DepartureAirport({this.name, this.id, this.time});
}

class Layovers {
  int? duration;
  String? name;
  String? id;

  Layovers({this.duration, this.name, this.id});
}

class CarbonEmissions {
  int? thisFlight;
  int? typicalForThisRoute;
  int? differencePercent;

  CarbonEmissions(
      {this.thisFlight, this.typicalForThisRoute, this.differencePercent});
}
