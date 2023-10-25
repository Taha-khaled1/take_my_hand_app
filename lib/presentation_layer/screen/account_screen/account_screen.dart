import 'package:take_hand/presentation_layer/screen/account_screen/widget/body_account_screen.dart';
import 'package:take_hand/presentation_layer/src/account_url.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.background,
      appBar: appbar("ادارة حسابك"),
      body: const BodyAccountScreen(),
    );
  }
}
