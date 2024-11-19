import 'package:get/get.dart';
import 'package:rent_ride/models/bike.dart';
import 'package:rent_ride/sources/bike_source.dart';

class BrowseNewestController extends GetxController {
  final _list = <Bike>[].obs;
  List<Bike> get list => _list;
  set list(List<Bike> n) => _list.value = n;

  final _status = ''.obs;
  String get status => _status.value;
  set status(String n) => _status.value = n;

  fetchNewest() async {
    status = 'loading';

    final bikes = await BikeSource.fetchNewestBikes();
    if (bikes == null) {
      status = 'something wrong';
      return;
    }

    status = 'success';
    list = bikes;
  }
}
