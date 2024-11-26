import 'package:clean_architector_with_mvvm_getx/domain/model.dart';
import 'package:clean_architector_with_mvvm_getx/presentation/onboarding/onboarding_viewmodel.dart';
import 'package:clean_architector_with_mvvm_getx/presentation/resources/assets_manager.dart';
import 'package:clean_architector_with_mvvm_getx/presentation/resources/color_manager.dart';
import 'package:clean_architector_with_mvvm_getx/presentation/resources/strings_manager.dart';
import 'package:clean_architector_with_mvvm_getx/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _pageController = PageController(initialPage: 0);
  final OnboardingViewModel _viewModel = OnboardingViewModel();

  _bind() {
    _viewModel.start();
  }

  @override
  void initState() {
    // TODO: implement initState
    _bind();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SliderViewObject>(
      stream: _viewModel.outputSliderViewObject,
      builder: (context, snapshot) {
        return _getContentWidget(snapshot.data);
      },
    );
  }

  Widget _getContentWidget(SliderViewObject? sliderViewObject) {
    if (sliderViewObject == null) {
      return Container();
    } else
      return Scaffold(
        backgroundColor: ColorManager.whte,
        appBar: AppBar(
            elevation: AppSize.s0,
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: ColorManager.whte, statusBarBrightness: Brightness.dark, statusBarIconBrightness: Brightness.dark)),
        body: PageView.builder(
          itemCount: sliderViewObject.numOfSildes,
          controller: _pageController,
          onPageChanged: (index) {
            _viewModel.onPageChanged(index);
          },
          itemBuilder: (context, index) {
            return OnBoardingPage(sliderViewObject.sliderObject);
          },
        ),
        bottomSheet: Container(
          color: ColorManager.primary,
          height: AppSize.s100,
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(AppStrings.skip, textAlign: TextAlign.end, style: Theme.of(context).textTheme.titleMedium),
                ),
              ),
              _getBottomSheetWidget(sliderViewObject)
            ],
          ),
        ),
      );
  }

  Widget _getBottomSheetWidget(SliderViewObject? sliderViewObject) {
    return Container(
      color: ColorManager.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(AppPadding.p14),
            child: GestureDetector(
              child: Container(
                color: Colors.black,
                height: AppSize.s20,
                width: AppSize.s20,
                child: SvgPicture.asset(ImagesAssets.rightArrowIc),
              ),
              onTap: () {
                //go to previous slide
                //go to next slide
                _pageController.animateToPage(_viewModel.goNext(),
                    duration: const Duration(microseconds: DurationConstant.d300), curve: Curves.bounceInOut);
              },
            ),
          ),
          //cirlce indeicator

          Row(
            children: [
              for (int i = 0; i < sliderViewObject!.numOfSildes; i++)
                Padding(
                  padding: const EdgeInsets.all(AppSize.s8),
                  child: _getPropercircle(i, sliderViewObject.currentIndex),
                ),
            ],
          ),
          //right arrow
          Padding(
            padding: const EdgeInsets.all(AppPadding.p14),
            child: GestureDetector(
              child: Container(
                color: Colors.black,
                height: AppSize.s20,
                width: AppSize.s20,
                child: SvgPicture.asset(ImagesAssets.rightArrowIc),
              ),
              onTap: () {
                //go to next slide
                _pageController.animateToPage(_viewModel.goPrevious(),
                    duration: const Duration(microseconds: DurationConstant.d300), curve: Curves.bounceInOut);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _getPropercircle(int index, int _currentIndex) {
    if (index == _currentIndex) {
      return SvgPicture.asset(ImagesAssets.hollowCircleIc); //selected slided
    } else {
      return SvgPicture.asset(ImagesAssets.soildCircleIc); //unselected slider
    }
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}

class OnBoardingPage extends StatelessWidget {
  final SliderObject _sliderObject;
  const OnBoardingPage(this._sliderObject, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: AppSize.s28),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.subtitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        const SizedBox(height: AppSize.s60),

        //image widget
        SvgPicture.asset(_sliderObject.image)
      ],
    );
  }
}
