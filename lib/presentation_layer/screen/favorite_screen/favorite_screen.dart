import 'dart:convert';

import 'package:line_icons/line_icons.dart';
import 'package:take_hand/presentation_layer/screen/courses_screen/widget/row_course.dart';
import 'package:take_hand/presentation_layer/screen/home_screen/widget/bottom_section_course.dart';
import 'package:take_hand/presentation_layer/screen/home_screen/widget/custom_tag.dart';
import 'package:take_hand/presentation_layer/src/account_url.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart' as dom;
import 'package:take_hand/presentation_layer/utils/helper_function.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.background,
      appBar: appbar("المفضله"),
      body: InfoWidget(
        builder: (context, deviceInfo) {
          return RowCourse(
            deviceInfo: deviceInfo,
          );
        },
      ),
    );
  }
}

class CourseCardSqure extends StatelessWidget {
  final String imageUrl;
  final String title;
  final bool isFree;
  final String? price;
  final String? discountedPrice;
  final double evaluation;
  final String trackName;

  const CourseCardSqure({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.isFree,
    required this.evaluation,
    required this.trackName,
    this.price,
    this.discountedPrice,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        try {
          HelperFunction.printYellowText('course');
          final response = await http.get(Uri.parse(
              'https://www.classcentral.com/maestro/provider/coursera?free=true'));

          if (response.statusCode == 200) {
            final document = parser.parse(jsonDecode(response.body)['table']);
            final courses =
                document.getElementsByClassName('course-list-course');
            HelperFunction.printYellowText('--> $courses');
            List<Map<String, String>> courseData = [];

            for (dom.Element course in courses) {
              HelperFunction.printCyanText('course');
              final courseNameElement =
                  course.getElementsByClassName('course-name').first;
              final courseName = courseNameElement.text.trim();

              final courseLink = courseNameElement.attributes['href'] ?? '';

              final ratingElement =
                  course.getElementsByClassName('cmpt-rating-medium').first;
              final rating = ratingElement.attributes['aria-label'] ?? '';

              final reviewCountElement = course
                  .getElementsByClassName(
                      'text-3 color-gray margin-left-xxsmall')
                  .first;
              final reviewCount = reviewCountElement.text.trim();

              courseData.add({
                'name': courseName,
                'link': courseLink,
                'rating': rating,
                'reviewCount': reviewCount,
              });
            }

            // Print or use the extracted course data
            for (var course in courseData) {
              print('Course Name: ${course['name']}');
              print('Course Link: ${course['link']}');
              print('Course Rating: ${course['rating']}');
              print('Review Count: ${course['reviewCount']}');
              print('--------------------');
            }
            HelperFunction.printMagentaText(
                'number of courses: ${courseData.length}');
          } else {
            HelperFunction.printBlueText('Failed to load course data');
          }
        } catch (e) {
          HelperFunction.printRedText(e.toString());
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: ClayContainer(
          color: ColorManager.background,
          borderRadius: 15,
          depth: 40,
          spread: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: 2,
                      top: 2,
                      child: ClayContainer(
                        color: ColorManager.background,
                        height: 32,
                        width: 32,
                        borderRadius: 50,
                        spread: 1,
                        curveType: CurveType.concave,
                        child: GestureDetector(
                          onTap: () {},
                          child: const Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Icon(
                              LineIcons.heart,
                              size: 22,
                              color: ColorManager.kPrimary,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 2,
                      top: 2,
                      child: CustomTag(
                        title: "مجاني",
                        color: ColorManager.green,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                child: Text(
                  title,
                  style: MangeStyles().getRegularStyle(
                    color: ColorManager.white,
                    fontSize: 14,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (price != null)
                      Row(
                        children: [
                          if (discountedPrice != null)
                            Text(
                              '$price USD',
                              style: TextStyle(
                                fontFamily: FontConstants.fontFamily,
                                color: Colors.red,
                                fontSize: 16,
                                decoration: TextDecoration.lineThrough,
                                height: 0.8,
                              ),
                            ),
                          SizedBox(width: 5),
                          Text(
                            discountedPrice != null
                                ? '$discountedPrice'
                                : '$price',
                            style: TextStyle(
                              fontFamily: FontConstants.fontFamily,
                              color: Colors.green,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              height: 0.8,
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BottomSectionCourse(
                      college: trackName,
                      star: "${evaluation.toStringAsFixed(2)}",
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional.bottomEnd,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  child: Text(
                    "Sun, 23 Jun 2024",
                    // DateFormat('dd MMM yyyy').format(
                    //   DateTime.parse("Sun, 23 Jun 2024 01:45:57 GMT"),
                    // ),
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

  //  onTap: () async {
  //       final url =
  //           'https://www.classcentral.com/maestro/provider/coursera?free=true';

  //       try {
  //         // Fetch the web page
  //         var response = await http.get(Uri.parse(url));

  //         // Check if the request was successful
  //         if (response.statusCode == 200) {
  //           print(jsonDecode(response.body)['table']); // Use html parser

  //           var document = parser.parse(jsonDecode(response.body)['table']);
  //           // print(document.body?.text);
  //           // Extract data using DOM manipulation, for example:
  //           var courseTitles =
  //               document.querySelectorAll('h2').map((e) => e.text).toList();
  //           print(courseTitles.length);
  //         } else {
  //           print('Request failed with status: ${response.statusCode}.');
  //         }
  //       } catch (e) {
  //         print('An error occurred: $e');
  //       }
  //     },