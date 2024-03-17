import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muhammad_riski_testimoni/core/helper/date_formater.dart';
import 'package:muhammad_riski_testimoni/core/material/material_color.dart';
import 'package:muhammad_riski_testimoni/core/material/material_text_style.dart';
import 'package:muhammad_riski_testimoni/feature/dashboard/presentation/controlller/home_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'text_painter.dart';

class ListTetstimonial {
  list(context) {
    final _controller = Get.find<HomeController>();
    return ListView.builder(
      itemCount: _controller.listTestimonials.length,
      shrinkWrap: true,
      itemBuilder: (_, index) {
        final element = _controller.listTestimonials[index];
        return Container(
          height: !element.show! ? 250 : null,
          decoration: BoxDecoration(color: TestimonialColor.white, boxShadow: [
            BoxShadow(
                color: TestimonialColor.primaryColorsGrey.shade700,
                offset: Offset(3, 3),
                blurRadius: 10)
          ]),
          margin: EdgeInsets.only(bottom: 20),
          padding: EdgeInsets.only(left: 16, right: 16, top: 20, bottom: 20),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              ListTile(
                contentPadding: EdgeInsets.all(0),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(element.avatar ??
                      'https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_1280.png'),
                  backgroundColor: TestimonialColor.primaryColorsGrey.shade800,
                ),
                title: Text(
                  element.name ?? '',
                  style: materialTextStyle.textStyleFZ15,
                ),
                subtitle: Obx(() => Text(
                      "${AppLocalizations.of(context)!.createAt} ${DateFormater.formater(element.createdAt, _controller.lnCode.value)}",
                      style: materialTextStyle.textStyleFZ11,
                    )),
                trailing: Icon(Icons.more_vert),
              ),
              TextWithMoreButton(
                text: element.content ?? '',
                maxLines: 4,
                buttonStyle: materialTextStyle.textStyleFZ15Blue,
                textStyle: materialTextStyle.textStyleFZ15,
                expanded: element.show ?? false,
                index: index,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Icon(
                    Icons.favorite,
                    color: TestimonialColor.rose,
                    size: 20,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '${element.likes}',
                    style: materialTextStyle.textStyleFZ12,
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
