import 'package:coffee_shop/paymob_package/controller/cubit/payment_cubit.dart';
import 'package:coffee_shop/paymob_package/controller/cubit/payment_cubit_state.dart';
import 'package:coffee_shop/paymob_package/modules/screens/toggle_screen.dart';
import 'package:coffee_shop/paymob_package/modules/widgets/default_button.dart';
import 'package:coffee_shop/paymob_package/modules/widgets/default_textFormField.dart';
import 'package:coffee_shop/shared/network/users.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen(this.price, {Key? key}) : super(key: key);
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  // TextEditingController priceController = TextEditingController();
  String price;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentCubit()..getAuthToken(),
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromRGBO(208, 122, 68, 1),
            title: const Text(
              'Payment Integration',
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: BlocConsumer<PaymentCubit, PaymentCubitState>(
            listener: (BuildContext context, Object? state) {
              if (state is PaymentGetPaymentRequestSuccessState) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ToggleScreen(),
                    ));
              }
            },
            builder: (BuildContext context, state) {
              var cubit = PaymentCubit.get(context);
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 280,
                        child: Image.asset(
                            'assets/images/registration_images/coffee cup.png'),
                      ),
                      const SizedBox(height: 15.0),
                      Form(
                          key: formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: DefaultTextFormField(
                                      controller: firstNameController,
                                      type: TextInputType.text,
                                      hintText: 'First Name',
                                      prefix: Icons.person,
                                      validate: (String? value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter name';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: DefaultTextFormField(
                                      controller: lastNameController,
                                      type: TextInputType.text,
                                      hintText: 'Last Name',
                                      prefix: Icons.person,
                                      validate: (String? value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter name';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 15),
                              DefaultTextFormField(
                                controller: emailController,
                                type: TextInputType.emailAddress,
                                hintText: 'email',
                                prefix: Icons.email,
                                validate: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter email';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 15),
                              DefaultTextFormField(
                                controller: phoneController,
                                type: TextInputType.phone,
                                hintText: 'phone',
                                prefix: Icons.phone,
                                validate: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter phone';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 15),
                              // DefaultTextFormField(
                              //   controller: priceController,
                              //   type: TextInputType.text,
                              //   hintText: 'price',
                              //   prefix: Icons.price_change,
                              //   validate: (String? value) {
                              //     if (value!.isEmpty) {
                              //       return 'Please enter price';
                              //     }
                              //     return null;
                              //   },
                              // ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text.rich(
                                  TextSpan(
                                      text: 'Price: ',
                                      style: const TextStyle(
                                          color:
                                              Color.fromRGBO(208, 122, 68, 1),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: '$price ',
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 20),
                                        ),
                                        const TextSpan(
                                          text: 'piaster',
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  208, 122, 68, 1),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 20),
                                        )
                                      ]),
                                ),
                              ),
                              const SizedBox(height: 15),
                              DefaultButton(
                                  backgroundColor:
                                      const Color.fromRGBO(208, 122, 68, 1),
                                  radius: 10,
                                  buttonWidget: const Text(
                                    'Register',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                      letterSpacing: 1.7,
                                    ),
                                  ),
                                  function: () {
                                    if (formKey.currentState!.validate()) {
                                      cubit.getGetOrderRegistrationId(
                                        firstName: firstNameController.text,
                                        lastName: lastNameController.text,
                                        email: emailController.text,
                                        phone: phoneController.text,
                                        // price: priceController.text,
                                        price: price,
                                      );
                                    }
                                  }),
                            ],
                          ))
                    ],
                  ),
                ),
              );
            },
          )),
    );
  }
}
