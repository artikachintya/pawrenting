import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar2.dart';
import 'package:pawrentingreborn/features/home/controllers/OrderController.dart';
import 'package:pawrentingreborn/features/home/models/cartItemModel.dart';
import 'package:pawrentingreborn/features/home/screens/Cart/Payment.dart';
import 'package:pawrentingreborn/features/home/screens/widgets/AddressSection.dart';
import 'package:pawrentingreborn/features/home/screens/widgets/DeliveryCard.dart';
import 'package:pawrentingreborn/features/home/screens/widgets/ItemSection.dart';
import 'package:pawrentingreborn/features/home/screens/widgets/PriceDetails.dart';
import 'package:pawrentingreborn/features/home/screens/widgets/VoucherCard.dart';
import 'package:pawrentingreborn/features/home/screens/widgets/Vouchers.dart';
import 'package:pawrentingreborn/features/profile/screens/AddLocationDetail.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';

class OrderDetails extends StatelessWidget {
  final List<CartItemModel> items;
  final bool buyNow;

  const OrderDetails({super.key, required this.items, required this.buyNow});

  /// Fetches locations before rendering UI
  Future<void> _loadLocations(OrderController orderController) async {
    await orderController.locationController.fetchLocations();
  }

  @override
  Widget build(BuildContext context) {
    OrderController orderController = Get.find();

    return FutureBuilder(
      future: _loadLocations(orderController),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            backgroundColor: TColors.primary,
            appBar:
                TAppBar2(title: 'Order Details', subtitle: 'Check your order'),
            body: Center(
                child: CircularProgressIndicator()), // Show loading indicator
          );
        }

        return Scaffold(
          backgroundColor: TColors.primary,
          appBar:
              TAppBar2(title: 'Order Details', subtitle: 'Check your order'),
          bottomNavigationBar: _buildBottomNav(orderController),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
              child: Column(
                children: [
                  _buildAddressSection(orderController),
                  SizedBox(height: 10),
                  _buildDeliverySection(orderController),
                  SizedBox(height: 10),
                  _buildItemsList(),
                  SizedBox(height: 10),
                  GestureDetector(
                      child: VoucherCard(),
                      onTap: () => _showBottomSheet(context)),
                  SizedBox(height: 10),
                  PriceDetails(buyNow: buyNow, items: items),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  /// Bottom navigation bar with total price and payment button
  Widget _buildBottomNav(OrderController orderController) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      height: 80,
      decoration: BoxDecoration(color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildTotalPrice(orderController),
            _buildPaymentButton(),
          ],
        ),
      ),
    );
  }

  /// Address section that waits until locations are loaded
  Widget _buildAddressSection(OrderController orderController) {
    return Obx(() {
      var locations = orderController.locationController.locationsList;
      if (locations.isEmpty) {
        return GestureDetector(
          onTap: () => Get.to(() => AddLocationDetail()),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            height: 80,
            decoration: BoxDecoration(
                // border: Border.all(color: TColors.accent, width: 0.8),
                borderRadius: BorderRadius.circular(10),
                color: TColors.gray),
            child: Row(
              children: [
                ImageIcon(
                  AssetImage(TImages.locationIcon),
                  color: TColors.accent,
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'No Address',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'You haven\'t set any address',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  child: Text(
                    'Add',
                    style: TextStyle(
                        fontFamily: 'Alata',
                        fontWeight: FontWeight.w900,
                        fontSize: 12),
                  ),
                )
              ],
            ),
          ),
        );
      } else {
        return AddressSection(
          location:
              locations[orderController.locationController.selectedIndex.value],
        );
      }
    });
  }

  /// Delivery method selection section
  Widget _buildDeliverySection(OrderController orderController) {
    return Obx(() => DeliveryCard(
          delivery: orderController.deliveryController.deliveryList[
              orderController.deliveryController.selectedIndex.value],
        ));
  }

  /// List of items in the order
  Widget _buildItemsList() {
    return SizedBox(
      height: items.length > 2 ? 275 : 125 * items.length.toDouble(),
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(height: 10),
        physics: AlwaysScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return COItem(item: items[index]);
        },
      ),
    );
  }

  /// Displays total price
  Widget _buildTotalPrice(OrderController orderController) {
    return Container(
      height: 40,
      child: Row(
        children: [
          Text('Total Price: ', style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(width: 10),
          Obx(() => Text(
                !buyNow
                    ? 'Rp${orderController.totalPrice.value.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}'
                    : 'Rp${(items.first.quantity.value * items.first.productModel.salePrice + orderController.deliveryPrice.value + 1000).toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: TColors.accent),
              )),
        ],
      ),
    );
  }

  /// Payment button
  Widget _buildPaymentButton() {
    return GestureDetector(
      onTap: () => Get.to(() => Payment(buyNow: buyNow, items: items)),
      child: Container(
        height: 40,
        width: 150,
        decoration: BoxDecoration(
          color: TColors.accent,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            'Choose Payment',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w700,
                fontFamily: 'AlbertSans',
                letterSpacing: 1),
          ),
        ),
      ),
    );
  }
}

class VoucherExpansionController extends GetxController {
  var isExpanded = <bool>[false, false].obs;

  void togglePanel(int index) {
    isExpanded[index] = !isExpanded[index];
  }
}

void _showBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) {
      final controller = Get.put(VoucherExpansionController());
      return Wrap(children: [
        Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      Icons.close,
                      size: 32,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Voucher',
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Obx(() => ExpansionPanelList(
                    dividerColor: Colors.transparent,
                    elevation: 0,
                    expansionCallback: (panelIndex, isExpanded) {
                      controller.togglePanel(panelIndex);
                    },
                    children:
                        List.generate(controller.isExpanded.length, (index) {
                      return ExpansionPanel(
                          backgroundColor: Colors.transparent,
                          headerBuilder: (context, isExpanded) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  index == 0
                                      ? 'Usable Vouchers'
                                      : 'Unusable Vouchers',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ],
                            );
                          },
                          body: Vouchers(),
                          isExpanded: controller.isExpanded[index]);
                    }),
                  )),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: TColors.grayFont, width: 1.25)),
                child: TextFormField(
                  decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      border: InputBorder.none,
                      hintText: 'Enter voucher code here!',
                      contentPadding: EdgeInsets.all(8)),
                ),
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ]);
    },
  );
}
