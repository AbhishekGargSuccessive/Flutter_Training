import 'package:my_app/core/constant/string_constants.dart';
import '../core/constant/image_constants.dart';

class TestModel {
  String? title;
  String? image;
  TestModel({this.image, this.title});
}

List<TestModel> testData = [
  TestModel(image: ImageConstants.food, title: StringConstants.food),
  TestModel(image: ImageConstants.instamart, title: StringConstants.instamart),
  TestModel(image: ImageConstants.dineout, title: StringConstants.dineout),
  TestModel(image: ImageConstants.genie, title: StringConstants.genie),
  TestModel(
      image: ImageConstants.meatDelivery, title: StringConstants.meatDelivery),
];
