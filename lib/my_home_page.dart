import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/customer_service.dart';
import 'package:flutter_demo/utilities/url_launcher_utils.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'customer_overview.dart';
import 'models/customer.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title, required void Function() toggleThemeMode}) : super(key: key) {
    _toggleThemeMode = toggleThemeMode;
  }
  final String title;
  late final Function _toggleThemeMode;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late CustomerService service = CustomerService();
  late Future<List<Customer>> _customerFuture;
  late bool _isOnDarkTheme = false;

  @override
  void initState() {
    super.initState();
    _load();
  }

  void _load() {
    setState(() {
      _customerFuture = CustomerService.getCustomers();
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
          leading: Switch(onChanged: toggleDarkTheme, value: _isOnDarkTheme,)

      ),
      body: Center(
        child: FutureBuilder<List<Customer>>(
          future: _customerFuture,
          builder:
              (BuildContext context, AsyncSnapshot<List<Customer>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (BuildContext context, int index) {
                  return slidableCustomerCard(snapshot.data![index]);
                },
              );
            } else {
              return Text('Error: ${snapshot.error}');
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _load,
        tooltip: 'Reload',
        child: const Icon(Icons.refresh),
      ),
    );
  }

  Widget slidableCustomerCard(Customer customer) {
    return Slidable(
      startActionPane: ActionPane(
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) =>
                {UrlLauncherUtils.mailTo(customer.PrimaryContactEmail)},
            backgroundColor: Colors.indigo,
            foregroundColor: Colors.white,
            icon: Icons.mail,
            label: 'Mail',
          ),
          SlidableAction(
            onPressed: (context) =>
                {UrlLauncherUtils.telephoneCall(customer.PrimaryContactPhone)},
            backgroundColor: const Color(0xFF21B7CA),
            foregroundColor: Colors.white,
            icon: Icons.phone,
            label: 'Phone',
          ),
        ],
      ),
      child: customerCard(customer),
    );
  }

  Card customerCard(Customer customer) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.person),
        title: Text(customer.OrganizationName),
        subtitle: Text(
            "${customer.DeliveryAddressStreet} ${customer.DeliveryAddressStreetNumber} ${customer.DeliveryAddressZipCode} ${customer.DeliveryAddressState} ${customer.AddressCountryRegionId}"),
        trailing: const Icon(Icons.arrow_forward),
        onTap: () {
          navigateToCustomerOverview(customer);
        },
      ),
    );
  }

  void toggleDarkTheme(bool newValue) {
    setState(() {
      widget._toggleThemeMode();
      _isOnDarkTheme = newValue;
    });
  }

  void navigateToCustomerOverview(Customer customer) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CustomerOverview(customer)),
    );
  }
}
