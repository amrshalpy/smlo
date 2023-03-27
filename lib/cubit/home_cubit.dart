import 'dart:io';

import 'package:dio/dio.dart';
// import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

import 'package:elhamdania/cubit/Home_state.dart';
import 'package:elhamdania/model/category.dart';
import 'package:elhamdania/model/details.dart';
import 'package:elhamdania/model/new_offers.dart';
import 'package:elhamdania/model/privacy.dart';
import 'package:elhamdania/share/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:image_picker/image_picker.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(InitialState());
  static HomeCubit get(context) => BlocProvider.of(context);

  CategoriesModel? categoriesModel;
  void getCategories() {
    emit(GetCategoryLoading());

    DioHelper.getData(
      path: 'https://hamdania.online/api/categories',
    ).then((value) {
      categoriesModel = CategoriesModel.fromJson(value.data);

      emit(GetCategorySucsess());
    }).catchError((er) {
      emit(GetCategoryError());
    });
  }

  int categoryId = 1;
  void getcategoryId(int id) {
    categoryId = id;
    pages = 1;
    emit(GetCategoryId());
  }

  DetailsModel? detailsModel;
  Future<void> getDetails({
    int? categoryIdx,
  }) async {
    emit(GetDetailsLoading());

    DioHelper.getData(
        path: 'https://hamdania.online/api/offers?category_id=$categoryId',
        query: {
          // 'category_id': categoryId,
          // 'page': pages,
        }).then((value) {
      detailsModel = DetailsModel.fromJson(value.data);
      getcontroller();
      emit(GetDetailsSucsess());
    }).catchError((er) {
      emit(GetDetailsError());
    });
  }

  ScrollController sController = ScrollController();

  void getcontroller() {
    sController.jumpTo(0);
  }

  ScrollController controller = ScrollController();
  int pages = 1;
  List? dataOfPages;
  bool isTop = false;
  Future<void> fetchData() async {
    dataOfPages = List.generate(10, (index) => index);

    controller.addListener(() async {
      if (controller.position.pixels == controller.position.maxScrollExtent) {
        emit(FetchDataLoading());
        // controller.animateTo(0.0,
        //     duration: Duration(microseconds: 20), curve: Curves.bounceIn);
        if (detailsModel!.links!.next == null) {
          pages = pages;
        } else {
          pages = pages += 1;
          await getDetails();
          isTop = true;
          emit(FetchDataSucsess());

          print(pages);
        }
      }
    });

    controller.addListener(() {
      if (controller.position.pixels == controller.position.minScrollExtent) {
        emit(FetchDataLoading());

        pages >= 1 ? pages = 1 : pages = pages -= 1;
        getDetails();
        isTop = false;
        print(pages);
        emit(FetchDataSucsess());
      }
    });
  }

  void reducePage() {
    pages -= 1;
    getDetails();
    print(pages);
    emit(Reduce());
  }

  void reducePages() {
    pages = 1;
    getDetails();
    print(pages);
    emit(Reduce());
  }

  DetailsModel? searchOffers;
  void getSearchDetails({
    String? txt,
  }) {
    emit(GetDetailsLoading());

    DioHelper.getData(path: 'https://hamdania.online/api/offers', query: {
      'search': txt,
    }).then((value) {
      searchOffers = DetailsModel.fromJson(value.data);
    }).catchError((er) {
      emit(GetDetailsSucsess());
    }).catchError((er) {
      emit(GetDetailsError());
    });
  }

  NewOffers? offer;
  void getNewOffers() {
    emit(GetNewOffersLoading());
    DioHelper.getData(path: 'https://hamdania.online/api/new-offers')
        .then((value) {
      offer = NewOffers.fromJson(value.data);

      emit(GetNewOffersSucsess());
    }).catchError((er) {
      emit(GetNewOffersError());
    });
  }

  Privacy? privacy;
  void getPrivacy() {
    emit(GetPrivacyLoading());
    DioHelper.getData(path: 'https://hamdania.online/api/settings')
        .then((value) {
      privacy = Privacy.fromJson(value.data);
      emit(GetPrivacySucsess());
    }).catchError((er) {
      emit(GetPrivacyError());
    });
  }

  var progressString = "";

  // void downloadFile(imgUrl) async {
  //   try {
  //     final dio = Dio();
  //     emit(DownloadLoading());
  //     final Directory? directory = await getExternalStorageDirectory();
  //     final String savePath = '${directory!.path}/myvideo.mp4';
  //     await dio.download(imgUrl, savePath);
  //     print('Video downloaded successfully');
  //     // await launch(savePath);
  //     final file = File(savePath);
  //     emit(DownloadSucsses());
  //     file.readAsString().then((String contents) {
  //       print(contents);
  //     }).catchError((e) {
  //       print(e.toString());
  //     });
  //     emit(DownloadSucsses());
  //   } catch (e) {
  //     print('Error downloading video: $e');
  //   }
  // }

  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  void onRefresh() async {
    // monitor network fetch
    // await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    refreshController.refreshCompleted();
    pages = pages -= 1;
    getDetails();
    emit(GetDetailsSucsess());
  }

  void onLoading() async {
    emit(GetDetailsLoading());

    // await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    dataOfPages!.add((detailsModel!.data!.length + 1).toString());

    refreshController.loadComplete();
    pages = pages += 1;
    getDetails();
    emit(GetDetailsSucsess());
  }

  // Future openFile(String? url, String? name) async {
  //   final file = await downloadFile(url, name);
  //   if (file!.path == null) return;
  //   print('path${file.path}');
  //   OpenFile.open(file.path);
  // }

  Future<File?> downloadFile(String? url, String? name) async {
    final openFile = await getApplicationDocumentsDirectory();
    final file = File('${openFile.path}/$name');
    try {
      final response = await Dio().get(
        url!,
        options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,
          // receiveTimeout: 0,
        ),
      );
      final ref = await file.openSync(mode: FileMode.write);
      ref.writeFromSync(response.data);
      await ref.close();
      return file;
    } catch (er) {
      print(er);
    }
  }
}
