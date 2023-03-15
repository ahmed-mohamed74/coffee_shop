abstract class PaymentCubitState {}

class PaymentCubitInitial extends PaymentCubitState {}

class PaymentAuthLoadingState extends PaymentCubitState {}

class PaymentAuthSuccessState extends PaymentCubitState {}

class PaymentAuthErrorState extends PaymentCubitState {}

class PaymentGetOrderIdLoadingState extends PaymentCubitState {}

class PaymentGetOrderIdSuccessState extends PaymentCubitState {}

class PaymentGetOrderIdErrorState extends PaymentCubitState {}

class PaymentGetPaymentRequestLoadingState extends PaymentCubitState {}

class PaymentGetPaymentRequestSuccessState extends PaymentCubitState {}

class PaymentGetPaymentRequestErrorState extends PaymentCubitState {}

class PaymentRefCodeLoadingState extends PaymentCubitState {}

class PaymentRefCodeSuccessState extends PaymentCubitState {}

class PaymentRefCodeErrorState extends PaymentCubitState {}
