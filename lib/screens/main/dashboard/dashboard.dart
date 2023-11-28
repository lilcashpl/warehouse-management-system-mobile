import 'package:capstone_wms/classes/colors_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:capstone_wms/screens/main/dashboard/recommend_list.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  RangeValues _sliderValue = const RangeValues(1, 100);

  TextCollection textApp = TextCollection();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorApp().mainColorDarker,
        leading: const Padding(
          padding: EdgeInsets.only(left: 12.0, top: 10.0, bottom: 10.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              "https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cGVyc29ufGVufDB8fDB8fHww",
            ),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hi, Digia",
              style: textApp.heading6.copyWith(
                color: ColorApp().light4,
              ),
            ),
            Text(
              "We're happy to see you today",
              style: textApp.smallLabel.copyWith(
                color: ColorApp().light4,
              ),
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_rounded,
              color: ColorApp().light4,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.chat_rounded,
              color: ColorApp().light4,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: ColorApp().mainColorDarker,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        SizedBox(
                          height: 40,
                          width: double.infinity,
                          child: TextField(
                            style: textApp.bodySmall.copyWith(
                              color: ColorApp().light4,
                            ),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: ColorApp().light3.withOpacity(0.5),
                              hintText: "Search",
                              hintStyle: textApp.bodySmall.copyWith(
                                color: ColorApp().light4,
                                fontWeight: FontWeight.normal,
                              ),
                              contentPadding:
                                  const EdgeInsets.fromLTRB(0, 2, 0, 0),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: ColorApp().mainColor,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: ColorApp().mainColor,
                                ),
                              ),
                              prefixIcon: Icon(
                                Icons.search,
                                color: ColorApp().light4,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: ColorApp().light4,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              "Purwokerto, Banyumas",
                              style: textApp.smallLabel.copyWith(
                                color: ColorApp().light4,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(right: 8.0, left: 8.0, top: 130.0),
                  child: SizedBox(
                    height: 155,
                    child: BannerWidget(),
                  ),
                ),
              ],
            ),
            // const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Text(
                    "Rekomendasi Untukmu",
                    style: TextCollection().bodySmall,
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const RecommendList()));
                    },
                    icon: const Icon(Icons.more_horiz),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                height: 240,
                width: double.infinity,
                child: RecommendedCardWidget(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Text(
                    "Gudang Termurah",
                    style: TextCollection().bodySmall,
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_horiz),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                height: 244,
                width: double.infinity,
                child: RecommendedCardWidget(),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Future<dynamic> FilterBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: ColorApp().light4,
      builder: (builder) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.9,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: SizedBox(
                      height: 50,
                      child: Row(
                        children: [
                          Icon(
                            Icons.filter_list_rounded,
                            color: ColorApp().dark1,
                          ),
                          const SizedBox(width: 20),
                          Text("Filter", style: textApp.bodySmall)
                        ],
                      ),
                    ),
                  ),
                  const Divider(),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text("Urutkan", style: textApp.bodySmall),
                  ),
                  // const SizedBox(height: 10),
                  SizedBox(
                    height: 30,
                    child: Row(
                      children: [
                        Checkbox(value: false, onChanged: (value) {}),
                        const SizedBox(width: 5),
                        Text(
                          "Paling Rekomendasi",
                          style: textApp.smallLabel.copyWith(
                            color: ColorApp().dark1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                    child: Row(
                      children: [
                        Checkbox(value: false, onChanged: (value) {}),
                        const SizedBox(width: 5),
                        Text(
                          "Harga Terendah",
                          style: textApp.smallLabel.copyWith(
                            color: ColorApp().dark1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                    child: Row(
                      children: [
                        Checkbox(value: false, onChanged: (value) {}),
                        const SizedBox(width: 5),
                        Text(
                          "Harga Tertinggi",
                          style: textApp.smallLabel.copyWith(
                            color: ColorApp().dark1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text("Price Range", style: textApp.bodySmall),
                  ),
                  RangeSlider(
                    min: 0,
                    max: 100,
                    activeColor: ColorApp().mainColor,
                    inactiveColor: ColorApp().mainColor.withOpacity(0.5),
                    values: _sliderValue,
                    labels: RangeLabels(
                      _sliderValue.start.toString(),
                      _sliderValue.end.toString(),
                    ),
                    onChanged: (newValues) {
                      setState(() {
                        _sliderValue = newValues;
                      });
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Min. price",
                              style: textApp.extraSmallLabel.copyWith(
                                color: ColorApp().dark1,
                              ),
                            ),
                            SizedBox(
                              height: 30,
                              width: 80,
                              child: TextField(
                                cursorColor: ColorApp().mainColor,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(
                                        color: ColorApp().mainColor,
                                      )),
                                  contentPadding: const EdgeInsets.only(
                                    bottom: 5.0,
                                    left: 5.0,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(
                                      color: ColorApp().mainColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Max. price",
                              style: textApp.extraSmallLabel.copyWith(
                                color: ColorApp().dark1,
                              ),
                            ),
                            SizedBox(
                              height: 30,
                              width: 80,
                              child: TextField(
                                cursorColor: ColorApp().mainColor,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(
                                        color: ColorApp().mainColor,
                                      )),
                                  contentPadding: const EdgeInsets.only(
                                    bottom: 5.0,
                                    left: 5.0,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(
                                      color: ColorApp().mainColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      "Payment Time",
                      style: textApp.bodySmall,
                    ),
                  ),
                  // const SizedBox(height: 10),
                  SizedBox(
                    height: 30,
                    child: Row(
                      children: [
                        Checkbox(value: false, onChanged: (value) {}),
                        const SizedBox(width: 5),
                        Text(
                          "Mingguan",
                          style: textApp.smallLabel.copyWith(
                            color: ColorApp().dark1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                    child: Row(
                      children: [
                        Checkbox(value: false, onChanged: (value) {}),
                        const SizedBox(width: 5),
                        Text(
                          "Bulanan",
                          style: textApp.smallLabel.copyWith(
                            color: ColorApp().dark1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                    child: Row(
                      children: [
                        Checkbox(value: false, onChanged: (value) {}),
                        const SizedBox(width: 5),
                        Text(
                          "Tahunan",
                          style: textApp.smallLabel.copyWith(
                            color: ColorApp().dark1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text("Ukuran", style: textApp.bodySmall),
                  ),
                  RangeSlider(
                    min: 0,
                    max: 100,
                    activeColor: ColorApp().mainColor,
                    inactiveColor: ColorApp().mainColor.withOpacity(0.5),
                    values: _sliderValue,
                    labels: RangeLabels(
                      _sliderValue.start.toString(),
                      _sliderValue.end.toString(),
                    ),
                    onChanged: (newValues) {
                      setState(() {
                        _sliderValue = newValues;
                      });
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Min. size",
                              style: textApp.extraSmallLabel.copyWith(
                                color: ColorApp().dark1,
                              ),
                            ),
                            SizedBox(
                              height: 30,
                              width: 80,
                              child: TextField(
                                cursorColor: ColorApp().mainColor,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(
                                        color: ColorApp().mainColor,
                                      )),
                                  contentPadding: const EdgeInsets.only(
                                    bottom: 5.0,
                                    left: 5.0,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(
                                      color: ColorApp().mainColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Max. size",
                              style: textApp.extraSmallLabel.copyWith(
                                color: ColorApp().dark1,
                              ),
                            ),
                            SizedBox(
                              height: 30,
                              width: 80,
                              child: TextField(
                                cursorColor: ColorApp().mainColor,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(
                                        color: ColorApp().mainColor,
                                      )),
                                  contentPadding: const EdgeInsets.only(
                                    bottom: 5.0,
                                    left: 5.0,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(
                                      color: ColorApp().mainColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorApp().stateError,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            "Delete",
                            style: textApp.bodySmall.copyWith(
                              color: ColorApp().light4,
                            ),
                          ),
                        ),
                        const Spacer(),
                        SizedBox(
                          height: 40,
                          width: 250,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ColorApp().mainColor,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              "Search",
                              style: textApp.bodySmall.copyWith(
                                color: ColorApp().light4,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class RecommendedCardWidget extends StatelessWidget {
  RecommendedCardWidget({
    super.key,
  });

  TextCollection textApp = TextCollection();

  @override
  Widget build(BuildContext context) {
    return ListView(
      // ganti pakai listview builder nanti
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        SizedBox(
          width: 180,
          child: Container(
            margin: const EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: ColorApp().dark4,
                  offset: const Offset(1, 1),
                  spreadRadius: 1,
                  blurRadius: 1.0,
                )
              ],
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 130,
                  child: Image.network(
                    "https://images.unsplash.com/photo-1587293852726-70cdb56c2866?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8d2FyZWhvdXNlfGVufDB8fDB8fHww",
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Warehouse Abadi",
                        style: TextCollection()
                            .bodyNormal
                            .copyWith(color: ColorApp().dark1, fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Jakarta Barat",
                        style: TextCollection().bodySmall.copyWith(
                              color: ColorApp().dark1,
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                            ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "RP.10 Jt/bln",
                        style: TextCollection().bodyNormal.copyWith(
                              color: ColorApp().secondaryColor,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 5),
        SizedBox(
          width: 180,
          child: Container(
            margin: const EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: ColorApp().dark4,
                  offset: const Offset(1, 1),
                  spreadRadius: 1,
                  blurRadius: 1.0,
                )
              ],
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 130,
                  child: Image.network(
                    "https://images.unsplash.com/photo-1587293852726-70cdb56c2866?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8d2FyZWhvdXNlfGVufDB8fDB8fHww",
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Warehouse Abadi",
                        style: TextCollection()
                            .bodyNormal
                            .copyWith(color: ColorApp().dark1, fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Jakarta Barat",
                        style: TextCollection().bodySmall.copyWith(
                              color: ColorApp().dark1,
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                            ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "RP.10 Jt/bln",
                        style: TextCollection().bodyNormal.copyWith(
                              color: ColorApp().secondaryColor,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 5),
        SizedBox(
          width: 180,
          child: Container(
            margin: const EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: ColorApp().dark4,
                  offset: const Offset(1, 1),
                  spreadRadius: 1,
                  blurRadius: 1.0,
                )
              ],
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 130,
                  child: Image.network(
                    "https://images.unsplash.com/photo-1587293852726-70cdb56c2866?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8d2FyZWhvdXNlfGVufDB8fDB8fHww",
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Warehouse Abadi",
                        style: TextCollection()
                            .bodyNormal
                            .copyWith(color: ColorApp().dark1, fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Jakarta Barat",
                        style: TextCollection().bodySmall.copyWith(
                              color: ColorApp().dark1,
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                            ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "RP.10 Jt/bln",
                        style: TextCollection().bodyNormal.copyWith(
                              color: ColorApp().secondaryColor,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 5),
        SizedBox(
          width: 180,
          child: Container(
            margin: const EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: ColorApp().dark4,
                  offset: const Offset(1, 1),
                  spreadRadius: 1,
                  blurRadius: 1.0,
                )
              ],
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 130,
                  child: Image.network(
                    "https://images.unsplash.com/photo-1587293852726-70cdb56c2866?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8d2FyZWhvdXNlfGVufDB8fDB8fHww",
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Warehouse Abadi",
                        style: TextCollection()
                            .bodyNormal
                            .copyWith(color: ColorApp().dark1, fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Jakarta Barat",
                        style: TextCollection().bodySmall.copyWith(
                              color: ColorApp().dark1,
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                            ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "RP.10 Jt/bln",
                        style: TextCollection().bodyNormal.copyWith(
                              color: ColorApp().secondaryColor,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 5),
        SizedBox(
          width: 180,
          child: Container(
            margin: const EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: ColorApp().dark4,
                  offset: const Offset(1, 1),
                  spreadRadius: 1,
                  blurRadius: 1.0,
                )
              ],
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 130,
                  child: Image.network(
                    "https://images.unsplash.com/photo-1587293852726-70cdb56c2866?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8d2FyZWhvdXNlfGVufDB8fDB8fHww",
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Warehouse Abadi",
                        style: TextCollection()
                            .bodyNormal
                            .copyWith(color: ColorApp().dark1, fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Jakarta Barat",
                        style: TextCollection().bodySmall.copyWith(
                              color: ColorApp().dark1,
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                            ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "RP.10 Jt/bln",
                        style: TextCollection().bodyNormal.copyWith(
                              color: ColorApp().secondaryColor,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 5),
        SizedBox(
          width: 180,
          child: Container(
            margin: const EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: ColorApp().dark4,
                  offset: const Offset(1, 1),
                  spreadRadius: 1,
                  blurRadius: 1.0,
                )
              ],
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 130,
                  child: Image.network(
                    "https://images.unsplash.com/photo-1587293852726-70cdb56c2866?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8d2FyZWhvdXNlfGVufDB8fDB8fHww",
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Warehouse Abadi",
                        style: TextCollection()
                            .bodyNormal
                            .copyWith(color: ColorApp().dark1, fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Jakarta Barat",
                        style: TextCollection().bodySmall.copyWith(
                              color: ColorApp().dark1,
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                            ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "RP.10 Jt/bln",
                        style: TextCollection().bodyNormal.copyWith(
                              color: ColorApp().secondaryColor,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 5),
      ],
    );
  }
}

class BannerWidget extends StatelessWidget {
  //ini nanti bisa dipindah ke folder widget/component biar ga panjang" main file nya
  BannerWidget({
    super.key,
  });

  TextCollection textApp = TextCollection();

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        Container(
          height: 155,
          width: 370,
          decoration: BoxDecoration(
            color: ColorApp().mainColorLighter,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 155,
                    width: 370,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        "https://images.unsplash.com/photo-1586528116311-ad8dd3c8310d?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8d2FyZWhvdXNlfGVufDB8fDB8fHww",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.only(left: 10),
                      height: 165,
                      width: 165,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(80),
                          bottomLeft: Radius.circular(80),
                          topRight: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                        color: ColorApp().mainColor,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "DigiHouse 11.11",
                            style: textApp.smallLabel.copyWith(
                              color: ColorApp().light4,
                            ),
                          ),
                          Text(
                            "DISKON",
                            style: textApp.heading5.copyWith(
                              color: ColorApp().light4,
                            ),
                          ),
                          Text(
                            "RP.2.000.000",
                            style: textApp.heading6
                                .copyWith(color: ColorApp().light4),
                          ),
                          const SizedBox(height: 3),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 2),
                            height: 20,
                            width: 120,
                            decoration: BoxDecoration(
                              color: ColorApp().light3,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              "Gudang, Purwokerto",
                              style: textApp.extraSmallLabel.copyWith(
                                color: ColorApp().secondaryColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            "11-15 November",
                            style: textApp.extraSmallLabel.copyWith(
                              color: ColorApp().light4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        Container(
          height: 155,
          width: 370,
          decoration: BoxDecoration(
            color: ColorApp().mainColorLighter,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 155,
                    width: 370,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        "https://images.unsplash.com/photo-1589792923962-537704632910?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzB8fHdhcmVob3VzZXxlbnwwfHwwfHx8MA%3D%3D",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.only(left: 10),
                      height: 165,
                      width: 165,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(80),
                          bottomLeft: Radius.circular(80),
                          topRight: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                        color: ColorApp().mainColor,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "DigiHouse 11.11",
                            style: textApp.smallLabel.copyWith(
                              color: ColorApp().light4,
                            ),
                          ),
                          Text(
                            "DISKON",
                            style: textApp.heading5.copyWith(
                              color: ColorApp().light4,
                            ),
                          ),
                          Text(
                            "RP.2.000.000",
                            style: textApp.heading6
                                .copyWith(color: ColorApp().light4),
                          ),
                          const SizedBox(height: 3),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 2),
                            height: 20,
                            width: 120,
                            decoration: BoxDecoration(
                              color: ColorApp().light3,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              "Gudang, Purwokerto",
                              style: textApp.extraSmallLabel.copyWith(
                                color: ColorApp().secondaryColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            "11-15 November",
                            style: textApp.extraSmallLabel.copyWith(
                              color: ColorApp().light4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        Container(
          height: 155,
          width: 370,
          decoration: BoxDecoration(
            color: ColorApp().mainColorLighter,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 155,
                    width: 370,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        "https://images.unsplash.com/photo-1586528116493-a029325540fa?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDB8fHdhcmVob3VzZXxlbnwwfHwwfHx8MA%3D%3D",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.only(left: 10),
                      height: 165,
                      width: 165,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(80),
                          bottomLeft: Radius.circular(80),
                          topRight: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                        color: ColorApp().mainColor,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "DigiHouse 11.11",
                            style: textApp.smallLabel.copyWith(
                              color: ColorApp().light4,
                            ),
                          ),
                          Text(
                            "DISKON",
                            style: textApp.heading5.copyWith(
                              color: ColorApp().light4,
                            ),
                          ),
                          Text(
                            "RP.2.000.000",
                            style: textApp.heading6
                                .copyWith(color: ColorApp().light4),
                          ),
                          const SizedBox(height: 3),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 2),
                            height: 20,
                            width: 120,
                            decoration: BoxDecoration(
                              color: ColorApp().light3,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              "Gudang, Purwokerto",
                              style: textApp.extraSmallLabel.copyWith(
                                color: ColorApp().secondaryColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            "11-15 November",
                            style: textApp.extraSmallLabel.copyWith(
                              color: ColorApp().light4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
