import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kpi_ndqxai/pages/add_task_page/add_task_controller.dart';
import 'package:kpi_ndqxai/services/constants/app_colors.dart';

Widget dropDownButton(AddtaskController controller, String value, void Function(String?) function) {
  return Container(
    height: 55.h,
    alignment: Alignment.center,
    padding: const EdgeInsets.only(left: 20,right: 10),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15,)),
    child: DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        alignment: Alignment.centerLeft,
        borderRadius: BorderRadius.circular(15,),
        isExpanded: true,
        hint: Text(value),
        style: const TextStyle(
            fontSize: 16, color: Colors.black, fontFamily: "Mulish",fontWeight: FontWeight.w500),
        icon: const Icon(Icons.keyboard_arrow_down),
        iconSize: 24,
        onChanged: function,
        items: controller.allGroups.map((String tag) {
          return DropdownMenuItem<String>(
            value: tag,
            child: Text(tag,),
          );
        }).toList(),
      ),
    ),
  );
}

Widget setDificulty(AddtaskController controller, double daraja, void Function(double?) function){
  return Container(
    height: 55,

    //color: Colors.green.shade300,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "1",
          style: AppColors.cardHeadStyle,
        ),
        SizedBox(
          width: 330.w,
          child: Slider(
              value: daraja,
              min: 1,
              max: 10,
              divisions: 10,
              label: daraja.round().toString(),
              activeColor: AppColors.mainColorGreen,
              onChanged: function
              ),
        ),
        const Text(
          "10",
          style:  AppColors.cardHeadStyle,
        ),
      ],
    ),
  );
}

Widget chosenDateForDeadline(BuildContext context, AddtaskController controller, String fromTo) {
  return InkWell(
    onTap: () => controller.showDialog(

      CupertinoDatePicker(
        dateOrder:DatePickerDateOrder.mdy,

        minimumDate: DateTime.now(),
        mode: CupertinoDatePickerMode.date,
        use24hFormat: true,
        onDateTimeChanged: (DateTime newDate) {
          if (fromTo == "Topshiriq muhlati") {
            controller.changeStartDateTime(newDate);
          } else {
            controller.changeFinishDateTime(newDate);
          }
        },
      ),
      context,
    ),
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      height: 67.h,
      width: 1.sw,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: AppColors.mainWhiteColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(fromTo,  style: TextStyle(fontSize: 16, color: Colors.black, fontFamily: "Mulish",fontWeight: FontWeight.w500),),
          fromTo == "start_date"
              ? Text(controller.startdate.toString().substring(0, 10), style: TextStyle(fontSize: 16, color: Colors.black, fontFamily: "Mulish",fontWeight: FontWeight.w500),)
              : Text(controller.finishdate.toString().substring(0, 10), style: TextStyle(fontSize: 16, color: Colors.black, fontFamily: "Mulish",fontWeight: FontWeight.w500),)
        ],
      ),
    ),
  );
}

Widget chooseDeadline(BuildContext context, AddtaskController controller, String Executor) {
  return InkWell(
    onTap: () => controller.showDialog(
      CupertinoDatePicker(
        mode: CupertinoDatePickerMode.date,
        use24hFormat: true,
        onDateTimeChanged: (DateTime newDate) {
          if (Executor == "Topshiriq muhlati") {
            controller.changeStartDateTime(newDate);
          } else {
            controller.changeFinishDateTime(newDate);
          }
        },
      ),
      context,
    ),
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      height: 67.h,
      width: 1.sw,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: AppColors.mainWhiteColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(Executor,  style: TextStyle(fontSize: 16, color: Colors.black, fontFamily: "Mulish",fontWeight: FontWeight.w500),),
          Executor == "start_date"
              ? Text(controller.startdate.toString().substring(0, 10), style: TextStyle(fontSize: 16, color: Colors.black, fontFamily: "Mulish",fontWeight: FontWeight.w500),)
              : Text(controller.finishdate.toString().substring(0, 10), style: TextStyle(fontSize: 16, color: Colors.black, fontFamily: "Mulish",fontWeight: FontWeight.w500),)
        ],
      ),
    ),
  );
}

Widget choseExecutorForTask(BuildContext context, AddtaskController controller) {
  return Container(
    margin: EdgeInsets.only(top: 8.h, bottom: 8.h),
    decoration: BoxDecoration(
        color: AppColors.mainWhiteColor,
        borderRadius: BorderRadius.circular(11.r)),
    child: ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: controller.department.length,
      itemBuilder: (context, index) {
        return Theme(
          data: ThemeData(
              fontFamily: "Poppins",
              dividerColor: index == 0 || index == controller.department.length - 1
                  ? Colors.transparent
                  : Colors.black.withOpacity(0.3)),
          child: ExpansionTile(
            onExpansionChanged: (value) {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            title: Text(
             controller.department[index].name!,
              maxLines: 1,
              style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  overflow: TextOverflow.ellipsis),
            ),
            children: List.generate(
                controller.employees[index].length,
                    (index1) => Column(
                  children: [
                    const Divider(
                      color: Colors.grey,
                      thickness: 0.5,
                      height: 1,
                      indent: 15,
                      endIndent: 15,
                    ),
                    CheckboxListTile(
                      checkboxShape: const CircleBorder(),
                      value: controller.employees[index].selected,
                      onChanged: (bool? value) {
                        controller.employees[index].selected=
                        value!;
                        controller.update();
                      },
                      title: Text(
                        controller.employees[index],
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ),
                  ],
                )),
          ),
        );
      },
    ),
  );
}

class TaskNameInput extends StatelessWidget {
  final TextEditingController controller;
  TaskNameInput({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 10.h),
      decoration: BoxDecoration(
          color: AppColors.mainWhiteColor,
          borderRadius: BorderRadius.circular(10.r)),
      child: TextField(
        controller: controller,
        decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: "Topshiriq nomi",
            prefixIcon: Icon(
              Icons.note_alt_outlined,
              color: AppColors.mainColorGreen,
            )),
      ),
    );
  }
}

class DescriptionInput extends StatelessWidget {
  final TextEditingController descriptionController;
   DescriptionInput({Key? key, required this.descriptionController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
          color: AppColors.mainWhiteColor,
          borderRadius: BorderRadius.circular(10.r)),
      child: TextField(
        keyboardType: TextInputType.multiline,
        maxLines: null,
        controller: descriptionController,
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
      ),
    );
  }
}


