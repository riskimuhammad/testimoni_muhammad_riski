import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muhammad_riski_testimoni/core/helper/date_formater.dart';
import 'package:muhammad_riski_testimoni/core/material/material_color.dart';
import 'package:muhammad_riski_testimoni/core/material/material_text_style.dart';
import 'package:muhammad_riski_testimoni/feature/dashboard/presentation/controlller/home_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ListTetstimonial {
  list(context) {
    final _controller = Get.find<HomeController>();
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _controller.scrollController.value,
              itemCount: _controller.listTestimonials.length,
              shrinkWrap: true,
              itemBuilder: (_, index) {
                final element = _controller.listTestimonials[index];
                return Container(
                  height: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: TestimonialColor.white,
                      boxShadow: [
                        BoxShadow(
                            color: TestimonialColor.primaryColorsGrey.shade700,
                            offset: Offset(3, 3),
                            blurRadius: 10)
                      ]),
                  margin: EdgeInsets.only(bottom: 20, left: 16, right: 16),
                  padding: EdgeInsets.only(left: 16, right: 16),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.all(0),
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(element.avatar ??
                              'https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_1280.png'),
                          backgroundColor:
                              TestimonialColor.primaryColorsGrey.shade800,
                        ),
                        title: Text(
                          element.name ?? '',
                          style: materialTextStyle.textStyleFZ15,
                        ),
                        subtitle: Obx(() => Text(
                              "${element.content}",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: materialTextStyle.textStyleFZ11,
                            )),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          if (_controller.testimonialIsLoading.value)
            Container(
                padding: EdgeInsets.all(10),
                height: 50,
                width: 50,
                child: CircularProgressIndicator()),
          if (_controller.testimonialIsEmpty.value)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                AppLocalizations.of(context)!.allDataIsGenerated,
                style: materialTextStyle.textStyleFZ15Blue,
              ),
            ),
        ],
      ),
    );
  }
}
