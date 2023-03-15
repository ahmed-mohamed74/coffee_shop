class ApiContest {
  //https://accept.paymob.com/api/auth/tokens
  static const String baseUrl = 'https://accept.paymob.com/api';
  static const String getAuthToken = '/auth/tokens';
  static const String paymentApiKey =
      'ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2libUZ0WlNJNkltbHVhWFJwWVd3aUxDSndjbTltYVd4bFgzQnJJam8zTURJME9EUjkuRFNubzR5VUNjcHZMdGYxN1otSnBVVVA0OGVJWk1KUG5XYWpxcnp2TmlXZW5sdHZ5VUZPOFc4OHpWUnh6ZHc2cUs4ejl6czZEWjdqcmU0TU03ZWw4RWc=';
  static const String getOrderId = '/ecommerce/orders';
  static const String getPaymentId = '/acceptance/payment_keys';
  static const String getRefCode = '/acceptance/payments/pay';
  static String visaUrl='https://accept.paymob.com/api/acceptance/iframes/734361?payment_token=$finalToken';
  static String paymentFirstToken = '';
  static String paymentOrderId = '';
  static String finalToken = '';
  static String refCode = '';

  static const String integrationIdKiosk = '2363564';
  static const String integrationIdCart = '3414564';
}

class AppImages {
  static const String refCodeImage =
      "https://cdn-icons-png.flaticon.com/128/4090/4090458.png";
  static const String visaImage =
      "https://cdn-icons-png.flaticon.com/128/349/349221.png";
}