import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:productbox_flutter_exercise/bloc/cubits/auth_cubit/auth_cubit.dart';

class BlocProviders {
  static List<BlocProvider> blocProviders = [
    BlocProvider(create: (ctx) => AuthCubit())
  ];
}
