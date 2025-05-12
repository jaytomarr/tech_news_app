import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:tech_news_app/components/bottomsheet.dart';
import 'package:tech_news_app/utils/colors.dart';
import 'package:tech_news_app/utils/text.dart';

class newsBox extends StatelessWidget {
  final String imageurl, title, time, description, url;
  const newsBox({
    super.key,
    required this.imageurl,
    required this.title,
    required this.time,
    required this.description,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Column(
      children: [
        InkWell(
          onTap: () {
            showMyBottomSheet(context, title, description, imageurl, url);
          },
          child: Container(
            width: w,
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.only(left: 6, right: 6, top: 6),
            child: Row(
              children: [
                CachedNetworkImage(
                  imageUrl: imageurl,
                  imageBuilder:
                      (context, imageProvider) => Container(
                        width: 90,
                        height: 70,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(6),
                          color: Colors.red,
                        ),
                      ),
                  placeholder:
                      (context, url) =>
                          CircularProgressIndicator(color: AppColors.primary),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      modifiedText(
                        text: title,
                        size: 16,
                        color: AppColors.lightblack,
                      ),
                      SizedBox(height: 6),
                      modifiedText(
                        text: time,
                        size: 12,
                        color: AppColors.lightgrey,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
