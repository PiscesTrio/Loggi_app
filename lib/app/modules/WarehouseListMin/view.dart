import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/api/warehouse_request.dart';

import '../../theme/color_palette.dart';
import '../widgets/toast.dart';
import '../widgets/warehouse_card.dart';
import 'index.dart';

class WarehouselistminPage extends GetView<WarehouselistminController> {
  const WarehouselistminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WarehouselistminController>(
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
                      var principleController = TextEditingController();
                      var locationController = TextEditingController();
                      var warehouseNameController = TextEditingController();
                      return AlertDialog(
                        scrollable: true,
                        title: const Text('添加仓库'),
                        content: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Form(
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  controller: warehouseNameController,
                                  decoration: const InputDecoration(
                                    labelText: '仓库名',
                                    icon: Icon(Icons.warehouse),
                                  ),
                                ),
                                TextFormField(
                                  controller: principleController,
                                  decoration: const InputDecoration(
                                    labelText: '负责人',
                                    icon: Icon(Icons.account_circle),
                                  ),
                                ),
                                TextFormField(
                                  controller: locationController,
                                  decoration: const InputDecoration(
                                    labelText: '地址',
                                    icon: Icon(Icons.place),
                                  ),
                                ),
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
                          GestureDetector(
                            onTap: () async {
                                await controller
                                    .saveWarehouse(WarehouseRequest(
                                  name: warehouseNameController.text,
                                  principle: principleController.text,
                                  location: locationController.text,
                                ))
                                    .then((value) {
                                
                                

                                if(value){
                                  showTextToast("保存成功");
                                // The await above may outlive this widget; popping a dead context throws.
                                if (!context.mounted) return;
                                Navigator.pop(context);

                                }else{
                                  
                                }
                                
                              },);
                                
                              
                            },
                            child: Container(
                              height: 50,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: ColorPalette.pacificBlue,
                                boxShadow: [
                                  BoxShadow(
                                    offset: const Offset(0, 3),
                                    blurRadius: 6,
                                    color: const Color(0xff000000)
                                        .withValues(alpha: 0.16),
                                  ),
                                ],
                              ),
                              child: Obx(() => Center(
                                    child: controller.saveWarehouseLoading.value
                                        ? const SizedBox(
                                            height: 15,
                                            width: 15,
                                            child: CircularProgressIndicator(
                                              strokeWidth: 2,
                                              color: ColorPalette.aquaHaze,
                                            ),
                                          )
                                        : const Text(
                                            "确认",
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontFamily: "Nunito",
                                              color: ColorPalette.white,
                                            ),
                                          ),
                                  )),
                            ),
                          ),
                        ],
                      );
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
            child:RefreshIndicator(
              onRefresh: () {
                return Future(() {
                  controller.updateData();
                });
              },
              child: controller.obx(
                (data) => ListView.builder(
                    itemCount: data?.length,
                    itemBuilder: (context, index) {
                      return WarehouseCard(
                        warehouse: data![index], iconIndex: index,
                      );
                    }),
              ))),
        );
      },
    );
  }
}
