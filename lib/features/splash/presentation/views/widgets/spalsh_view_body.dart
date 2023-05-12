import 'package:bookly_app/constants/constants.dart';
import 'package:bookly_app/core/utlis/app_router.dart';
import 'package:bookly_app/core/utlis/assets_data.dart';
import 'package:bookly_app/features/splash/presentation/views/widgets/sliding_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../home/presentation/views/home_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});
  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}
class _SplashViewBodyState extends State<SplashViewBody> with SingleTickerProviderStateMixin{
  late AnimationController animationController;
  late Animation<Offset> sliderAnimation;
  @override
  void initState() {
    super.initState();
    initSlidingAnimation();

    navigateToHome();


  }
  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
            AssetsData.logo,
        ),
        const SizedBox(
          height: 4.0,
        ),
        SlidingText(slidingAnimation: sliderAnimation,)
        ,

      ],
    );
  }

  void initSlidingAnimation(){
    animationController=AnimationController(vsync:this,duration: const Duration(seconds: 1)
    );
    sliderAnimation=Tween<Offset>(
        begin:const Offset(0,6) ,end:Offset.zero )
        .animate(animationController);
    animationController.forward();
  }

  void navigateToHome()=> Future.delayed(const Duration(seconds: 5),()
    {
      // Get.to(()=>const HomeView(),
      //     transition: Transition.fade,duration: kTransitionDuration
      // );
      GoRouter.of(context).push(AppRouter.KHomeView);

    }
    );

}



