import 'package:take_hand/presentation_layer/components/appbar.dart';
import 'package:take_hand/presentation_layer/resources/values_manager.dart';
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
                          "منذ أيام، كنت أعمل على كتابة إحدى البحوث الأكاديمية في مجال الطيران لأحد الأشخاص، وقد تعرضت لأحد المواقف الغريبة التي أرغب في مشاركتها معكم أيها الكتاب!",
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
                        "محمد الشريف",
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
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  // width: deviceInfo.localWidth * 0.9,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      "assets/images/pexels-iriser-1366957.jpg",
                      width: double.infinity,
                      height: 250, // Adjust the height as per your layout needs
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                AppSizedBox.sizedBox_10,
                html.Html(
                  data: """
<ol>
	<li>
		<p>
			<strong>تعلم الآلة Machine learning:</strong> عرّف آرثر صموئيل تعلم الآلة بأنّه المجال الذي يعطي الحاسوب القدرة على التعلم من المشاكل التي يصادفها دون تعليمات واضحة تُعطى له، أي القدرة على معالجة مشاكل جديدة.
		</p>
	</li>
	<li>
		<p>
			<strong>الشبكات العصبية الاصطناعية Artificial Neural Networks:</strong> عبارة عن مجموعة من الخوارزميات المُصممة بطريقة مُستوحاة من الخلايا العصبية في الدماغ البشري، وهي مصممة للتعرف على الأنماط.
		</p>
	</li>
	<li>
		<p>
			<strong>التعلم العميق Deep Learning:</strong> يستخدم شبكات عصبية ضخمة مع العديد من طبقات وحدات المعالجة، حيث يستفيد من التطورات الحوسبية الكبيرة (المعالجات القوية مثلًا) وتقنيات التدريب المحسنة لتعلم الأنماط المعقدة بكميات كبيرة من البيانات.
		</p>
	</li>
	<li>
		<p>
			<strong>أتمتة العمليات الآلية Robotic Process Automation:</strong> يمكن أن يكون مصطلح أتمتة العمليات الآلية مربكًا بعض الشيء؛ لا تعني كلمة آلية أو روبوتية هنا الروبوتات المادية، وإنما الروبوتات التي تُمثل برامج (برامج آلية) تُنفِّذ بعض العمليات التقليدية المكررة، مثل وإدارة المعاملات وإرسال الفواتير وتقديم ردود نموذجية للعملاء (روبوتات الدردشة، لابد وأنك تعرفها).
		</p>
	</li>
	<li>
		<p>
			<strong>الروبوتات Robots:</strong> هو آلة يمكنها إنجاز المهام الموكلة إليها من خلال تنفيذ سلسلة معقدة من الإجراءات تلقائيًا. يمكن توجيه الروبوت بواسطة جهاز تحكم خارجي، أو قد يكون عنصر التحكم مضمنًا فيه.
		</p>
	</li>
	<li>
		<p>
			<strong>الأنظمة الخبيرة Expert systems:</strong> النظام الخبير هو محاولة جمع الخبرة البشرية المتعلقة بمجال محدد ضمن الحاسب لكي يحل محل الخبير، أو يمكننا القول أنّه برنامج مصمم لينفد مهاماً متعلقة بالخبرة البشرية، وهذا يتضمن التحليل والتشخيص واتخاذ القرارات والتنفيذ أيضًا.
		</p>
	</li>
	<li>
		<p>
			<strong>المنطق الترجيحي أو الضبابي Fuzzy Logic:</strong> المنطق الضبابي هو نهج للحوسبة يعتمد على "درجات الحقيقة degrees of truth" بدلاً من المنطق الثنائي "صح أو خطأ" المعتاد (1 أو 0) الذي يعتمد عليه الحاسب ويحاول حل المشكلات باستخدام طيف مفتوح وغير دقيق من البيانات والاستدلالات التي تجعل من الممكن الحصول على مجموعة من الاستنتاجات الدقيقة.
		</p>
	</li>
</ol>

      
      
      """,
                ),
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
                SectionHeaderAndFilter(
                  is_more: false,
                  title: 'المقالات',
                  press: () {},
                ),
                SizedBox(
                  height: 320,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: ArticleCard(
                          imageUrl: 'assets/images/pexels-iriser-1366957.jpg',
                          title:
                              'بعض الامثله التي يمكنك تطبيقها مثل الاغاني و العب كرة القدم',
                          date: '21/11/23',
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
        },
      ),
    );
  }
}
