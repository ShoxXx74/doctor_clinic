import 'package:doctor_clinic/features/onboarding/widgets/doc_logo_and_name.dart';
import 'package:doctor_clinic/features/onboarding/widgets/doctor_image_and_text.dart';
import 'package:doctor_clinic/features/onboarding/widgets/get_strarted_button.dart';
import 'package:doctor_clinic/features/onboarding/widgets/on_boarding_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() =>
      _OnboardingScreenState();
}

class _OnboardingScreenState
    extends State<OnboardingScreen>
    with TickerProviderStateMixin {
  late AnimationController _mainController;
  late AnimationController _pulseController;

  late Animation<Offset> _logoSlide;
  late Animation<double> _logoFade;

  late Animation<Offset> _doctorSlide;
  late Animation<double> _doctorFade;

  late Animation<Offset> _textSlide;
  late Animation<double> _textFade;

  late Animation<Offset> _buttonSlide;
  late Animation<double> _buttonFade;

  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();

    _mainController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 2200,
      ),
    );

    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _pulseAnimation =
        Tween<double>(
          begin: 1.0,
          end: 1.08,
        ).animate(
          CurvedAnimation(
            parent: _pulseController,
            curve: Curves.easeInOut,
          ),
        );

    _logoSlide =
        Tween(
          begin: const Offset(0, 0),
          end: Offset.zero,
        ).animate(
          CurvedAnimation(
            parent: _mainController,
            curve: const Interval(0.0, 0.25),
          ),
        );
    _logoFade = Tween(begin: 0.0, end: 1.0)
        .animate(
          CurvedAnimation(
            parent: _mainController,
            curve: const Interval(0.0, 0.25),
          ),
        );

    _doctorSlide =
        Tween(
          begin: const Offset(0, -1),
          end: Offset.zero,
        ).animate(
          CurvedAnimation(
            parent: _mainController,
            curve: const Interval(0.25, 0.5),
          ),
        );
    _doctorFade = Tween(begin: 0.0, end: 1.0)
        .animate(
          CurvedAnimation(
            parent: _mainController,
            curve: const Interval(0.25, 0.5),
          ),
        );

    _textSlide =
        Tween(
          begin: const Offset(0, -1),
          end: Offset.zero,
        ).animate(
          CurvedAnimation(
            parent: _mainController,
            curve: const Interval(0.5, 0.75),
          ),
        );
    _textFade = Tween(begin: 0.0, end: 1.0)
        .animate(
          CurvedAnimation(
            parent: _mainController,
            curve: const Interval(0.5, 0.75),
          ),
        );

    _buttonSlide =
        Tween(
          begin: const Offset(0, -1),
          end: Offset.zero,
        ).animate(
          CurvedAnimation(
            parent: _mainController,
            curve: const Interval(0.75, 1.0),
          ),
        );
    _buttonFade = Tween(begin: 0.0, end: 1.0)
        .animate(
          CurvedAnimation(
            parent: _mainController,
            curve: const Interval(0.75, 1.0),
          ),
        );

    _mainController.forward();

    _mainController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _pulseController.forward().then(
          (_) => _pulseController.reverse(),
        );
      }
    });
  }

  @override
  void dispose() {
    _mainController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  Widget animatedItem({
    required Animation<Offset> slide,
    required Animation<double> fade,
    required Widget child,
  }) {
    return FadeTransition(
      opacity: fade,
      child: SlideTransition(
        position: slide,
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              animatedItem(
                slide: _logoSlide,
                fade: _logoFade,
                child: const DocLogoAndName(),
              ),

              animatedItem(
                slide: _doctorSlide,
                fade: _doctorFade,
                child: const DoctorImageAndText(),
              ),
              SizedBox(height: 20.h),

              animatedItem(
                slide: _textSlide,
                fade: _textFade,
                child: const OnBoardingText(),
              ),
              SizedBox(height: 50.h),

              animatedItem(
                slide: _buttonSlide,
                fade: _buttonFade,
                child: ScaleTransition(
                  scale: _pulseAnimation,
                  child: const GetStartedButton(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
