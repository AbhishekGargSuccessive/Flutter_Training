import 'package:my_app/core/constant/string_constants.dart';

class DrawerDataModel {
  String title;
  String? subTitle;
  DrawerDataModel({required this.title, this.subTitle});
}

List<DrawerDataModel> drawerList = [
  DrawerDataModel(
      title: StringConstants.oneMembership, subTitle: StringConstants.subText1),
  DrawerDataModel(
      title: StringConstants.myAccount, subTitle: StringConstants.subText2),
  DrawerDataModel(
      title: StringConstants.addresses, subTitle: StringConstants.subText3),
  DrawerDataModel(
      title: StringConstants.payment, subTitle: StringConstants.subText4),
  DrawerDataModel(
      title: StringConstants.swiggyMonney, subTitle: StringConstants.subText5),
  DrawerDataModel(
      title: StringConstants.help, subTitle: StringConstants.subText6),
  DrawerDataModel(title: StringConstants.logOut),
];
