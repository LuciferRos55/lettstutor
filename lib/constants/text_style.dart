import 'package:flutter/material.dart';
import 'colors.dart';

class TextStyles {
  TextStyles._(); // this basically makes it so you can't instantiate this class

  static Map<String, TextStyle> styles = <String, TextStyle>{
    "sectionTitle": TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w800,
        color: AppColors.colors['textColor1']),
    "sectionAction": TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.colors['systemColor']),
    "itemTitle": TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w800,
        color: AppColors.colors['textColor1'],
        height: 1.5),
    "itemContent": TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: AppColors.colors['textColor3'],
        height: 1.5),
    "featureTitle": TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w800,
        color: AppColors.colors['textColor2'],
        height: 1.5),
    "mainCategoryTitle": TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w800,
        color: AppColors.colors['textColor2'],
        height: 1.5),
    "itemPack": TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: AppColors.colors['systemColor'],
        height: 1.5),
    "itemPrice": TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w800,
        color: AppColors.colors['priceColor'],
        height: 1.5),
    "itemAmount": TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.colors['textColor3'],
        height: 1.5),
    "campaignProcessAmount": TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w800,
        color: Colors.white,
        height: 1.5),
    "voucherTime": TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: AppColors.colors['textColor3'],
        height: 1.5),
    "wholesalePriceItemTitle": TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: AppColors.colors['textColor2'],
        height: 1.5),
    "wholesalePriceItemPrice": TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w800,
        color: AppColors.colors['priceColor'],
        height: 1.5),
  };

  static Map<String, TextStyle> commentItem = <String, TextStyle>{
    "itemTitle": TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w800,
        color: AppColors.colors['textColor1'],
        height: 1.5),
    "itemTime": TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: AppColors.colors['textColor3'],
        height: 1.5),
    "itemContent": TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.colors['textColor2'],
        height: 1.5),
  };

  static Map<String, TextStyle> actionItem = <String, TextStyle>{
    "itemTitle": TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.colors['textColor2'],
        height: 1.5),
    "itemAmount": TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w800,
        color: Colors.white,
        height: 1.5),
  };

  static Map<String, TextStyle> notificationOrderStatus = <String, TextStyle>{
    "itemTitle": TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w800,
        color: AppColors.colors['textColor2'],
        height: 1.5),
    "itemOrderCode": TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w800,
        color: AppColors.colors['systemColor'],
        height: 1.5),
    "itemTime": TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: AppColors.colors['textColor3'],
        height: 1.5),
    "itemContent": TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.colors['textColor3'],
        height: 1.5),
  };

  static Map<String, TextStyle> deliveryAddressItem = <String, TextStyle>{
    "itemName": TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w800,
        color: AppColors.colors['textColor2'],
        height: 1.5),
    "itemAction": TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.colors['systemColor'],
        height: 1.5),
    "itemAddress": TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.colors['textColor3'],
        height: 1.5),
  };

  static Map<String, TextStyle> orderItem = <String, TextStyle>{
    "itemTime": TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: AppColors.colors['textColor2'],
        height: 1.5),
    "itemStatus": TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: AppColors.colors['systemColor'],
        height: 1.5),
    "itemOrderCode": TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w800,
        color: AppColors.colors['textColor2'],
        height: 1.5),
    "itemShipping": TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w800,
        color: AppColors.colors['textColor2'],
        height: 1.5),
    "itemPrice": TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w800,
        color: AppColors.colors['priceColor'],
        height: 1.5),
    "label": TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: AppColors.colors['textColor3'],
        height: 1.5),
  };
  static Map<String, TextStyle> productItemOrder = <String, TextStyle>{
    "itemTitle": TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w800,
        color: AppColors.colors['textColor1'],
        height: 1.5),
    "itemAmount": TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.colors['textColor3'],
        height: 1.5),
    "itemPrice": TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w800,
        color: AppColors.colors['priceColor'],
        height: 1.5),
  };

  static Map<String, TextStyle> shopItem = <String, TextStyle>{
    "itemName": TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w800,
        color: AppColors.colors['textColor1'],
        height: 1.5),
    "itemFollow": TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.colors['textColor2'],
        height: 1.5),
    "itemChat": TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.colors['textColor2'],
        height: 1.5),
    "label": TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: AppColors.colors['textColor3'],
        height: 1.5),
  };

  static Map<String, TextStyle> farmItem = <String, TextStyle>{
    "itemName": TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w800,
        color: AppColors.colors['textColor1'],
        height: 1.5),
    "itemAddress": TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: AppColors.colors['textColor3'],
        height: 1.5),
    "itemFollow": TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.colors['textColor2'],
        height: 1.5),
    "itemChat": TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.colors['textColor2'],
        height: 1.5),
    "label": TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: AppColors.colors['textColor3'],
        height: 1.5),
  };

  static Map<String, TextStyle> chatItem = <String, TextStyle>{
    "itemName": TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w800,
        color: AppColors.colors['textColor1'],
        height: 1.5),
    "itemTime": TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: AppColors.colors['textColor3'],
        height: 1.5),
    "itemContent": TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.colors['textColor3'],
        height: 1.5),
  };

  static Map<String, TextStyle> searchHistoryItem = <String, TextStyle>{
    "itemContent": TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w800,
        color: AppColors.colors['textColor2'],
        height: 1.5),
  };

  static Map<String, TextStyle> searchBar = <String, TextStyle>{
    "hint": TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.colors['textColor3']),
    "suggest": TextStyle(
        fontSize: 12, fontWeight: FontWeight.w800, color: Colors.white),
  };

  static Map<String, TextStyle> topSystemNode = <String, TextStyle>{
    "title": TextStyle(
        fontSize: 14, fontWeight: FontWeight.w800, color: Colors.white),
  };

  static Map<String, TextStyle> detailProduct = <String, TextStyle>{
    "productName": TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w800,
        color: AppColors.colors['textColor1'],
        height: 1.5),
    "productPrice": TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w800,
        color: AppColors.colors['priceColor'],
        height: 1.5),
    "productDiscount": TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w800,
        color: AppColors.colors['errorColor'],
        height: 1.5),
    "productAmount": TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.colors['textColor3'],
        height: 1.5),
    "productComment": TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.colors['systemColor'],
        height: 1.5),
  };

  static Map<String, TextStyle> detailSystemCampaign = <String, TextStyle>{
    "campaignName": TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w800,
        color: AppColors.colors['textColor1'],
        height: 1.5),
    "campaignTime": TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.colors['textColor3'],
        height: 1.5),
    "termItem": TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.colors['textColor3'],
        height: 1.5),
  };

  static Map<String, TextStyle> shoppingCart = <String, TextStyle>{
    "priceLabel": TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.colors['textColor3'],
        height: 1.5),
    "price": TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w800,
        color: AppColors.colors['priceColor'],
        height: 1.5),
  };

  static Map<String, TextStyle> profile = <String, TextStyle>{
    "name": TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w800,
        color: AppColors.colors['textColor1'],
        height: 1.5),
    "email": TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: AppColors.colors['textColor3'],
        height: 1.5),
    "orderStatusTitle": TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w800,
        color: AppColors.colors['textColor1'],
        height: 1.5),
  };

  static Map<String, TextStyle> tab = <String, TextStyle>{
    "label": TextStyle(
        fontFamily: 'Quicksand',
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: AppColors.colors['systemColor'],
        height: 1.5),
  };

  static Map<String, TextStyle> detailOrder = <String, TextStyle>{
    "statusTitle": TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: AppColors.colors['textColor2'],
        height: 1.5),
    "statusTime": TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: AppColors.colors['textColor3'],
        height: 1.5),
  };

  static Map<String, TextStyle> filter = <String, TextStyle>{
    "modalTitle": TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w800,
      color: AppColors.colors['textColor1'],
    ),
    "title": TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w800,
      color: AppColors.colors['textColor1'],
    ),
    "label": TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: AppColors.colors['textColor3'],
    ),
    "labelSort": TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: AppColors.colors['textColor3'],
    ),
    "priceTypeContent": TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: AppColors.colors['textColor3'],
    ),
    "priceTypeContentSelected": TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w800,
      color: AppColors.colors['systemColor'],
    ),
  };

  static Map<String, TextStyle> textField = <String, TextStyle>{
    "label": TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: AppColors.colors['textColor3'],
    ),
  };

  static Map<String, TextStyle> buyNotification = <String, TextStyle>{
    "title": TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    "description": TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    "notification": TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: AppColors.colors['textColor3'],
    ),
  };

  static Map<String, TextStyle> detailChat = <String, TextStyle>{
    "name": TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w800,
      color: AppColors.colors['textColor1'],
    ),
    "status": TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: AppColors.colors['textColor3'],
    ),
  };

  static Map<String, TextStyle> textMessage = <String, TextStyle>{
    "receiverType": TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        height: 1.5,
        color: AppColors.colors['textColor3']),
    "senderType": TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        height: 1.5,
        color: Colors.white),
  };

  static Map<String, TextStyle> areaItem = <String, TextStyle>{
    "itemTitle": TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w800,
        height: 1.5,
        color: AppColors.colors['textColor1']),
    "itemContent": TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        height: 1.5,
        color: AppColors.colors['textColor3']),
  };

  static Map<String, TextStyle> shippingPoint = <String, TextStyle>{
    "itemTitle": TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w800,
        color: AppColors.colors['textColor1'],
        height: 1.5),
    "itemTime": TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: AppColors.colors['textColor3'],
        height: 1.5),
    "utilitiesName": TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: AppColors.colors['textColor2'],
        height: 1.5),
    "utilitiesAttr": TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: AppColors.colors['textColor3'],
        height: 1.5),
    "itemPrice": TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w800,
        color: AppColors.colors['priceColor'],
        height: 1.5),
  };

  static Map<String, TextStyle> accountItem = <String, TextStyle>{
    "itemTitle": TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w800,
        color: AppColors.colors['textColor1'],
        height: 1.5),
    "itemRole": TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: AppColors.colors['textColor3'],
        height: 1.5),
  };

}
