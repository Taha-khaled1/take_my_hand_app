import 'package:take_hand/presentation_layer/src/style_packge.dart';

class SearchField extends StatefulWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField>
    with SingleTickerProviderStateMixin {
  late TextEditingController _controller;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _fadeAnimation =
        Tween<double>(begin: 0.5, end: 1.0).animate(_animationController);

    _controller.addListener(() {
      setState(() {
        if (_controller.text.isNotEmpty) {
          _animationController.forward();
        } else {
          _animationController.reverse();
        }
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: TextField(
        style: const TextStyle(color: ColorManager.background),
        controller: _controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: 'ابحث...',
          suffixIcon: Icon(Icons.search, color: Theme.of(context).primaryColor),
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          hintStyle: MangeStyles().getLightStyle(
            color: ColorManager.backgroundpersonalimage,
            fontSize: FontSize.s18,
          ),
        ),
      ),
    );
  }
}
