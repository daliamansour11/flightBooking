

//onBoarding Model
class SliderModel{
  String title;
  String subTitle;
  String image;

  SliderModel(
      this.title ,
      this.subTitle  ,
      this.image
      );
}

class SliderView{
  SliderModel sliderModel;
  int numofSlider;
  int current_index;

  SliderView(
      this.sliderModel,
      this.numofSlider,
      this.current_index,
      );
}
