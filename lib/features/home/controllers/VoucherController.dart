import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pawrentingreborn/data/repositories/VoucherRepo.dart';
import 'package:pawrentingreborn/features/profile/models/VoucherModel.dart';


class VoucherController extends GetxController {
  final voucherRepo = VoucherRepo.instance;
  RxList<VoucherModel> voucherList = <VoucherModel>[].obs;

  Rx<bool> isSelected = true.obs;

  void toggleVoucher() {
    isSelected.value = !isSelected.value;
  }

  @override
  void onInit() {
    fetchVoucher();
    ever(voucherList, (_){
      for (var voucher in voucherList){
        print(voucher.code);
      }
    });
    super.onInit();
  } 

  Future <void>fetchVoucher()async{
    final vouchers = await voucherRepo.getVouchers();
    voucherList.assignAll(vouchers);
    print({voucherList.length});
  }

  void addVoucher(VoucherModel voucher) async {
    await voucherRepo.createVoucher(voucher);
    voucherList.add(voucher);
  }

  void testAdd() async{
    VoucherModel voucher = VoucherModel(
      image: 'assets/images/voucher.png',
      validUntil: '11 March 2025',
      code: 'JAJANMAKAN',
      maxDiscount: 100000,
      minPurchase: 200000,
      title: 'Enjoy Up to 40% Off!',
      percentage: 40,
    );
    await voucherRepo.createVoucher(voucher);
    voucherList.add(voucher);
  }

  void filterVouchers(String find){
    if(find.isEmpty){
      voucherList.refresh();
      return;
    }
    List<VoucherModel> filteredList= voucherList.where((voucher) => voucher.code.toLowerCase().contains(find.toLowerCase())).toList();
    filteredList.contains(find);
  }
  
}
