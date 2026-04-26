import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/network/api.dart';
import '../../theme/color_palette.dart';
import '../widgets/toast.dart';
import '../widgets/vehicle_card.dart';
import '../widgets/vehicle_card_min.dart';
import 'index.dart';

class VehicleListPage extends GetView<VehicleListController> {
  VehicleListPage({Key? key}) : super(key: key);
  final RxBool _isLoading = false.obs;

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem> sb = <String>["货车", "卡车", "重卡"].map((e) {
      return DropdownMenuItem(child: Text(e));
    }).toList();
    return GetBuilder<VehicleListController>(
      builder: (_) {
        return Scaffold(
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(
              bottom: 0,
              right: 0,
            ),
            child: FloatingActionButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Obx(()=>AlertDialog(
                        scrollable: true,
                        title: const Text('添加车辆'),
                        content: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Form(
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  onChanged: (value) =>
                                      controller.vehicle.update((val) {
                                    val!.number = value;
                                  }),
                                  decoration: const InputDecoration(
                                    labelText: '车牌号',
                                    icon: Icon(Icons.add_circle_rounded),
                                  ),
                                ),
                                SizedBox(height: 20,),
                                Row(
                                  children: [
                                    Text("类型：",style: TextStyle(
                                        fontFamily: "Nunito",
                                        fontSize: 20,
                                        color: ColorPalette.nileBlue,
                                      ),),
                                      SizedBox(width: 10,),
                                    DropdownButton(
                                  items: 
                                    <String>["货车", "卡车", "重卡"].map((e) {
                                      return DropdownMenuItem(value: e,child: Text(e),);
                                    }).toList(),
                                  
                                  iconSize: 30,
                                  underline: const SizedBox(),
                                  value: controller.vehicle.value.type,
                                  onChanged: (dynamic value) =>
                                      controller.vehicle.update((val) {
                                    val!.type = value;
                                  }),
                                )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        actions: [
                          OutlinedButton(
                              child: const Text("取消"),
                              onPressed: () {
                                Navigator.pop(context);
                              }),
                          Obx(() => ElevatedButton(
                              child: _isLoading.value
                                  ? const SizedBox(
                                      height: 15,
                                      width: 15,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                      ),
                                    )
                                  : const Text(
                                      "确认",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: "Nunito",
                                      ),
                                    ),
                              onPressed: () async {
                                _isLoading(true);
                                await NbRequest().saveVehicle(controller.vehicle.value)
                                    .then((value) {
                                  if (value) {
                                    _isLoading(false);
                                    showTextToast("提交成功");
                                    controller.updateData();
                                    Navigator.pop(context);
                                  } else {
                                    _isLoading(false);
                                  }
                                });
                              }))
                        ],
                      ));
                    });
              },
              splashColor: ColorPalette.bondyBlue,
              backgroundColor: ColorPalette.pacificBlue,
              child: const Icon(
                Icons.add,
                color: ColorPalette.white,
              ),
            ),
          ),
          body: Container(
              color: ColorPalette.aquaHaze,
              child: RefreshIndicator(
                  onRefresh: () {
                    return Future(() {
                      controller.updateData();
                    });
                  },
                  child: controller.obx(
                    (data) => GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.2,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                      ),
                      itemCount: data?.length,
                      itemBuilder: (context, index) {
                        return VehicleMinCard(
                          vehicle: data![index],
                          key: UniqueKey(),
                        );
                      },
                    ),
                  ))),
        );
      },
    );
  }
}
