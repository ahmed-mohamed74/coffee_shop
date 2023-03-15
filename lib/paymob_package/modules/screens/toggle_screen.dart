import 'package:coffee_shop/paymob_package/controller/cubit/payment_cubit.dart';
import 'package:coffee_shop/paymob_package/controller/cubit/payment_cubit_state.dart';
import 'package:coffee_shop/paymob_package/core/network/constant.dart';
import 'package:coffee_shop/paymob_package/modules/screens/ref_code_screen.dart';
import 'package:coffee_shop/paymob_package/modules/screens/visa_screen.dart';
import 'package:coffee_shop/shared/network/users.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ToggleScreen extends StatelessWidget {
  const ToggleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentCubit(),
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: mainColor,
            elevation: 0,
            title: const Text('Toggle Screen'),
            centerTitle: true,
          ),
          body: BlocConsumer<PaymentCubit, PaymentCubitState>(
            listener: (BuildContext context, state) {
              if (state is PaymentRefCodeSuccessState) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RefCodeScreen(),
                    ));
              }
            },
            builder: (BuildContext context, Object? state) {
              var cubit = PaymentCubit.get(context);
              return Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          cubit.getRefCode();
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(
                                color: subColor,
                                width: 2.0),
                          ),
                          child: Image.network(AppImages.refCodeImage),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const VisaScreen(),
                              ));
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(
                                color: subColor,
                                width: 2.0),
                          ),
                          child: Image.network(AppImages.visaImage),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          )),
    );
  }
}
