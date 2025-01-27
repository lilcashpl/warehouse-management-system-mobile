import 'package:capstone_wms/models/searchwarehouse_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class WarehouseServidces {
  static const String baseUrl =
      "http://ec2-18-139-162-85.ap-southeast-1.compute.amazonaws.com:8086";

  Future<http.Response> getWarehouseList(SearchWarehouse param) async {
    final response = await http.get(
        Uri.parse(
            '$baseUrl/warehouse/user/list?page=1&limit=10&search=${param.search}&maxPrice=${param.maxPrice}&minSize=${param.minSize}&maxSize=${param.maxSize}&minPrice=${param.minPrice}'),
        headers: {
          'Authorization': 'Bearer ${param.token}',
        });

    return response;
  }
}
