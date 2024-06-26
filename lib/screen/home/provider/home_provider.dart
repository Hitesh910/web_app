import 'package:flutter/material.dart';

import '../model/data_model.dart';

class HomeProvider with ChangeNotifier {
  double isCheck = 0;
  List<DataModel> dataList = [
    DataModel(
        // icon: Icons.nat,
        title: "New Aadhar Card",
        link: "https://appointments.uidai.gov.in/bookappointment.aspx",
        image: "assets/image/new.png"),
    DataModel(
        // icon: Icons.update,
        title: "Update Aadhar",
        link: "https://myaadhaar.uidai.gov.in/du",
        image: "assets/image/update.png"),
    DataModel(
        title: "Lock/Unlock Aadhar",
        link: "https://myaadhaar.uidai.gov.in/lock-unlock-aadhaar",
        image: "assets/image/lock.png"
    ),
    DataModel(
      title: "Verify Email/Mobile",
      link: "https://myaadhaar.uidai.gov.in/verify-email-mobile",image: "assets/image/verify.png"
    ),
    DataModel(
      title: "Download Aadhar",link: "https://myaadhaar.uidai.gov.in/genricDownloadAadhaar",image: "assets/image/download.png"
    )
  ];

  void checkProgress(double check)
  {
    isCheck = check;
    notifyListeners();
  }
}
