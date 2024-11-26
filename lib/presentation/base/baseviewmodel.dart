abstract class BaseViewModel extends BaseViewModelInput with BaseViewModelOutput{
  // share variavles and functions that willl be used throungh any view model.
}

abstract class BaseViewModelInput {
  void start(); //will be called while init. of view model
  void dispose(); //will be called when viewmodel dies.
}

 class BaseViewModelOutput {}
