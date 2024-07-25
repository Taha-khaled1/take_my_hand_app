import 'package:take_hand/presentation_layer/components/appbar.dart';
import 'package:take_hand/presentation_layer/resources/values_manager.dart';
import 'package:take_hand/presentation_layer/screen/article_detalis_screen/article_detalis_controller.dart';
import 'package:take_hand/presentation_layer/screen/article_screen/article_controller.dart';
import 'package:take_hand/presentation_layer/screen/article_screen/widget/article_card.dart';
import 'package:take_hand/presentation_layer/screen/free_course_platforms/widget/section_header_and_filter.dart';
import 'package:take_hand/presentation_layer/screen/home_screen/widget/custom_tag.dart';
import 'package:take_hand/presentation_layer/src/get_packge.dart';
import 'package:take_hand/presentation_layer/src/style_packge.dart';
import 'package:flutter_html/flutter_html.dart' as html;

class ArticleDetalisScreen extends GetView<ArticleController> {
  const ArticleDetalisScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar("تفاصيل الأخبار"),
      backgroundColor: ColorManager.background,
      body: InfoWidget(
        builder: (context, deviceInfo) {
          return GetBuilder<ArticleDetalisController>(
              init: ArticleDetalisController(),
              builder: (_) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppSizedBox.sizedBox_10,
                              Text(
                                "Nov 21, 2022" + " . " + "10 min read",
                                style: MangeStyles().getRegularStyle(
                                  color: ColorManager.kTextlightgray,
                                  fontSize: FontSize.s14,
                                ),
                              ),
                              AppSizedBox.sizedBox_20,
                              Text(
                                _.articlesModel?.data?.article?.title ?? '',
                                style: MangeStyles()
                                    .getMediumStyle(
                                      color: ColorManager.white,
                                      fontSize: FontSize.s18,
                                    )
                                    .copyWith(),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              _.articlesModel?.data?.article?.createdBy ?? '',
                              style: MangeStyles()
                                  .getSemiBoldStyle(
                                    color: ColorManager.white,
                                    fontSize: FontSize.s18,
                                  )
                                  .copyWith(),
                            ),
                            CustomTag(
                                title: "Design",
                                color: ColorManager.backgroundpersonalimage),
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        // width: deviceInfo.localWidth * 0.9,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            "assets/images/pexels-iriser-1366957.jpg",
                            width: double.infinity,
                            height:
                                250, // Adjust the height as per your layout needs
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      AppSizedBox.sizedBox_10,
                      html.Html(
                        data: """
           ${_.articlesModel?.data?.article?.description ?? ""}
              
                    
                    
                    """,
                      ),
                      SectionHeaderAndFilter(
                        is_more: false,
                        title: 'المقالات',
                        press: () {},
                      ),
                      SizedBox(
                        height: 320,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _.articlesModel?.data?.articles?.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: ArticleCard(
                                id: _.articlesModel?.data?.articles?[index]
                                        .id ??
                                    1,
                                imageUrl: _.articlesModel?.data
                                        ?.articles?[index].image ??
                                    "",
                                title: _.articlesModel?.data?.articles?[index]
                                        .title ??
                                    "",
                                date: _.articlesModel?.data?.articles?[index]
                                        .createdAt ??
                                    "",
                                readTime: 10,
                              ),
                            );
                          },
                        ),
                      ),
                      AppSizedBox.sizedBox_10,
                    ],
                  ),
                );
              });
        },
      ),
    );
  }
}
//                 MarkdownBody(
//                   data: """

// """,
//                   styleSheet:
//                       MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
//                     p: MangeStyles().getRegularStyle(
//                       color: ColorManager.white,
//                       fontSize: FontSize.s18,
//                     ),
//                   ),
//                 )
