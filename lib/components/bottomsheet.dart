import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tech_news_app/components/bottomsheetimage.dart';
import 'package:tech_news_app/utils/colors.dart';
import 'package:tech_news_app/utils/text.dart';
import 'package:url_launcher/url_launcher.dart';

void showMyBottomSheet(
  BuildContext context,
  String title,
  String description,
  imageurl,
  url,
) {
  showBottomSheet(
    backgroundColor: AppColors.bgColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
    ),
    elevation: 20,
    context: context,
    builder: (context) {
      return myBottomSheetLayout(
        title: title,
        description: description,
        imageurl: imageurl,
        url: url,
      );
    },
  );
}

_launchUrl(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class myBottomSheetLayout extends StatelessWidget {
  final String title, description, imageurl, url;
  const myBottomSheetLayout({
    super.key,
    required this.title,
    required this.description,
    required this.imageurl,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Container(
        color: AppColors.bgColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            bottomSheetImage(imageurl: imageurl, title: title),
            Container(
              padding: EdgeInsets.all(10),
              child: modifiedText(
                text: description,
                size: 14,
                color: AppColors.lightgrey,
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Read Full Article',
                      recognizer:
                          TapGestureRecognizer()
                            ..onTap = () {
                              _launchUrl(url);
                            },
                      style: GoogleFonts.lato(color: AppColors.primary),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
