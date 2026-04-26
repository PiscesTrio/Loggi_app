import 'package:loggi_app/app/data/models/inventory.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/color_palette.dart';
import '../widgets/toast.dart';
import 'index.dart';

class WarehouseinventoryPage extends GetView<WarehouseinventoryController> {
  WarehouseinventoryPage({Key? key, required this.warehouseId})
      : super(key: key);
  final String warehouseId;
  List<DataRow> getRows(List<Inventory>? inventorys) =>
      inventorys!.map((Inventory inventory) {
        final cells = [inventory.name, inventory.count];
        return DataRow(
            onSelectChanged: (value) {
              Get.back(id: 5);
            },
            cells: getCells(cells));
      }).toList();
  final RxBool _isLoading = false.obs;

  List<DataCell> getCells(List<dynamic> cells) => cells.map((data) {
        if (data is num) {
          return DataCell(
            Container(
                height: 25,
                width: 50,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(32, 108, 190, 1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Center(
                  child: Text(
                    '$data',
                    maxLines: 1,
                    style: const TextStyle(
                      fontFamily: "Nunito",
                      fontSize: 14,
                      color: ColorPalette.white,
                    ),
                  ),
                )),
          );
        } else {
          return DataCell(Text('$data'));
        }
      }).toList();

  Widget buildDataTable() {
    return controller.obx((data) => Obx(() => DataTable(
        showCheckboxColumn: false,
        sortColumnIndex: controller.sortColumnIndex.value,
        sortAscending: controller.isAscending.value,
        columns: [
          DataColumn(label: const Text("名称"), onSort: onSort),
          DataColumn(label: const Text("数量"), onSort: onSort),
        ],
        rows: getRows(data))));
  }

  void onSort(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      controller.commo.sort((inventory1, inventory2) =>
          compareString(ascending, inventory1.name, inventory2.name));
    } else if (columnIndex == 1) {
      controller.commo.sort((inventory1, inventory2) =>
          compareNum(ascending, inventory1.count, inventory2.count));
    }
    controller.onSortList();
    controller.onSort(columnIndex, ascending);
  }

  int compareString(bool ascending, String? value1, String? value2) =>
      ascending ? value1!.compareTo(value2!) : value2!.compareTo(value1!);
  int compareNum(bool ascending, num? value1, num? value2) =>
      ascending ? value1!.compareTo(value2!) : value2!.compareTo(value1!);

  @override
  Widget build(BuildContext context) {
    controller.warehouseId(warehouseId);
    return Scaffold(
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(
            bottom: 0,
            right: 0,
          ),
          child: FloatingActionButton(
            onPressed: () {
              Get.back(id: 5);
            },
            splashColor: ColorPalette.bondyBlue,
            backgroundColor: ColorPalette.pacificBlue,
            child: const Icon(
              Icons.arrow_back,
              color: ColorPalette.white,
            ),
          ),
        ),
        body: Container(
            alignment: Alignment.topLeft,
            color: ColorPalette.aquaHaze,
            child: Scrollbar(
                child: RefreshIndicator(
              onRefresh: () {
                return Future(() {
                  controller.updateData();
                });
              },
              child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    barrierDismissible: true,
                                    builder: (context) {
                                      return Scaffold(
                                          backgroundColor:
                                              const Color(0x1E000000), //设置为透明色
                                          body: Center(
                                            //整体居中
                                            child: Container(
                                              decoration: const BoxDecoration(
                                                //优化dialog，不需要圆角删除
                                                shape: BoxShape.rectangle,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(18)),
                                                color: Colors.white,
                                              ),
                                              child: UnconstrainedBox(
                                                constrainedAxis:
                                                    Axis.horizontal,
                                                child: SizedBox(
                                                    height: 400,
                                                    child: Dialog(
                                                      insetPadding:
                                                          EdgeInsets.zero,
                                                      child: Container(
                                                        height: 400,
                                                        child: Column(
                                                          children: [
                                                            const SizedBox(
                                                              height: 20,
                                                            ),
                                                            Row(
                                                              children: [
                                                                const Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .only(
                                                                    left: 20,
                                                                    bottom: 5,
                                                                  ),
                                                                  child: Text(
                                                                    "选择商品",
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          "Nunito",
                                                                      fontSize:
                                                                          20,
                                                                      color: ColorPalette
                                                                          .nileBlue,
                                                                    ),
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  width: 20,
                                                                ),
                                                                Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: ColorPalette
                                                                          .white,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              15),
                                                                      boxShadow: [
                                                                        BoxShadow(
                                                                          offset: const Offset(
                                                                              0,
                                                                              3),
                                                                          blurRadius:
                                                                              6,
                                                                          color: ColorPalette
                                                                              .nileBlue
                                                                              .withOpacity(0.1),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    padding: const EdgeInsets
                                                                            .symmetric(
                                                                        horizontal:
                                                                            15,
                                                                        vertical:
                                                                            2.5),
                                                                    child: controller.obx((data) =>
                                                                        Obx(() =>
                                                                            DropdownButton(
                                                                              iconSize: 30,
                                                                              underline: const SizedBox(),
                                                                              value: controller.selectedCommo.value,
                                                                              onChanged: (dynamic newValue) {
                                                                                controller.selectedCommo(newValue);
                                                                                controller.inventoryRecord.update((self) {
                                                                                  self!.cid = newValue.id;
                                                                                  self.name = newValue.name;
                                                                                });
                                                                              },
                                                                              items: controller.commoList.map((process) {
                                                                                return DropdownMenuItem(
                                                                                  value: process,
                                                                                  child: Text(
                                                                                    process.name!,
                                                                                    style: TextStyle(
                                                                                      fontFamily: "Nunito",
                                                                                      fontSize: 16,
                                                                                      color: ColorPalette.nileBlue.withOpacity(0.58),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              }).toList(),
                                                                            ))))
                                                              ],
                                                            ),
                                                            const SizedBox(
                                                              height: 10,
                                                            ),
                                                            Container(
                                                              margin: const EdgeInsets
                                                                      .fromLTRB(
                                                                  20,
                                                                  0,
                                                                  170,
                                                                  0),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color:
                                                                    ColorPalette
                                                                        .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12),
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    offset:
                                                                        const Offset(
                                                                            0,
                                                                            3),
                                                                    blurRadius:
                                                                        6,
                                                                    color: ColorPalette
                                                                        .nileBlue
                                                                        .withOpacity(
                                                                            0.1),
                                                                  ),
                                                                ],
                                                              ),
                                                              height: 50,
                                                              child:
                                                                  TextFormField(
                                                                onChanged:
                                                                    (value) {
                                                                  controller
                                                                      .inventoryRecord
                                                                      .update(
                                                                          (val) {
                                                                    val!.count =
                                                                        int.parse(
                                                                            value);
                                                                  });
                                                                },
                                                                // textInputAction: TextInputAction.next,
                                                                key:
                                                                    UniqueKey(),
                                                                keyboardType:
                                                                    TextInputType
                                                                        .text,
                                                                style:
                                                                    const TextStyle(
                                                                  fontFamily:
                                                                      "Nunito",
                                                                  fontSize: 16,
                                                                  color: ColorPalette
                                                                      .nileBlue,
                                                                ),
                                                                decoration:
                                                                    InputDecoration(
                                                                  border:
                                                                      InputBorder
                                                                          .none,
                                                                  hintText:
                                                                      "数量",
                                                                  filled: true,
                                                                  fillColor: Colors
                                                                      .transparent,
                                                                  hintStyle:
                                                                      TextStyle(
                                                                    fontFamily:
                                                                        "Nunito",
                                                                    fontSize:
                                                                        16,
                                                                    color: ColorPalette
                                                                        .nileBlue
                                                                        .withOpacity(
                                                                            0.58),
                                                                  ),
                                                                ),
                                                                cursorColor:
                                                                    ColorPalette
                                                                        .timberGreen,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              height: 10,
                                                            ),
                                                            Container(
                                                              margin: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      20),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color:
                                                                    ColorPalette
                                                                        .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12),
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    offset:
                                                                        const Offset(
                                                                            0,
                                                                            3),
                                                                    blurRadius:
                                                                        6,
                                                                    color: ColorPalette
                                                                        .nileBlue
                                                                        .withOpacity(
                                                                            0.1),
                                                                  ),
                                                                ],
                                                              ),
                                                              height: 160,
                                                              child:
                                                                  TextFormField(
                                                                maxLines: 7,
                                                                minLines: 3,

                                                                onChanged:
                                                                    (value) {
                                                                  controller
                                                                      .inventoryRecord
                                                                      .update(
                                                                          (val) {
                                                                    val!.description =
                                                                        value;
                                                                  });
                                                                },
                                                                // textInputAction: TextInputAction.next,
                                                                key:
                                                                    UniqueKey(),
                                                                keyboardType:
                                                                    TextInputType
                                                                        .text,
                                                                style:
                                                                    const TextStyle(
                                                                  fontFamily:
                                                                      "Nunito",
                                                                  fontSize: 16,
                                                                  color: ColorPalette
                                                                      .nileBlue,
                                                                ),
                                                                decoration:
                                                                    InputDecoration(
                                                                  border:
                                                                      InputBorder
                                                                          .none,
                                                                  hintText:
                                                                      "备注",
                                                                  filled: true,
                                                                  fillColor: Colors
                                                                      .transparent,
                                                                  hintStyle:
                                                                      TextStyle(
                                                                    fontFamily:
                                                                        "Nunito",
                                                                    fontSize:
                                                                        16,
                                                                    color: ColorPalette
                                                                        .nileBlue
                                                                        .withOpacity(
                                                                            0.58),
                                                                  ),
                                                                ),
                                                                cursorColor:
                                                                    ColorPalette
                                                                        .timberGreen,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              height: 20,
                                                            ),
                                                            Row(
                                                              children: [
                                                                 const SizedBox(
                                                                  width: 20,
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Container(
                                                                    height: 50,
                                                                    child:
                                                                        OutlinedButton(
                                                                      onPressed:
                                                                          () {
                                                                        Navigator.pop(
                                                                            context);
                                                                      },
                                                                      child: const Text(
                                                                          "取消"),
                                                                    ),
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  width: 20,
                                                                ),
                                                                Expanded(
                                                                  child: Container(
                                                                      height: 50,
                                                                      child: Obx(() => ElevatedButton(
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
                                                                            onPressed:
                                                                                () async {
                                                                              if (controller.inventoryRecord.value.count == null) {
                                                                                showTextToast("请填写数量");
                                                                              } else {
                                                                                _isLoading(true);
                                                                                await controller.submitInven().then((value) {
                                                                                  if (value) {
                                                                                    _isLoading(false);
                                                                                    controller.updateData();
                                                                                    showTextToast("提交成功");
                                                                                    Navigator.pop(context);
                                                                                  } else {
                                                                                    _isLoading(false);
                                                                                  }
                                                                                });
                                                                              }
                                                                            },
                                                                          ))),
                                                                ),
                                                                 const SizedBox(
                                                                  width: 20,
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    )),
                                              ),
                                            ),
                                          ));
                                    });
                              },
                              child: const Text("入库")),
                          ElevatedButton(
                              onPressed: () {
                               

                                if(controller.commo.isEmpty){
                                  showTextToast("仓库为空");
                                }else{
                                showDialog(
                                    context: context,
                                    barrierDismissible: true,
                                    builder: (context) {
                                      return Scaffold(
                                          backgroundColor:
                                              const Color(0x1E000000), //设置为透明色
                                          body: Center(
                                            //整体居中
                                            child: Container(
                                              decoration: const BoxDecoration(
                                                //优化dialog，不需要圆角删除
                                                shape: BoxShape.rectangle,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(18)),
                                                color: Colors.white,
                                              ),
                                              child: UnconstrainedBox(
                                                constrainedAxis:
                                                    Axis.horizontal,
                                                child: SizedBox(
                                                    height: 400,
                                                    child: Dialog(
                                                      insetPadding:
                                                          EdgeInsets.zero,
                                                      child: Container(
                                                        height: 400,
                                                        child: Column(
                                                          children: [
                                                            const SizedBox(
                                                              height: 20,
                                                            ),
                                                            Row(
                                                              children: [
                                                                const Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .only(
                                                                    left: 20,
                                                                    bottom: 5,
                                                                  ),
                                                                  child: Text(
                                                                    "选择商品",
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          "Nunito",
                                                                      fontSize:
                                                                          20,
                                                                      color: ColorPalette
                                                                          .nileBlue,
                                                                    ),
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  width: 20,
                                                                ),
                                                                Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: ColorPalette
                                                                          .white,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              15),
                                                                      boxShadow: [
                                                                        BoxShadow(
                                                                          offset: const Offset(
                                                                              0,
                                                                              3),
                                                                          blurRadius:
                                                                              6,
                                                                          color: ColorPalette
                                                                              .nileBlue
                                                                              .withOpacity(0.1),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    padding: const EdgeInsets
                                                                            .symmetric(
                                                                        horizontal:
                                                                            15,
                                                                        vertical:
                                                                            2.5),
                                                                    child: controller.obx((data) =>
                                                                        Obx(() =>
                                                                            DropdownButton(
                                                                              iconSize: 30,
                                                                              underline: const SizedBox(),
                                                                              value: controller.selectedCommoOut.value,
                                                                              onChanged: (dynamic newValue) {
                                                                                controller.selectedCommoOut(newValue);
                                                                                controller.inventoryRecordOut.update((self) {
                                                                                  self!.cid = newValue.cid;
                                                                                  self.name = newValue.name;
                                                                                });
                                                                                print(controller.inventoryRecordOut.value.cid);
                                                                                print(controller.inventoryRecordOut.value.name);
                                                                              },
                                                                              items: controller.commo.map((process) {
                                                                                return DropdownMenuItem(
                                                                                  value: process,
                                                                                  child: Text(
                                                                                    process.name!,
                                                                                    style: TextStyle(
                                                                                      fontFamily: "Nunito",
                                                                                      fontSize: 16,
                                                                                      color: ColorPalette.nileBlue.withOpacity(0.58),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              }).toList(),
                                                                            ))))
                                                              ],
                                                            ),
                                                            const SizedBox(
                                                              height: 10,
                                                            ),
                                                            Container(
                                                              margin: const EdgeInsets
                                                                      .fromLTRB(
                                                                  20,
                                                                  0,
                                                                  170,
                                                                  0),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color:
                                                                    ColorPalette
                                                                        .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12),
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    offset:
                                                                        const Offset(
                                                                            0,
                                                                            3),
                                                                    blurRadius:
                                                                        6,
                                                                    color: ColorPalette
                                                                        .nileBlue
                                                                        .withOpacity(
                                                                            0.1),
                                                                  ),
                                                                ],
                                                              ),
                                                              height: 50,
                                                              child:
                                                                  TextFormField(
                                                                onChanged:
                                                                    (value) {
                                                                  controller
                                                                      .inventoryRecordOut
                                                                      .update(
                                                                          (val) {
                                                                    val!.count =
                                                                        int.parse(
                                                                            value);
                                                                  });
                                                                },
                                                                // textInputAction: TextInputAction.next,
                                                                key:
                                                                    UniqueKey(),
                                                                keyboardType:
                                                                    TextInputType
                                                                        .text,
                                                                style:
                                                                    const TextStyle(
                                                                  fontFamily:
                                                                      "Nunito",
                                                                  fontSize: 16,
                                                                  color: ColorPalette
                                                                      .nileBlue,
                                                                ),
                                                                decoration:
                                                                    InputDecoration(
                                                                  border:
                                                                      InputBorder
                                                                          .none,
                                                                  hintText:
                                                                      "数量",
                                                                  filled: true,
                                                                  fillColor: Colors
                                                                      .transparent,
                                                                  hintStyle:
                                                                      TextStyle(
                                                                    fontFamily:
                                                                        "Nunito",
                                                                    fontSize:
                                                                        16,
                                                                    color: ColorPalette
                                                                        .nileBlue
                                                                        .withOpacity(
                                                                            0.58),
                                                                  ),
                                                                ),
                                                                cursorColor:
                                                                    ColorPalette
                                                                        .timberGreen,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              height: 10,
                                                            ),
                                                            Container(
                                                              margin: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      20),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color:
                                                                    ColorPalette
                                                                        .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12),
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    offset:
                                                                        const Offset(
                                                                            0,
                                                                            3),
                                                                    blurRadius:
                                                                        6,
                                                                    color: ColorPalette
                                                                        .nileBlue
                                                                        .withOpacity(
                                                                            0.1),
                                                                  ),
                                                                ],
                                                              ),
                                                              height: 160,
                                                              child:
                                                                  TextFormField(
                                                                maxLines: 7,
                                                                minLines: 3,

                                                                onChanged:
                                                                    (value) {
                                                                  controller
                                                                      .inventoryRecordOut
                                                                      .update(
                                                                          (val) {
                                                                    val!.description =
                                                                        value;
                                                                  });
                                                                },
                                                                // textInputAction: TextInputAction.next,
                                                                key:
                                                                    UniqueKey(),
                                                                keyboardType:
                                                                    TextInputType
                                                                        .text,
                                                                style:
                                                                    const TextStyle(
                                                                  fontFamily:
                                                                      "Nunito",
                                                                  fontSize: 16,
                                                                  color: ColorPalette
                                                                      .nileBlue,
                                                                ),
                                                                decoration:
                                                                    InputDecoration(
                                                                  border:
                                                                      InputBorder
                                                                          .none,
                                                                  hintText:
                                                                      "备注",
                                                                  filled: true,
                                                                  fillColor: Colors
                                                                      .transparent,
                                                                  hintStyle:
                                                                      TextStyle(
                                                                    fontFamily:
                                                                        "Nunito",
                                                                    fontSize:
                                                                        16,
                                                                    color: ColorPalette
                                                                        .nileBlue
                                                                        .withOpacity(
                                                                            0.58),
                                                                  ),
                                                                ),
                                                                cursorColor:
                                                                    ColorPalette
                                                                        .timberGreen,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              height: 20,
                                                            ),
                                                            Row(
                                                              children: [
                                                                 const SizedBox(
                                                                  width: 20,
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Container(
                                                                    height: 50,
                                                                    child:
                                                                        OutlinedButton(
                                                                      onPressed:
                                                                          () {
                                                                        Navigator.pop(
                                                                            context);
                                                                      },
                                                                      child: const Text(
                                                                          "取消"),
                                                                    ),
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  width: 20,
                                                                ),
                                                                Expanded(
                                                                  child: Container(
                                                                      height: 50,
                                                                      child: Obx(() => ElevatedButton(
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
                                                                            onPressed:
                                                                                () async {
                                                                              if (controller.inventoryRecordOut.value.count == null) {
                                                                                showTextToast("请填写数量");
                                                                              } else {
                                                                                _isLoading(true);
                                                                                await controller.submitOutven().then((value) {
                                                                                  if (value) {
                                                                                    _isLoading(false);
                                                                                    controller.updateData();
                                                                                    showTextToast("提交成功");
                                                                                    Navigator.pop(context);
                                                                                  } else {
                                                                                    _isLoading(false);
                                                                                  }
                                                                                });
                                                                              }
                                                                            },
                                                                          ))),
                                                                ),
                                                                 const SizedBox(
                                                                  width: 20,
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    )),
                                              ),
                                            ),
                                          ));
                                    });
                              }
                              }, child: const Text("出库"))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          buildDataTable(),
                        ],
                      ),
                      SizedBox(
                        height: 1000,
                        child: Container(
                          color: ColorPalette.aquaHaze,
                        ),
                      )
                    ],
                  )),
            ))));
  }
}
