import 'package:get/get.dart';
import 'package:news_app/model/data_model.dart';
import 'package:news_app/model/model.dart';
import 'package:news_app/service/service.dart';

class HomeController extends GetxController {
  HomeController() {
    getAllNews();
    getBusinessNews();
    getScienceNews();
    getSportsNews();
  }
  Service service = Service();

  late NewsModel allNewsDatas;
  late NewsModel sportsNewsDatas;
  late NewsModel businessNewsDatas;
  late NewsModel scienceNewsDatas;
  bool isLoading = false;
  void getAllNews() async {
    isLoading = true;
    update();
    await service.getAllNews().then(
      (value) {
        if (value != null) {
          allNewsDatas = value;
          update();
        } else {
          isLoading = false;
          update();
        }
      },
    );
    isLoading = false;
    update();
  }

  NewsDataModel findById(String id) {
    return allNewsDatas.data.firstWhere((element) => element.id == id);
  }

  void getSportsNews() async {
    isLoading = true;
    update();
    await service.getSportsNews().then(
      (value) {
        if (value != null) {
          sportsNewsDatas = value;
          update();
        } else {
          isLoading = false;
          update();
        }
      },
    );
    isLoading = false;
    update();
  }

  void getBusinessNews() async {
    isLoading = true;
    update();
    await service.getBusinessNews().then(
      (value) {
        if (value != null) {
          businessNewsDatas = value;
          update();
        } else {
          isLoading = false;
          update();
        }
      },
    );
    isLoading = false;
    update();
  }

  void getScienceNews() async {
    isLoading = true;
    update();
    await service.getScienceNews().then(
      (value) {
        if (value != null) {
          scienceNewsDatas = value;
          update();
        } else {
          isLoading = false;
          update();
        }
      },
    );
    isLoading = false;
    update();
  }
}
