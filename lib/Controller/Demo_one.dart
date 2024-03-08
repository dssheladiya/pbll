// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
//
// class ListController extends GetxController {
//   var dataList = <ListItem>[].obs;
//   final _box = GetStorage();
//
//   @override
//   void onInit() {
//     super.onInit();
//     _loadData();
//   }
//
//   void _loadData() {
//     var savedData = _box.read<List<dynamic>>('listItems');
//     if (savedData != null) {
//       dataList.assignAll(
//           savedData.map((item) => ListItem(item['title'], item['isSelected'])));
//     }
//   }
//
//   Future<void> saveData() async {
//     var data = dataList
//         .map((item) => {'title': item.title, 'isSelected': item.isSelected})
//         .toList();
//     _box.write('listItems', data);
//     update();
//   }
//
//   void toggleSelection(int index) {
//     dataList[index].isSelected = !dataList[index].isSelected;
//     saveData();
//   }
//
//   void deleteSelectedItems() {
//     dataList.removeWhere((item) => item.isSelected);
//     saveData();
//   }
// }
//
// class ListItem {
//   final String title;
//   bool isSelected;
//
//   ListItem(this.title, this.isSelected);
// }
