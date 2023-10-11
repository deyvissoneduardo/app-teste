import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_widget.dart';
import 'core/rest_client/rest_client.dart';
import 'modules/utils/colornotifire.dart';
import 'repositories/account/account_repository.dart';
import 'repositories/account/account_repository_impl.dart';
import 'service/account/account_service.dart';
import 'service/account/account_service_impl.dart';

class AppModule extends StatelessWidget {
  const AppModule({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ColorNotifire(),
        ),
        ChangeNotifierProvider<RestClient>(
          create: (_) => RestClient(),
        ),
        Provider<AccountRepository>(
          create: (context) => AccountRepositoryImpl(
            restClient: context.read(),
          ),
        ),
        Provider<AccountService>(
          create: (context) =>
              AccountServiceImpl(accountRepository: context.read()),
        ),
      ],
      child: const AppWidget(),
    );
  }
}
