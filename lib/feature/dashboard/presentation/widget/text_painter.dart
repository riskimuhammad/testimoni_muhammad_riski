import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muhammad_riski_testimoni/feature/dashboard/presentation/controlller/home_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TextWithMoreButton extends StatelessWidget {
  final String text;
  final int maxLines;
  final TextStyle textStyle;
  final TextStyle buttonStyle;
  final bool expanded;
  final int index;

  const TextWithMoreButton(
      {Key? key,
      required this.text,
      required this.maxLines,
      required this.textStyle,
      required this.buttonStyle,
      required this.expanded,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.find<HomeController>();
    return LayoutBuilder(
      builder: (context, constraints) {
        final textSpan = TextSpan(text: text);
        final textPainter = TextPainter(
          text: textSpan,
          maxLines: maxLines,
          textDirection: TextDirection.ltr,
        );
        textPainter.layout(maxWidth: constraints.maxWidth);

        return GestureDetector(
          onTap: () => _controller.lassMoreContent(index),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(children: [
                  textSpan,
                ]),
                maxLines: !expanded ? 4 : null,
                overflow: !expanded ? TextOverflow.ellipsis : null,
                style: textStyle,
              ),
              if (expanded)
                SizedBox.shrink()
              else
                Text(
                  AppLocalizations.of(context)!.more,
                  style: buttonStyle,
                ),
            ],
          ),
        );
      },
    );
  }
}
