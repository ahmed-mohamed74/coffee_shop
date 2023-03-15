import 'package:bloc/bloc.dart';
import 'package:coffee_shop/paymob_package/controller/cubit/payment_cubit_state.dart';
import 'package:coffee_shop/paymob_package/core/network/constant.dart';
import 'package:coffee_shop/paymob_package/core/network/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentCubit extends Cubit<PaymentCubitState> {
  PaymentCubit() : super(PaymentCubitInitial());

  static PaymentCubit get(context) => BlocProvider.of(context);

  Future<void> getAuthToken() async {
    emit(PaymentAuthLoadingState());
    DioHelper.postDataDio(url: ApiContest.getAuthToken, data: {
      "api_key": ApiContest.paymentApiKey,
    }).then((value) {
      ApiContest.paymentFirstToken = value.data['token'];
      print('the token ${ApiContest.paymentFirstToken}');
      emit(PaymentAuthSuccessState());
    }).catchError((error) {
      emit(PaymentAuthErrorState());
    });
  }

  Future<void> getGetOrderRegistrationId({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String price,
  }) async {
    emit(PaymentGetOrderIdLoadingState());
    DioHelper.postDataDio(url: ApiContest.getOrderId, data: {
      "auth_token": ApiContest.paymentFirstToken,
      "delivery_needed": "false",
      "amount_cents": price,
      "currency": "EGP",
      "items": [],
    }).then((value) {
      ApiContest.paymentOrderId = value.data['id'].toString();
      print('the order id ${ApiContest.paymentOrderId}');
      getPaymentRequest(
          firstName: firstName,
          lastName: lastName,
          email: email,
          phone: phone,
          price: price);
      emit(PaymentGetOrderIdSuccessState());
    }).catchError((error) {
      print('the error ${error.toString()}');
      emit(PaymentGetOrderIdErrorState());
    });
  }

  Future<void> getPaymentRequest({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String price,
  }) async {
    emit(PaymentGetPaymentRequestLoadingState());
    DioHelper.postDataDio(url: ApiContest.getPaymentId, data: {
      "auth_token": ApiContest.paymentFirstToken,
      "amount_cents": price,
      "expiration": 3600,
      "order_id": ApiContest.paymentOrderId,
      "billing_data": {
        "apartment": "NA",
        "email": email,
        "floor": "NA",
        "first_name": firstName,
        "street": "NA",
        "building": "NA",
        "phone_number": phone,
        "shipping_method": "NA",
        "postal_code": "NA",
        "city": "NA",
        "country": "NA",
        "last_name": lastName,
        "state": "NA"
      },
      "currency": "EGP",
      "integration_id": ApiContest.integrationIdCart,
      "lock_order_when_paid": "false"
    }).then((value) {
      ApiContest.finalToken = value.data['token'].toString();
      print('the final token ${ApiContest.finalToken}');
      emit(PaymentGetPaymentRequestSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(PaymentGetPaymentRequestErrorState());
    });
  }

  Future<void> getRefCode() async {
    emit(PaymentRefCodeLoadingState());
    DioHelper.postDataDio(url: ApiContest.getRefCode, data: {
      "source": {
        "identifier": "AGGREGATOR",
        "subtype": "AGGREGATOR",
      },
      "payment_token": ApiContest.finalToken,
    }).then((value) {
      ApiContest.refCode = value.data['id'].toString();
      print('the ref code ${ApiContest.refCode}');
      emit(PaymentRefCodeSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(PaymentRefCodeErrorState());
    });
  }
}
