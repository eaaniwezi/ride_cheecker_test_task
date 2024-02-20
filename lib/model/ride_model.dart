// ignore_for_file: prefer_collection_literals, unnecessary_question_mark, prefer_void_to_null



class RideModel {
  String? id;
  String? routeId;
  String? scheduleTripId;
  String? routeName;
  String? routeNum;
  String? carrier;
  Bus? bus;
  String? driver1;
  String? driver2;
  String? frequency;
  String? waybillNum;
  String? status;
  String? statusPrint;
  Null? statusReason;
  Null? statusComment;
  String? statusDate;
  Departure? departure;
  String? departureTime;
  String? arrivalToDepartureTime;
  Departure? destination;
  String? arrivalTime;
  String? distance;
  int? duration;
  bool? transitSeats;
  int? freeSeatsAmount;
  String? passengerFareCost;
  List<dynamic>? fares;
  int? platform;
  bool? onSale;
  List<dynamic>? route;
  bool? additional;
  List<dynamic>? additionalTripTime;
  bool? transitTrip;
  String? saleStatus;
  bool? aCBPDP;
  Null? factTripReturnTime;
  String? currency;
  String? principalTaxId;
  CarrierData? carrierData;
  String? passengerFareCostAvibus;

  RideModel(
      {this.id,
      this.routeId,
      this.scheduleTripId,
      this.routeName,
      this.routeNum,
      this.carrier,
      this.bus,
      this.driver1,
      this.driver2,
      this.frequency,
      this.waybillNum,
      this.status,
      this.statusPrint,
      this.statusReason,
      this.statusComment,
      this.statusDate,
      this.departure,
      this.departureTime,
      this.arrivalToDepartureTime,
      this.destination,
      this.arrivalTime,
      this.distance,
      this.duration,
      this.transitSeats,
      this.freeSeatsAmount,
      this.passengerFareCost,
      this.fares,
      this.platform,
      this.onSale,
      this.route,
      this.additional,
      this.additionalTripTime,
      this.transitTrip,
      this.saleStatus,
      this.aCBPDP,
      this.factTripReturnTime,
      this.currency,
      this.principalTaxId,
      this.carrierData,
      this.passengerFareCostAvibus});

  RideModel.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    routeId = json['RouteId'];
    scheduleTripId = json['ScheduleTripId'];
    routeName = json['RouteName'];
    routeNum = json['RouteNum'];
    carrier = json['Carrier'];
    bus = json['Bus'] != null ? Bus.fromJson(json['Bus']) : null;
    driver1 = json['Driver1'];
    driver2 = json['Driver2'];
    frequency = json['Frequency'];
    waybillNum = json['WaybillNum'];
    status = json['Status'];
    statusPrint = json['StatusPrint'];
    statusReason = json['StatusReason'];
    statusComment = json['StatusComment'];
    statusDate = json['StatusDate'];
    departure = json['Departure'] != null
        ? Departure.fromJson(json['Departure'])
        : null;
    departureTime = json['DepartureTime'];
    arrivalToDepartureTime = json['ArrivalToDepartureTime'];
    destination = json['Destination'] != null
        ? Departure.fromJson(json['Destination'])
        : null;
    arrivalTime = json['ArrivalTime'];
    distance = json['Distance'];
    duration = json['Duration'];
    transitSeats = json['TransitSeats'];
    freeSeatsAmount = json['FreeSeatsAmount'];
    passengerFareCost = json['PassengerFareCost'];
    if (json['Fares'] != null) {
      fares = <Null>[];
      json['Fares'].forEach((v) {
        // fares!.add( Null.fromJson(v));
      });
    }
    platform = json['Platform'];
    onSale = json['OnSale'];
    if (json['Route'] != null) {
      route = <Null>[];
      json['Route'].forEach((v) {
        // route!.add(Null.fromJson(v));
      });
    }
    additional = json['Additional'];
    if (json['AdditionalTripTime'] != null) {
      additionalTripTime = <Null>[];
      json['AdditionalTripTime'].forEach((v) {
        // additionalTripTime!.add(new Null.fromJson(v));
      });
    }
    transitTrip = json['TransitTrip'];
    saleStatus = json['SaleStatus'];
    aCBPDP = json['ACBPDP'];
    factTripReturnTime = json['FactTripReturnTime'];
    currency = json['Currency'];
    principalTaxId = json['PrincipalTaxId'];
    carrierData = json['CarrierData'] != null
        ? CarrierData.fromJson(json['CarrierData'])
        : null;
    passengerFareCostAvibus = json['PassengerFareCostAvibus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Id'] = id;
    data['RouteId'] = routeId;
    data['ScheduleTripId'] = scheduleTripId;
    data['RouteName'] = routeName;
    data['RouteNum'] = routeNum;
    data['Carrier'] = carrier;
    if (bus != null) {
      data['Bus'] = bus!.toJson();
    }
    data['Driver1'] = driver1;
    data['Driver2'] = driver2;
    data['Frequency'] = frequency;
    data['WaybillNum'] = waybillNum;
    data['Status'] = status;
    data['StatusPrint'] = statusPrint;
    data['StatusReason'] = statusReason;
    data['StatusComment'] = statusComment;
    data['StatusDate'] = statusDate;
    if (departure != null) {
      data['Departure'] = departure!.toJson();
    }
    data['DepartureTime'] = departureTime;
    data['ArrivalToDepartureTime'] = arrivalToDepartureTime;
    if (destination != null) {
      data['Destination'] = destination!.toJson();
    }
    data['ArrivalTime'] = arrivalTime;
    data['Distance'] = distance;
    data['Duration'] = duration;
    data['TransitSeats'] = transitSeats;
    data['FreeSeatsAmount'] = freeSeatsAmount;
    data['PassengerFareCost'] = passengerFareCost;
    if (fares != null) {
      data['Fares'] = fares!.map((v) => v.toJson()).toList();
    }
    data['Platform'] = platform;
    data['OnSale'] = onSale;
    if (route != null) {
      data['Route'] = route!.map((v) => v.toJson()).toList();
    }
    data['Additional'] = additional;
    if (additionalTripTime != null) {
      data['AdditionalTripTime'] =
          additionalTripTime!.map((v) => v.toJson()).toList();
    }
    data['TransitTrip'] = transitTrip;
    data['SaleStatus'] = saleStatus;
    data['ACBPDP'] = aCBPDP;
    data['FactTripReturnTime'] = factTripReturnTime;
    data['Currency'] = currency;
    data['PrincipalTaxId'] = principalTaxId;
    if (carrierData != null) {
      data['CarrierData'] = carrierData!.toJson();
    }
    data['PassengerFareCostAvibus'] = passengerFareCostAvibus;
    return data;
  }
}

class Bus {
  String? id;
  String? model;
  String? licencePlate;
  String? name;
  String? seatsClass;
  int? seatCapacity;
  int? standCapacity;
  int? baggageCapacity;
  List<dynamic>? seatsScheme;
  Null? garageNum;

  Bus(
      {this.id,
      this.model,
      this.licencePlate,
      this.name,
      this.seatsClass,
      this.seatCapacity,
      this.standCapacity,
      this.baggageCapacity,
      this.seatsScheme,
      this.garageNum});

  Bus.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    model = json['Model'];
    licencePlate = json['LicencePlate'];
    name = json['Name'];
    seatsClass = json['SeatsClass'];
    seatCapacity = json['SeatCapacity'];
    standCapacity = json['StandCapacity'];
    baggageCapacity = json['BaggageCapacity'];
    if (json['SeatsScheme'] != null) {
      seatsScheme = <Null>[];
      json['SeatsScheme'].forEach((v) {
        // seatsScheme!.add(new Null.fromJson(v));
      });
    }
    garageNum = json['GarageNum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Id'] = id;
    data['Model'] = model;
    data['LicencePlate'] = licencePlate;
    data['Name'] = name;
    data['SeatsClass'] = seatsClass;
    data['SeatCapacity'] = seatCapacity;
    data['StandCapacity'] = standCapacity;
    data['BaggageCapacity'] = baggageCapacity;
    if (seatsScheme != null) {
      data['SeatsScheme'] = seatsScheme!.map((v) => v.toJson()).toList();
    }
    data['GarageNum'] = garageNum;
    return data;
  }
}

class Departure {
  String? name;
  String? code;
  String? id;
  String? country;
  String? region;
  Null? district;
  bool? automated;
  bool? hasDestinations;
  String? uTC;
  String? gPSCoordinates;
  String? locationType;
  String? locality;
  String? stoppingPlace;
  String? address;
  Null? phone;

  Departure(
      {this.name,
      this.code,
      this.id,
      this.country,
      this.region,
      this.district,
      this.automated,
      this.hasDestinations,
      this.uTC,
      this.gPSCoordinates,
      this.locationType,
      this.locality,
      this.stoppingPlace,
      this.address,
      this.phone});

  Departure.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    code = json['Code'];
    id = json['Id'];
    country = json['Country'];
    region = json['Region'];
    district = json['District'];
    automated = json['Automated'];
    hasDestinations = json['HasDestinations'];
    uTC = json['UTC'];
    gPSCoordinates = json['GPSCoordinates'];
    locationType = json['LocationType'];
    locality = json['Locality'];
    stoppingPlace = json['StoppingPlace'];
    address = json['Address'];
    phone = json['Phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Name'] = name;
    data['Code'] = code;
    data['Id'] = id;
    data['Country'] = country;
    data['Region'] = region;
    data['District'] = district;
    data['Automated'] = automated;
    data['HasDestinations'] = hasDestinations;
    data['UTC'] = uTC;
    data['GPSCoordinates'] = gPSCoordinates;
    data['LocationType'] = locationType;
    data['Locality'] = locality;
    data['StoppingPlace'] = stoppingPlace;
    data['Address'] = address;
    data['Phone'] = phone;
    return data;
  }
}

class CarrierData {
  String? carrierName;
  String? carrierTaxId;
  String? carrierStateRegNum;
  List<CarrierPersonalData>? carrierPersonalData;
  String? carrierAddress;
  String? carrierWorkingHours;

  CarrierData(
      {this.carrierName,
      this.carrierTaxId,
      this.carrierStateRegNum,
      this.carrierPersonalData,
      this.carrierAddress,
      this.carrierWorkingHours});

  CarrierData.fromJson(Map<String, dynamic> json) {
    carrierName = json['CarrierName'];
    carrierTaxId = json['CarrierTaxId'];
    carrierStateRegNum = json['CarrierStateRegNum'];
    if (json['CarrierPersonalData'] != null) {
      carrierPersonalData = <CarrierPersonalData>[];
      json['CarrierPersonalData'].forEach((v) {
        carrierPersonalData!.add(CarrierPersonalData.fromJson(v));
      });
    }
    carrierAddress = json['CarrierAddress'];
    carrierWorkingHours = json['CarrierWorkingHours'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['CarrierName'] = carrierName;
    data['CarrierTaxId'] = carrierTaxId;
    data['CarrierStateRegNum'] = carrierStateRegNum;
    if (carrierPersonalData != null) {
      data['CarrierPersonalData'] =
          carrierPersonalData!.map((v) => v.toJson()).toList();
    }
    data['CarrierAddress'] = carrierAddress;
    data['CarrierWorkingHours'] = carrierWorkingHours;
    return data;
  }
}

class CarrierPersonalData {
  String? name;
  String? caption;
  bool? mandatory;
  bool? personIdentifier;
  String? type;
  List<ValueVariants>? valueVariants;
  Null? inputMask;
  String? value;
  Null? valueKind;
  ValueVariants? defaultValueVariant;
  Null? documentIssueDateRequired;
  Null? documentIssueOrgRequired;
  Null? documentValidityDateRequired;
  Null? documentInceptionDateRequired;
  Null? documentIssuePlaceRequired;
  Null? value1;
  Null? value2;
  Null? value3;
  Null? value4;
  Null? value5;

  CarrierPersonalData(
      {this.name,
      this.caption,
      this.mandatory,
      this.personIdentifier,
      this.type,
      this.valueVariants,
      this.inputMask,
      this.value,
      this.valueKind,
      this.defaultValueVariant,
      this.documentIssueDateRequired,
      this.documentIssueOrgRequired,
      this.documentValidityDateRequired,
      this.documentInceptionDateRequired,
      this.documentIssuePlaceRequired,
      this.value1,
      this.value2,
      this.value3,
      this.value4,
      this.value5});

  CarrierPersonalData.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    caption = json['Caption'];
    mandatory = json['Mandatory'];
    personIdentifier = json['PersonIdentifier'];
    type = json['Type'];
    if (json['ValueVariants'] != null) {
      valueVariants = <ValueVariants>[];
      json['ValueVariants'].forEach((v) {
        valueVariants!.add(ValueVariants.fromJson(v));
      });
    }
    inputMask = json['InputMask'];
    value = json['Value'];
    valueKind = json['ValueKind'];
    defaultValueVariant = json['DefaultValueVariant'] != null
        ? ValueVariants.fromJson(json['DefaultValueVariant'])
        : null;
    documentIssueDateRequired = json['DocumentIssueDateRequired'];
    documentIssueOrgRequired = json['DocumentIssueOrgRequired'];
    documentValidityDateRequired = json['DocumentValidityDateRequired'];
    documentInceptionDateRequired = json['DocumentInceptionDateRequired'];
    documentIssuePlaceRequired = json['DocumentIssuePlaceRequired'];
    value1 = json['Value1'];
    value2 = json['Value2'];
    value3 = json['Value3'];
    value4 = json['Value4'];
    value5 = json['Value5'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Name'] = name;
    data['Caption'] = caption;
    data['Mandatory'] = mandatory;
    data['PersonIdentifier'] = personIdentifier;
    data['Type'] = type;
    if (valueVariants != null) {
      data['ValueVariants'] = valueVariants!.map((v) => v.toJson()).toList();
    }
    data['InputMask'] = inputMask;
    data['Value'] = value;
    data['ValueKind'] = valueKind;
    if (defaultValueVariant != null) {
      data['DefaultValueVariant'] = defaultValueVariant!.toJson();
    }
    data['DocumentIssueDateRequired'] = documentIssueDateRequired;
    data['DocumentIssueOrgRequired'] = documentIssueOrgRequired;
    data['DocumentValidityDateRequired'] = documentValidityDateRequired;
    data['DocumentInceptionDateRequired'] = documentInceptionDateRequired;
    data['DocumentIssuePlaceRequired'] = documentIssuePlaceRequired;
    data['Value1'] = value1;
    data['Value2'] = value2;
    data['Value3'] = value3;
    data['Value4'] = value4;
    data['Value5'] = value5;
    return data;
  }
}

class ValueVariants {
  String? name;
  Null? inputMask;
  Null? valueProperty1;
  Null? valueProperty2;
  Null? valueProperty3;
  Null? valueProperty4;
  Null? valueProperty5;

  ValueVariants(
      {this.name,
      this.inputMask,
      this.valueProperty1,
      this.valueProperty2,
      this.valueProperty3,
      this.valueProperty4,
      this.valueProperty5});

  ValueVariants.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    inputMask = json['InputMask'];
    valueProperty1 = json['ValueProperty1'];
    valueProperty2 = json['ValueProperty2'];
    valueProperty3 = json['ValueProperty3'];
    valueProperty4 = json['ValueProperty4'];
    valueProperty5 = json['ValueProperty5'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Name'] = name;
    data['InputMask'] = inputMask;
    data['ValueProperty1'] = valueProperty1;
    data['ValueProperty2'] = valueProperty2;
    data['ValueProperty3'] = valueProperty3;
    data['ValueProperty4'] = valueProperty4;
    data['ValueProperty5'] = valueProperty5;
    return data;
  }
}
