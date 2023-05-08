import 'package:url_launcher/url_launcher.dart';

class UrlLauncherUtils {

  static mailTo(String email) {
    final Uri emailLaunchUri = Uri(
        scheme: 'mailto',
        path: email,
        queryParameters: {"subject":"Boss Info Meeting: This is a demo e-mail :)"}
    );
    launchUrl(emailLaunchUri);
  }

  static telephoneCall(String telephoneNumber) {
    // Remove all non-digits from the phone number string
    final plainNumber = telephoneNumber.replaceAll(RegExp(r'[^\d]'), '');
    final Uri telephoneLaunchUri = Uri(
      scheme: 'tel',
      path: 'tel:$plainNumber',
    );
    launchUrl(telephoneLaunchUri);
  }

  static openMap(double latitude, double longitude) {
    final Uri telephoneLaunchUri = Uri(
      scheme: 'geo',
      path: "$latitude,$longitude",
    );
    launchUrl(telephoneLaunchUri);
  }
}
