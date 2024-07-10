import 'package:take_hand/data_layer/models/class_central_model.dart';
import 'package:take_hand/data_layer/data_source/udemy_source.dart';
import 'package:take_hand/presentation_layer/src/get_packge.dart';
import 'package:take_hand/presentation_layer/utils/helper_function.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart' as dom;
import 'dart:convert';

class ClassCentralController extends GetxController with UdemySource {
  StatusRequest statusRequest = StatusRequest.loading;
  List<ClassCentralModel> courseData = [];
  getClassCentralResponse() async {
    try {
      statusRequest = StatusRequest.loading;
      update();
      final provider = Get.arguments['provider'];
      HelperFunction.printYellowText('course - ' + provider.toString());

      final response = await http.get(
        Uri.parse(
          'https://www.classcentral.com/maestro/provider/$provider?free=true',
        ),
      );

      if (response.statusCode == 200) {
        final document = parser.parse(jsonDecode(response.body)['table']);
        final courses = document.getElementsByClassName('course-list-course');

        for (dom.Element course in courses) {
          final courseNameElement =
              course.getElementsByClassName('course-name').first;
          final courseName = courseNameElement.text.trim();

          final courseLink = courseNameElement.attributes['href'] ?? '';

          // final ratingElement =
          //     course.getElementsByClassName('cmpt-rating-medium').first;
          // final rating = ratingElement.attributes['aria-label'] ?? '';

          final reviewCountElement = course
              .getElementsByClassName('text-3 color-gray margin-left-xxsmall')
              .first;
          final reviewCount = reviewCountElement.text.trim();

          final pictureElement = course.querySelector('img');
          final pictureUrl = pictureElement?.attributes['src'] ?? '';

          final providerElement =
              course.querySelector('a[aria-label="Provider"]');
          final provider = providerElement?.text.trim() ?? '';

          final institutionElement = course.querySelector('img[title]');
          final institutionName = institutionElement?.attributes['title'] ?? '';
          // final institutionImageUrl =
          //     institutionElement?.attributes['src'] ?? '';
          final avgRatingElement = course.querySelector('[data-track-props]');
          final avgRating = avgRatingElement?.attributes['data-track-props'] !=
                  null
              ? jsonDecode(avgRatingElement!.attributes['data-track-props']!)[
                      'course_avg_rating']
                  .toString()
              : '';
          final courseScreap = ClassCentralModel(
            name: courseName,
            link: courseLink,
            rating: avgRating,
            reviewCount: reviewCount,
            picture: pictureUrl,
            provider: provider,
            category: "", // Add logic to extract category if available
            creator: institutionName,
          );

          courseData.add(courseScreap);
        }

        // Print or use the extracted course data
        for (var course in courseData) {
          HelperFunction.printYellowText('--------------------');
          print('Course Name: ${course.name}');
          print('Course Link: ${course.link}');
          print('Course Rating: ${course.rating}');
          print('Review Count: ${course.reviewCount}');
          print('Picture URL: ${course.picture}');
          print('Provider: ${course.provider}');
          print('Institution Name: ${course.creator}');
          HelperFunction.printYellowText('--------------------');
        }
      } else {
        print('Failed to load course data');
      }
    } catch (e) {
      print(e.toString());
    }

    statusRequest = StatusRequest.success;
    update();
  }

  @override
  void onInit() {
    getClassCentralResponse();
    super.onInit();
  }
}
  // courseData.add({
  //           'name': courseName,
  //           'link': courseLink,
  //           'rating': rating,
  //           'reviewCount': reviewCount,
  //           'createor': "",
  //           'price': "00.0",
  //           'sale_price': "00.0",
  //           'category': "category",
  //           'image': "",
  //           'meaker': "",
  //         });