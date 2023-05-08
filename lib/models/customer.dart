class Customer {
  late String OrganizationName;
  late String CustomerAccount;
  late String PrimaryContactPhone;
  late String PartyType;
  late String PrimaryContactEmail;
  late String DeliveryAddressDescription;
  late String DeliveryAddressStreet;
  late String DeliveryAddressStreetNumber;
  late String DeliveryAddressZipCode;
  late String DeliveryAddressState;
  late String DeliveryAddressCounty;
  late String AddressCountryRegionId;
  late double AddressLatitude;
  late double AddressLongitude;

  Customer({
      required this.OrganizationName,
      required this.CustomerAccount,
      required this.PrimaryContactPhone,
      required this.PartyType,
      required this.PrimaryContactEmail,
      required this.DeliveryAddressDescription,
      required this.DeliveryAddressStreet,
      required this.DeliveryAddressStreetNumber,
      required this.DeliveryAddressZipCode,
      required this.DeliveryAddressState,
      required this.DeliveryAddressCounty,
      required this.AddressCountryRegionId,
      required this.AddressLatitude,
      required this.AddressLongitude
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      OrganizationName: json['OrganizationName'],
      CustomerAccount: json['CustomerAccount'],
      PrimaryContactPhone: json['PrimaryContactPhone'],
      PartyType: json['PartyType'],
      PrimaryContactEmail: json['PrimaryContactEmail'],
      DeliveryAddressDescription: json['DeliveryAddressDescription'],
      DeliveryAddressStreet: json['DeliveryAddressStreet'],
      DeliveryAddressStreetNumber: json['DeliveryAddressStreetNumber'],
      DeliveryAddressZipCode: json['DeliveryAddressZipCode'],
      DeliveryAddressState: json['DeliveryAddressState'],
      DeliveryAddressCounty: json['DeliveryAddressCounty'],
      AddressCountryRegionId: json['AddressCountryRegionId'],
      AddressLatitude: json['AddressLatitude'].toDouble(),
      AddressLongitude: json['AddressLongitude'].toDouble(),
    );
  }
}
