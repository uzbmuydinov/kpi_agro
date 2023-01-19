// for select deadline
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kpi_ndqxai/pages/task_detail_page/task_detail_view.dart';
import 'package:kpi_ndqxai/pages/user_home_page/cardModel.dart';
import 'package:kpi_ndqxai/pages/user_home_page/taskStatus/taskStatus_controller.dart';
import 'package:kpi_ndqxai/pages/user_home_page/user_home_controller.dart';

import 'package:kpi_ndqxai/services/constants/app_colors.dart';
import 'package:kpi_ndqxai/views/show_alert_dialog.dart';
import 'package:shimmer/shimmer.dart';

Widget dropDownButtonForHomePage(UserHomePageController controller,
    String value, void Function(String?) function) {
  return Container(
    height: 55.h,
    alignment: Alignment.center,
    padding: EdgeInsets.only(left: 20, right: 10),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          15,
        )),
    child: DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        alignment: Alignment.centerLeft,
        borderRadius: BorderRadius.circular(
          15,
        ),
        isExpanded: true,
        hint: Text(value),
        style: TextStyle(
            fontSize: 16,
            color: Colors.black,
            fontFamily: "Mulish",
            fontWeight: FontWeight.w500),
        icon: const Icon(Icons.keyboard_arrow_down),
        iconSize: 24,
        onChanged: function,
        items: controller.allGroups.map((String tag) {
          return DropdownMenuItem<String>(
            value: tag,
            child: Text(
              tag,
            ),
          );
        }).toList(),
      ),
    ),
  );
}

class AppBarHomePageCustom extends StatelessWidget {
  const AppBarHomePageCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserHomePageController>(builder: (controller) {
      return  Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: AppColors.mainColorGreen, width: 3))),
            backgroundImage: AssetImage("assets/images/unnamed.jpg"),
            radius: 30.r,
          ),
          SizedBox(
            width: 8.h,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                child: controller.isLoading == true
                    ? Shimmer.fromColors(
                    baseColor: Colors.grey.shade400,
                    highlightColor: Colors.grey.shade200,
                    child: Container(
                      height: 30.h,
                      width: 250.w,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(8)),
                    ))
                    : Text(
                  "${controller.userInfo?.firstName} ${controller.userInfo?.lastName}",
                  style: AppColors.bukvalni,
                ),
              ),

              SizedBox(
                height: 8.h,
              ),
              // for mail
              SizedBox(
                child: controller.isLoading == true
                    ? Shimmer.fromColors(
                    baseColor: Colors.grey.shade400,
                    highlightColor: Colors.grey.shade200,
                    child: Container(
                      height: 30.h,
                      width: 150.w,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(8)),
                    ))
                    : Text(
                  "${controller.userInfo?.email}",
                  style: AppColors.kulrangMatn,
                ),
              ),


            ],
          )
        ],
      );
    });
  }
}


// Todo Bu eski UI Ish bitgach o'chirib tashla
List<CardModel> cardElements = [
  CardModel(
      "Soqqali ish",
      "consectetur adipiscing elit",
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
      true,
      "Shoshilinch",
      "12/12/2022",
      7),
  CardModel(
      "Lorem ipsum dolor",
      "unde omnis iste natus",
      "error sit voluptatem accusantium",
      false,
      "Shoshilinch",
      "12/12/2022",
      7),
  CardModel(
      "Sed ut perspiciatis",
      "Nemo enim ipsam",
      "Tezlashtirilar",
      true,
      "Shoshilinch",
      "12/12/2022",
      7),
  CardModel(
      "Nemo enim ipsam voluptatem, quia voluptas sit",
      "Mo'minjon",
      "t enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit, qui in ea voluptate velit esse, quam nihil molestiae consequatur,",
      true,
      "Shoshilinch",
      "12/12/2022",
      7),
];

Widget buildCustomcard() {
  return GetBuilder<UserHomePageController>(
      builder: (controller) {
        return Column(
          children: [
            // task card
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.barchaTopshiriqlar.length,
                itemBuilder: (context, index) {
                  return itemOfCard(index);
                })
          ],
        );
      });
}

Card itemOfCard(int index) {
  return Card(

    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    child: Container(
      height: 160.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        padding:
        const EdgeInsets.only(left: 15, bottom: 15, top: 15, right: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r), color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // # product_name

                    SizedBox(
                      width: 300.w,
                      child: Text(cardElements[index].topshiriqNomi!,
                          style: AppColors.cardHeadStyle,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2),
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    SizedBox(
                      width: 300.w,
                      child: Text(
                        cardElements[index].tavsif!,
                        style: AppColors.kulrangMatn,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                // product like
                CircleAvatar(
                    backgroundColor: cardElements[index].bajarildimi
                        ? Colors.red
                        : AppColors.mainColorGreen,
                    maxRadius: 12.r),
              ],
            ),
            SizedBox(height: 15.h),

            // bu yerda narx bor edi
            SizedBox(
                width: 100.w,
                child: Text(
                  cardElements[index].muhlat!,
                  style: AppColors.kulrangMatn,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                )),
          ],
        ),
      ),
    ),
  );
}
//customListTile
Widget buildListTile() {
  return GetBuilder<UserHomePageController>(
      builder: (controller) {
        return RefreshIndicator(
          onRefresh: () async {
            await controller.getAllTasks;
          },
          child: ListView.builder(
              controller: controller.scrollController,
              padding: EdgeInsets.zero,
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              shrinkWrap: true,
              itemCount: controller.barchaTopshiriqlar.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 118.h,
                  margin: EdgeInsets.only(
                    bottom: 15.h,
                  ),
                  padding: EdgeInsets.all(10.r),
                  width: 1.sw,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.r)),
                  child: InkWell(
                    onTap: () =>
                        Get.to(() =>
                            TaskDetailElement(
                              taskList: controller.barchaTopshiriqlar[index],
                            ),
                          transition: Transition.fadeIn,
                          duration: const Duration(milliseconds: 150),
                        ),
                    onLongPress: () {
                      showEditAndDeleteDialog(
                          context: context,
                          title: "want_to_edit_or_delete".tr,
                          //delete: controller.deleteNotice,
                          //edit: controller.goToEditPage,
                          argument: controller.barchaTopshiriqlar[index],
                          id: controller.barchaTopshiriqlar[index].id);
                    },
                    child: Row(
                      children: [
                        Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.barchaTopshiriqlar[index].title!,
                                  maxLines: 1,
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  controller.barchaTopshiriqlar[index]
                                      .description!,
                                  maxLines: 3,
                                  style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    fontSize: 13.sp,
                                    color: AppColors.colorTextLightGrey,
                                  ),
                                ),
                              ],
                            )),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [

                            Text(
                              controller.barchaTopshiriqlar[index].createdAt
                                  .toString()
                                  .substring(0, 16),
                              style: TextStyle(
                                  fontSize: 13.sp, fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }),
        );
      });
}

// barcha topshiriqlar shu yerga kirib keladi
Widget AllTasks() {
  return GetBuilder<UserHomePageController>(
      builder: (controller) {
        return RefreshIndicator(
          onRefresh: () async {
            await controller.getAllTasks;
          },
          child: ListView.builder(
              controller: controller.scrollController,
              padding: EdgeInsets.zero,
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              shrinkWrap: true,
              itemCount: controller.barchaTopshiriqlar.length,
              //itemCount: 3,
              itemBuilder: (context, index) {
                return Container(
                  height: 118.h,
                  margin: EdgeInsets.only(
                    bottom: 15.h,
                  ),
                  padding: EdgeInsets.all(10.r),
                  width: 1.sw,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.r)),
                  child: InkWell(
                    onTap: () =>
                        Get.to(() =>
                            TaskDetailElement(
                              taskList: controller.barchaTopshiriqlar[index],
                            ),
                          transition: Transition.fadeIn,
                          duration: const Duration(milliseconds: 150),
                        ),
                    onLongPress: () {
                      showEditAndDeleteDialog(
                          context: context,
                          title: "want_to_edit_or_delete".tr,
                          //delete: controller.deleteNotice,
                          //edit: controller.goToEditPage,
                          argument: controller.barchaTopshiriqlar[index],
                          id: controller.barchaTopshiriqlar[index].id);
                    },
                    child: Row(
                      children: [
                        Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "controller.barchaTopshiriqlar[index].title!",
                                  maxLines: 1,
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "controller.barchaTopshiriqlar[index].description!",
                                  maxLines: 3,
                                  style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    fontSize: 13.sp,
                                    color: AppColors.colorTextLightGrey,
                                  ),
                                ),
                              ],
                            )),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [

                            Text(
                              "controller.barchaTopshiriqlar[index].createdAt"
                                  .toString()
                                  .substring(0, 16),
                              style: TextStyle(
                                  fontSize: 13.sp, fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }),
        );
      });
}

class TabBarCustom extends StatelessWidget {
  const TabBarCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TaskStatusController>(
        init: TaskStatusController(),
        builder: (controller) {
          return Container(
            decoration: BoxDecoration(
              color: const Color(0xFFEDEDED),
              borderRadius: BorderRadius.circular(11.r),
            ),
            child: TabBar(
                controller: controller.tabController,
                onTap: (index) {
                  controller.tabController.animateTo(index);
                },
                indicatorWeight: 0.1,
                labelPadding: EdgeInsets.all(5),
                indicatorPadding: EdgeInsets.zero,
                indicatorColor: AppColors.transparent,
                physics: const BouncingScrollPhysics(),
                tabs: [
                  Container(
                    height: 52.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: (controller.tabController.index == 0)
                          ? AppColors.mainWhiteColor
                          : AppColors.transparent,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Text(
                      "Bajarilmagan",
                      style: TextStyle(
                          fontSize: 16.sp,
                          color: AppColors.mainColorBlack,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    height: 52.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: (controller.tabController.index == 1)
                          ? AppColors.mainWhiteColor
                          : AppColors.transparent,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Text(
                      'Bajarilgan'.tr,
                      style: TextStyle(
                          fontSize: 16.sp,
                          color: AppColors.mainColorBlack,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    height: 52.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: (controller.tabController.index == 2)
                          ? AppColors.mainWhiteColor
                          : AppColors.transparent,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Text(
                      "Barcha",
                      style: TextStyle(
                          fontSize: 16.sp,
                          color: AppColors.mainColorBlack,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ]),
          );
        });
  }
}