import 'package:loggi_app/app/data/delivery_points.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/color_palette.dart';
import '../widgets/toast.dart';
import 'index.dart';
import 'package:intl/intl.dart';
import '../../utils/date_time_extension.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:loggi_app/app/data/network/container_access.dart';
import 'package:loggi_app/app/modules/distribution_list/providers.dart';

class DistributionApplyPage extends GetView<DistributionApplyController> {
  DistributionApplyPage({super.key});
  final RxBool _isLoading = false.obs;

  static final List<String> _care = [
    "易碎",
    "防潮",
    "防晒",
    "防高温",
    "禁止翻滚",
    "禁止堆码",
    "冷藏",
    "易燃",
  ];
  final _items =
      _care.map((care) => MultiSelectItem<String>(care, care)).toList();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DistributionApplyController>(
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                          height: double.infinity,
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 20,
                          ),
                          margin: const EdgeInsets.only(top: 20),
                          decoration: const BoxDecoration(
                            color: ColorPalette.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16),
                            ),
                          ),
                          child: SingleChildScrollView(
                              child: Column(
                            children: [
                              Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(
                                      left: 8,
                                      bottom: 5,
                                    ),
                                    child: Text(
                                      "驾驶员",
                                      style: TextStyle(
                                        fontFamily: "Nunito",
                                        fontSize: 20,
                                        color: ColorPalette.nileBlue,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                      decoration: BoxDecoration(
                                        color: ColorPalette.white,
                                        borderRadius: BorderRadius.circular(15),
                                        boxShadow: [
                                          BoxShadow(
                                            offset: const Offset(0, 3),
                                            blurRadius: 6,
                                            color: ColorPalette.nileBlue
                                                .withValues(alpha: 0.1),
                                          ),
                                        ],
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 2.5),
                                      child: controller.obx(
                                          (data) => Obx(() => DropdownButton(
                                                iconSize: 30,
                                                underline: const SizedBox(),
                                                value: controller
                                                    .selectedDriver.value,
                                                onChanged: (dynamic newValue) {
                                                  controller
                                                      .selectedDriver(newValue);
                                                  controller.distribution
                                                          .value =
                                                      controller
                                                          .distribution.value
                                                          .copyWith(
                                                          driver: newValue.name,
                                                          did: newValue.id);
                                                },
                                                items: data!.drivers!
                                                    .map((process) {
                                                  return DropdownMenuItem(
                                                    value: process,
                                                    child: Text(
                                                      process.name!,
                                                      style: TextStyle(
                                                        fontFamily: "Nunito",
                                                        fontSize: 16,
                                                        color: ColorPalette
                                                            .nileBlue
                                                            .withValues(alpha: 0.58),
                                                      ),
                                                    ),
                                                  );
                                                }).toList(),
                                              )))),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(
                                      left: 8,
                                      bottom: 5,
                                    ),
                                    child: Text(
                                      "车辆",
                                      style: TextStyle(
                                        fontFamily: "Nunito",
                                        fontSize: 20,
                                        color: ColorPalette.nileBlue,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                      decoration: BoxDecoration(
                                        color: ColorPalette.white,
                                        borderRadius: BorderRadius.circular(15),
                                        boxShadow: [
                                          BoxShadow(
                                            offset: const Offset(0, 3),
                                            blurRadius: 6,
                                            color: ColorPalette.nileBlue
                                                .withValues(alpha: 0.1),
                                          ),
                                        ],
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 2.5),
                                      child: controller.obx(
                                          (data) => Obx(() => DropdownButton(
                                                iconSize: 30,
                                                underline: const SizedBox(),
                                                value: controller
                                                    .selectedVehicle.value,
                                                onChanged: (dynamic newValue) {
                                                  controller.selectedVehicle(
                                                      newValue);
                                                  controller.distribution
                                                          .value =
                                                      controller
                                                          .distribution.value
                                                          .copyWith(
                                                          number:
                                                              newValue.number,
                                                          vid: newValue.id);
                                                },
                                                items: data!.vehicles!
                                                    .map((process) {
                                                  return DropdownMenuItem(
                                                    value: process,
                                                    child: Text(
                                                      "${process.type}：${process.number}",
                                                      style: TextStyle(
                                                        fontFamily: "Nunito",
                                                        fontSize: 16,
                                                        color: ColorPalette
                                                            .nileBlue
                                                            .withValues(alpha: 0.58),
                                                      ),
                                                    ),
                                                  );
                                                }).toList(),
                                              )))),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(
                                      left: 8,
                                      bottom: 5,
                                    ),
                                    child: Text(
                                      "仓库",
                                      style: TextStyle(
                                        fontFamily: "Nunito",
                                        fontSize: 20,
                                        color: ColorPalette.nileBlue,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                      decoration: BoxDecoration(
                                        color: ColorPalette.white,
                                        borderRadius: BorderRadius.circular(15),
                                        boxShadow: [
                                          BoxShadow(
                                            offset: const Offset(0, 3),
                                            blurRadius: 6,
                                            color: ColorPalette.nileBlue
                                                .withValues(alpha: 0.1),
                                          ),
                                        ],
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 2.5),
                                      child: controller.obx(
                                          (data) => Obx(() => DropdownButton(
                                                iconSize: 30,
                                                underline: const SizedBox(),
                                                value: controller
                                                    .selectedWarehouse.value,
                                                onChanged: (dynamic newValue) {
                                                  controller.selectedWarehouse(
                                                      newValue);
                                                  controller.distribution
                                                          .value =
                                                      controller
                                                          .distribution.value
                                                          .copyWith(
                                                          wid: newValue.name,
                                                          fromLat:
                                                              newValue.lat,
                                                          fromLng:
                                                              newValue.lng);
                                                },
                                                items: controller.wareHouseList
                                                    .map((process) {
                                                  return DropdownMenuItem(
                                                    value: process,
                                                    child: Text(
                                                      "${process.name}",
                                                      style: TextStyle(
                                                        fontFamily: "Nunito",
                                                        fontSize: 16,
                                                        color: ColorPalette
                                                            .nileBlue
                                                            .withValues(alpha: 0.58),
                                                      ),
                                                    ),
                                                  );
                                                }).toList(),
                                              )))),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Obx(() => GestureDetector(
                                      onTap: () async {
                                        await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime.now(),
                                          lastDate: DateTime(2077, 10),
                                          // textDirection: TextDirection.ltr,
                                          currentDate: DateTime.now(),
                                          locale: const Locale("zh"),
                                        ).then((value) {
                                          controller.dateTime(controller
                                              .dateTime.value
                                              .copyWith(
                                                  year: value!.year,
                                                  month: value.month,
                                                  day: value.day));
                                          controller.updateTime();
                                        });
                                      },
                                      child: Container(
                                        height: 50,
                                        width: 160,
                                        decoration: BoxDecoration(
                                          color: ColorPalette.white,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          boxShadow: [
                                            BoxShadow(
                                              offset: const Offset(0, 3),
                                              blurRadius: 6,
                                              color: ColorPalette.nileBlue
                                                  .withValues(alpha: 0.1),
                                            ),
                                          ],
                                        ),
                                        child: Row(children: [
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          const Icon(
                                            Icons.edit_calendar,
                                            color: ColorPalette.nileBlue,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            DateFormat("yyyy-MM-dd").format(
                                                controller.dateTime.value),
                                            style:
                                                const TextStyle(fontSize: 16),
                                          )
                                        ]),
                                      ))),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Obx(() => GestureDetector(
                                      onTap: () async {
                                        await showTimePicker(
                                                context: context,
                                                initialTime: TimeOfDay.now(),
                                                cancelText: "取消",
                                                helpText: "时间选择",
                                                confirmText: "确认")
                                            .then((value) {
                                          controller.dateTime(controller
                                              .dateTime.value
                                              .copyWith(
                                                  hour: value!.hour,
                                                  minute: value.minute,
                                                  second: 0));
                                          controller.updateTime();
                                        });
                                      },
                                      child: Container(
                                        height: 50,
                                        width: 130,
                                        decoration: BoxDecoration(
                                          color: ColorPalette.white,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          boxShadow: [
                                            BoxShadow(
                                              offset: const Offset(0, 3),
                                              blurRadius: 6,
                                              color: ColorPalette.nileBlue
                                                  .withValues(alpha: 0.1),
                                            ),
                                          ],
                                        ),
                                        child: Row(children: [
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          const Icon(
                                            Icons.timer,
                                            color: ColorPalette.nileBlue,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            DateFormat("kk:mm:ss").format(
                                                controller.dateTime.value),
                                            style:
                                                const TextStyle(fontSize: 16),
                                          )
                                        ]),
                                      )))
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(
                                      left: 8,
                                      bottom: 5,
                                    ),
                                    child: Text(
                                      "注意事项",
                                      style: TextStyle(
                                        fontFamily: "Nunito",
                                        fontSize: 20,
                                        color: ColorPalette.nileBlue,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return MultiSelectDialog(
                                                initialValue:
                                                    controller.selectedCares,
                                                items: _items,
                                                listType:
                                                    MultiSelectListType.CHIP,
                                                onConfirm: (p0) {
                                                  controller.selectedCares(p0);
                                                  controller.generateCares();
                                                },
                                              );
                                            });
                                      },
                                      icon: const Icon(
                                          Icons.add_circle_outline_sharp)),
                                  SizedBox(
                                    width: 50,
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(
                                      left: 8,
                                      bottom: 5,
                                    ),
                                    child: Text(
                                      "加急",
                                      style: TextStyle(
                                        fontFamily: "Nunito",
                                        fontSize: 20,
                                        color: ColorPalette.nileBlue,
                                      ),
                                    ),
                                  ),
                                  Obx(() => Switch(
                                      value:
                                          controller.distribution.value.urgent!,
                                      onChanged: (value) {
                                        controller.distribution.value =
                                            controller.distribution.value
                                                .copyWith(urgent: value);
                                      }))
                                ],
                              ),
                              const SizedBox(height: 10),
                              Obx(() => MultiSelectChipDisplay(
                                    items: controller.selectedCares
                                        .map((element) =>
                                            MultiSelectItem(element, element))
                                        .toList(),
                                    onTap: (p0) {
                                      controller.selectedCares.remove(p0);
                                      controller.generateCares();
                                    },
                                  )),
                              Container(
                                decoration: BoxDecoration(
                                  color: ColorPalette.white,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: const Offset(0, 3),
                                      blurRadius: 6,
                                      color: ColorPalette.nileBlue
                                          .withValues(alpha: 0.1),
                                    ),
                                  ],
                                ),
                                height: 50,
                                child: TextFormField(
                                  onChanged: (value) {
                                    controller.distribution.value = controller
                                        .distribution.value
                                        .copyWith(phone: value);
                                  },
                                  // textInputAction: TextInputAction.next,
                                  key: UniqueKey(),
                                  keyboardType: TextInputType.text,
                                  style: const TextStyle(
                                    fontFamily: "Nunito",
                                    fontSize: 16,
                                    color: ColorPalette.nileBlue,
                                  ),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "客户电话",
                                    filled: true,
                                    fillColor: Colors.transparent,
                                    hintStyle: TextStyle(
                                      fontFamily: "Nunito",
                                      fontSize: 16,
                                      color: ColorPalette.nileBlue
                                          .withValues(alpha: 0.58),
                                    ),
                                  ),
                                  cursorColor: ColorPalette.timberGreen,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: ColorPalette.white,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: const Offset(0, 3),
                                      blurRadius: 6,
                                      color: ColorPalette.nileBlue
                                          .withValues(alpha: 0.1),
                                    ),
                                  ],
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 2.5),
                                // Free-text address + geocoding lookup replaced by a
                                // fixed destination list: the coordinates now come
                                // with the selection instead of from a service call
                                // that always failed. Deliberately NOT preselected,
                                // so the "address is empty" check below still bites.
                                child: Obx(() => DropdownButton<DeliveryPoint>(
                                      isExpanded: true,
                                      iconSize: 30,
                                      underline: const SizedBox(),
                                      value: controller
                                          .selectedDeliveryPoint.value,
                                      hint: Text(
                                        "客户地址",
                                        style: TextStyle(
                                          fontFamily: "Nunito",
                                          fontSize: 16,
                                          color: ColorPalette.nileBlue
                                              .withValues(alpha: 0.58),
                                        ),
                                      ),
                                      onChanged: controller.selectDeliveryPoint,
                                      items: kDeliveryPoints.map((point) {
                                        return DropdownMenuItem<DeliveryPoint>(
                                          value: point,
                                          child: Text(
                                            point.address,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontFamily: "Nunito",
                                              fontSize: 16,
                                              color: ColorPalette.nileBlue
                                                  .withValues(alpha: 0.58),
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                    )),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      height: 50,
                                      child: OutlinedButton(
                                        onPressed: () {
                                          context.pop();
                                        },
                                        child: Text("取消"),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                        height: 50,
                                        child: Obx(() => ElevatedButton(
                                              child: _isLoading.value
                                                  ? const SizedBox(
                                                      height: 15,
                                                      width: 15,
                                                      child:
                                                          CircularProgressIndicator(
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
                                                if(controller.distribution.value.phone==null){
                                                  showTextToast("请填写客户电话");

                                                }else if(controller.distribution.value.address==null){
                                                  showTextToast("请填写客户地址");

                                                }else{
                                                  
                                                  _isLoading(true);
                                                await controller
                                                    .submitDis()
                                                    .then((value) {
                                                  if (value) {
                                                    _isLoading(false);
                                                    showTextToast("提交成功");
                                                    // Through the container, because
                                                    // this screen is still a GetView with
                                                    // no ref. `.to` was Get.find() — it
                                                    // needed the list controller to have
                                                    // been constructed already; a provider
                                                    // does not.
                                                    appContainer
                                                        .read(distributionListProvider
                                                            .notifier)
                                                        .refresh();
                                                    // The await above may outlive this widget; popping a dead context throws.
                                                    if (!context.mounted) return;
                                                    Navigator.pop(context);
                                                  } else {
                                                    _isLoading(false);
                                                  }
                                                });
                                                }
                          
                                                
                                              },
                                            ))),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ))),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
