import 'dart:convert';

import 'package:capstone_wms/classes/colors_collection.dart';
import 'package:capstone_wms/classes/inputstyle_collection.dart';
import 'package:capstone_wms/classes/padding_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:capstone_wms/components/bottomsheetFilter.dart';
import 'package:capstone_wms/controllers/search_controller.dart';
import 'package:capstone_wms/models/searchwarehouse_model.dart';
import 'package:capstone_wms/services/warehouse_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  ColorApp colorApp = ColorApp();
  PaddingCollection paddingApp = PaddingCollection();
  TextCollection textCollection = TextCollection();
  DecorationCollection fieldStyle = DecorationCollection();

  TextEditingController searchCont = TextEditingController();
  // late TextEditingController searchCont;
  FindController searchValue = Get.put(FindController());
  WarehouseServidces warehoouseServices = WarehouseServidces();

  bool isLoading = false;

  // late Future<List<dynamic>> warehouseData;
  List<dynamic>? warehouseData;

  Future<void> getWarehouseData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isLoading = true;
      warehouseData = null;
    });
    try {
      SearchWarehouse getWarehouseList = SearchWarehouse(
        token: prefs.getString('token')!,
        search: searchValue.searchString.value,
        // search: searchCont.text.isNotEmpty ? searchCont.text : '',
        maxPrice: '',
        minPrice: '',
        minSize: '',
        maxSize: '',
      );
      final response =
          await warehoouseServices.getWarehouseList(getWarehouseList);
      Map<String, dynamic> responseData = json.decode(response.body);

      if (response.statusCode == 200) {
        List<dynamic>? warehouseList = responseData['data'];
        setState(() {
          warehouseData = warehouseList;
        });
      } else {
        Get.snackbar(
            response.statusCode.toString(), '${responseData['message']}');
      }
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // searchCont = TextEditingController(text: widget.searchQuery);
    searchCont.text = searchValue.searchString.value;
    warehouseData = null;
    getWarehouseData();
  }

  @override
  Widget build(BuildContext context) {
    // final searchQuery = Get.arguments as String;
    // searchCont.text = searchQuery;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () => Get.back(),
                        icon: Icon(
                          Icons.arrow_back_outlined,
                          color: colorApp.secondaryColor,
                        )),
                    // SizedBox(
                    //   width: 8,
                    // ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.65,
                      height: MediaQuery.of(context).size.height * 0.0431,
                      // color: colorApp.light1,
                      child: TextField(
                        onSubmitted: (value) {
                          searchValue.onSearchChanged(value);
                          getWarehouseData();
                          print(searchCont.text);
                        },
                        controller: searchCont,
                        style: textCollection.bodySmall
                            .copyWith(fontWeight: FontWeight.w500),
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search),
                          // labelText: 'Search',
                          hintText: 'Search',
                          hintStyle: textCollection.bodySmall,
                          contentPadding: const EdgeInsets.only(bottom: 1),
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        filterBottomSheet(context);
                      },
                      icon: const Icon(Icons.filter_list_rounded),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: FutureBuilder<List<dynamic>?>(
              future:
                  warehouseData != null ? Future.value(warehouseData) : null,
              builder: (context, snapshot) {
                // if (snapshot.connectionState == ConnectionState.waiting ||
                //     snapshot.data == null) {
                if (isLoading) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: colorApp.mainColor,
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.data == null || warehouseData == null) {
                  return const Center(
                    child: Text("Data not found"),
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        var warehouse = snapshot.data?[index];
                        return GestureDetector(
                          onTap: () {
                            //disini buat ke detail screen nanti
                          },
                          child: Column(
                            children: [
                              Card(
                                color: Colors.white,
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Container(
                                  decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    shadows: [
                                      BoxShadow(
                                        color: colorApp.dark4,
                                        offset: const Offset(4, 4),
                                        blurRadius: 10,
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          "https://images.unsplash.com/photo-1565610222536-ef125c59da2e?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                                          // warehouse['image'],
                                          width: 142,
                                          height: 227,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      const SizedBox(width: 9),
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(height: 8),
                                            Container(
                                              width: 80,
                                              height: 32,
                                              decoration: ShapeDecoration(
                                                shape: RoundedRectangleBorder(
                                                  side: BorderSide(
                                                      width: 1,
                                                      color: colorApp.dark1),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "Gudang",
                                                    // warehouse['title'],
                                                    textAlign: TextAlign.center,
                                                    style: textCollection
                                                        .bodySmall
                                                        .copyWith(
                                                            color: colorApp
                                                                .mainColor),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 16),
                                            Text(
                                              warehouse['name'],
                                              style: textCollection.bodyNormal
                                                  .copyWith(
                                                      color:
                                                          colorApp.mainColor),
                                            ),
                                            // const SizedBox(height: 16),
                                            Row(
                                              children: [
                                                Icon(Icons.location_on_outlined,
                                                    color: colorApp.mainColor),
                                                const SizedBox(width: 8),
                                                Text(
                                                  warehouse['RegencyName'],
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color:
                                                          colorApp.mainColor),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 16),
                                            Row(
                                              children: [
                                                Icon(Icons.crop_square,
                                                    color: colorApp.mainColor),
                                                const SizedBox(width: 8),
                                                Text(
                                                  " ${warehouse['surfaceArea'].toString()} m²",
                                                  style: TextStyle(
                                                    color: colorApp.mainColor,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 10,
                                                  ),
                                                ),
                                                const SizedBox(width: 8),
                                                Icon(Icons.apartment,
                                                    color: colorApp.mainColor),
                                                const SizedBox(width: 8),
                                                Flexible(
                                                  child: Text(
                                                    "${warehouse['buildingArea']} m²"
                                                        .toString(),
                                                    // warehouse['buildingArea'],
                                                    style: TextStyle(
                                                      color: colorApp.mainColor,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 10,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                              "${warehouse['annualPrice'].toString()}/Tahun",
                                              style: textCollection.bodySmall
                                                  .copyWith(
                                                      color:
                                                          colorApp.mainColor),
                                            ),
                                            const SizedBox(height: 8),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.star,
                                          color: colorApp.mainColor,
                                          size: 25,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                            ],
                          ),
                        );
                      });
                }
              }),
        ));
  }
}
