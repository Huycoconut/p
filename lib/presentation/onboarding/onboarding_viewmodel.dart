import 'dart:async';

import 'package:clean_architector_with_mvvm_getx/domain/model.dart';
import 'package:clean_architector_with_mvvm_getx/presentation/base/baseviewmodel.dart';
import 'package:clean_architector_with_mvvm_getx/presentation/resources/assets_manager.dart';
import 'package:clean_architector_with_mvvm_getx/presentation/resources/strings_manager.dart';

class OnboardingViewModel extends BaseViewModel with OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  //stream controllers
  final StreamController _streamController = StreamController<SliderViewObject>();

  late final List<SliderObject> _lst;
  int _currentIndex = 0;

  //input
  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    _lst = _getSliderData();

    //send this slider data to our view
    _postDataToView();
  }

  @override
  int goNext() {
    int nextIndex = _currentIndex++;
    if (nextIndex >= _lst.length) {
      _currentIndex = 0; //infinite loop to go to the first
    }

    return _currentIndex;
  }

  @override
  int goPrevious() {
    int previousIndex = _currentIndex--;
    if (previousIndex == -1) {
      _currentIndex = _lst.length - 1; //infinite loop to go to the lenghtof slider list
    }


    return _currentIndex;
  }

  @override
  void onPageChanged(int index) {
    _currentIndex = index;
    _postDataToView();
  }

  @override
  Sink get inputSliderViewObject => _streamController.sink;

  //output
  @override
  Stream<SliderViewObject> get outputSliderViewObject => _streamController.stream.map((sliderViewObject) => sliderViewObject);

  //private function
  List<SliderObject> _getSliderData() => [
        SliderObject(ImagesAssets.onBoardingLogo1, AppStrings.onBoardingSubTitle1, AppStrings.onBoardingTitle1),
        SliderObject(ImagesAssets.onBoardingLogo2, AppStrings.onBoardingSubTitle2, AppStrings.onBoardingTitle1),
        SliderObject(ImagesAssets.onBoardingLogo3, AppStrings.onBoardingSubTitle3, AppStrings.onBoardingTitle1),
        SliderObject(ImagesAssets.onBoardingLogo4, AppStrings.onBoardingSubTitle4, AppStrings.onBoardingTitle1),
      ];

  _postDataToView() {
    inputSliderViewObject.add(SliderViewObject(_currentIndex, _lst.length, _lst[_currentIndex]));
  }
}

//input mean the orders that our view model will recieve from our view
abstract  class OnBoardingViewModelInputs {
  void goNext(); // when user clicks on right arrow or swipe
  void goPrevious(); //when user click on left arrow or swipe right.
  void onPageChanged(int index);

  Sink get inputSliderViewObject; //this is the way to add data to the stream  .. stream input
}

//outputs mean data or results that will be sent from our view model to  our view
abstract  class OnBoardingViewModelOutputs {
  //will be implement it later

  Stream<SliderViewObject> get outputSliderViewObject;
}

class SliderViewObject {
  SliderObject sliderObject;
  int numOfSildes;
  int currentIndex;

  SliderViewObject(this.currentIndex, this.numOfSildes, this.sliderObject);
}
