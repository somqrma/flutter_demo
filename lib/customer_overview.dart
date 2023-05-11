import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/utilities/url_launcher_utils.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import 'models/customer.dart';

class CustomerOverview extends StatelessWidget {
  final Customer customer;
  const CustomerOverview(this.customer, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(customer.OrganizationName),
        ),
        body: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16.0),
                const Text(
                    'Contact Information',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                const SizedBox(height: 16.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customButton(() {
                      UrlLauncherUtils.telephoneCall(
                          customer.PrimaryContactPhone);
                    }, Icons.phone, color: Colors.green),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Phone',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.grey[700],
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            customer.PrimaryContactPhone,
                            style: const TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customButton(() {
                      UrlLauncherUtils.mailTo(
                          customer.PrimaryContactEmail);
                    }, Icons.mail, color: Colors.indigo),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Email',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.grey[700],
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                              customer.PrimaryContactEmail,
                              style: const TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customButton(() {
                  UrlLauncherUtils.openMap(customer.AddressLatitude, customer.AddressLongitude);
                }, Icons.pin_drop, color: const Color(0xFFdf3b2f)),
                const SizedBox(width: 16.0),
                Expanded(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text(
                    'Delivery Address',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey[700],
                    ),
                  ),
                    const SizedBox(height: 8.0),
                    Text(
                      "${customer.DeliveryAddressStreet} ${customer.DeliveryAddressStreetNumber} ${customer.DeliveryAddressZipCode} ${customer.DeliveryAddressState} ${customer.AddressCountryRegionId}",
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                ],)),
              ]),
                const SizedBox(height: 16.0),
                SizedBox(
                  height: 200.0,
                  child: FlutterMap(
                    options: MapOptions(
                      center: LatLng(
                          customer.AddressLatitude, customer.AddressLongitude),
                      zoom: 13.0,
                    ),
                    layers: [
                      TileLayerOptions(
                        urlTemplate:
                            'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                        subdomains: ['a', 'b', 'c'],
                      ),
                      MarkerLayerOptions(
                        markers: [
                          Marker(
                            width: 80.0,
                            height: 80.0,
                            point: LatLng(customer.AddressLatitude,
                                customer.AddressLongitude),
                            builder: (ctx) => const Icon(Icons.location_on, color: Color(0xFFdf3b2f)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )),
    );
  }

  GestureDetector customButton(Function() onTap, IconData icon,
      {Color color = Colors.white}) {
    return GestureDetector(
      onTap: onTap,
      child: ClipOval(
        child: Container(
          height: 40,
          width: 40,
          color: color,
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
