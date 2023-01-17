

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kpi_ndqxai/pages/add_task_page/add_task_controller.dart';
import 'package:kpi_ndqxai/pages/add_task_page/add_task_view.dart';
import 'package:kpi_ndqxai/services/constants/app_colors.dart';
import 'package:kpi_ndqxai/services/utils.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddtaskController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            title: Text("Topshiriq tayinlash",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 22.sp,
                    color: Colors.black)),
            elevation: 0,
          ),
          backgroundColor: AppColors.mainBackgroundColor,
          body: Scrollbar(
            trackVisibility: true,
            thickness: 5,
            radius: Radius.circular(5),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              child: Container(
                padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 10.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // topshiriq nomi fieldi
                        const Text("Topshiriq nomi",
                            style: AppColors.kulrangMatn),
                        SizedBox(height: 10.h),
                        // Topshiriq text field
                                                SizedBox(
                          child: TextField(
                            controller: controller.taskNameController,
                            autofillHints: [AutofillHints.username],
                            keyboardType: TextInputType.text,
                            maxLines: null,
                            maxLength: 100,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: AppColors.mainWhiteColor,
                                isDense: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        width: 0, color: Colors.red.shade50)),
                                hintText: "Topshiriq nomi",
                                hintStyle: const TextStyle(
                                    fontSize: 15, color: Colors.grey)),
                          ),
                        ),
                        SizedBox(height: 20.h),

                        // tavsif fieldi
                        Text("Tavsif", style: AppColors.kulrangMatn),
                        SizedBox(height: 10.h),
                        SizedBox(
                          child: TextField(
                            controller: controller.descriptionController,
                            autofillHints: [AutofillHints.username],
                            keyboardType: TextInputType.text,
                            maxLines: null,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: AppColors.mainWhiteColor,
                                isDense: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),

                                hintText: "Tavsif kiriting",
                                hintStyle: const TextStyle(fontSize: 15)),
                          ),
                        ),
                        SizedBox(height: 20.h),

                        // mas'ul shaxs field
                        Text("Mas'ul shaxslarni belgilang",
                            style: AppColors.kulrangMatn),
                        SizedBox(height: 10.h),
                        Row(
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              alignment: Alignment.centerLeft,
                              width: MediaQuery.of(context).size.width * 0.73,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                  11,
                                ),
                              ),
                              child: Text(
                                controller.imagePath.isNotEmpty
                                    ? controller.imagePath.substring(
                                        controller.imagePath.lastIndexOf('/') +
                                            1)
                                    : controller.imagePath,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    overflow: TextOverflow.ellipsis),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  fixedSize: const Size(0, 45),
                                  backgroundColor: AppColors.mainColorGreen,
                                  alignment: Alignment.center,
                                  elevation: 2,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      11,
                                    ),
                                  )),
                              child: const Icon(CupertinoIcons.person_add),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        // file biriktirish
                        const Text("File biriktirish (agar mavjud bo'lsa)",
                            style: AppColors.kulrangMatn),
                        SizedBox(height: 10.h),
                        // fayl tanlash
                        Row(
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              alignment: Alignment.centerLeft,
                              width: MediaQuery.of(context).size.width * 0.73,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                  11,
                                ),
                              ),
                              child: Text(
                                controller.imagePath.isNotEmpty
                                    ? controller.imagePath.substring(
                                        controller.imagePath.lastIndexOf('/') +
                                            1)
                                    : controller.imagePath,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    overflow: TextOverflow.ellipsis),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Utils.openPicker(ImageSource.gallery)
                                    .then((image) {
                                  if (image != null) {
                                    controller.uploadImage([File(image.path)]);
                                    controller.update();
                                  }
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                  fixedSize: const Size(0, 45),
                                  backgroundColor: AppColors.mainColorGreen,
                                  alignment: Alignment.center,
                                  elevation: 2,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      11,
                                    ),
                                  )),
                              child: const Icon(Icons.file_copy_outlined),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),

                        // muhimlilik darajasi dropdown
                        const Text("Muhimlilik darajasi",
                            style: AppColors.kulrangMatn),
                        SizedBox(height: 20.h),
                        dropDownButton(controller, controller.status,
                            controller.changeStatus),
                        SizedBox(height: 20.h),

                        // qiyinlik darajasini belgilash uchun
                        Text(
                            'Topshiriqning qiyinlik darajasi: ${controller.daraja.toInt()}',
                            style: AppColors.kulrangMatn),
                        setDificulty(controller, controller.daraja,
                            controller.setDaraja),

                        // Topshirish muxlati
                        const Text("Topshiriq muhlati",
                            style: AppColors.kulrangMatn),
                        SizedBox(height: 15.h),
                        // deadline widgeti
                        chosenDateForDeadline(context, controller, "Muhlat"),
                        SizedBox(
                          height: 15.h,
                        ),
                        // topshiriq tayinlash knopkasi
                        Container(
                          alignment: Alignment.centerRight,
                          child: MaterialButton(
                            onPressed: () {
                              debugPrint("Tayinlash button bosildi");
                              Get.snackbar("Bajarildi",
                                  "Topshiriq muvofaqiyatli tayinlandi",
                                  snackStyle: SnackStyle.FLOATING,
                                  snackPosition: SnackPosition.TOP,
                                  barBlur: 30,
                                  margin: EdgeInsets.symmetric(
                                      vertical: 20.h, horizontal: 20));
                            },
                            child: Container(
                                alignment: Alignment.center,
                                width: MediaQuery.of(context).size.width * 0.35,
                                height:
                                    MediaQuery.of(context).size.height * 0.061,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  color: AppColors.mainColorGreen,
                                ),
                                child: Center(
                                    child: Text(
                                  "Tayinlash",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20.sp),
                                  textAlign: TextAlign.center,
                                ))),
                          ),
                        )

                        // qiyinlik darajasi
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
