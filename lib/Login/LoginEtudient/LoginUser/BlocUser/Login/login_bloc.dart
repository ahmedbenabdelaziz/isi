import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../matiere/Cours/ApiCou/Api/ApiUser.dart';


part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final ApiUser Loginuser;
  LoginBloc(this.Loginuser) : super(LoginInitial()) {
    on<Loginn>((event, emit)async {
      var resultat = await Loginuser.LoginUser(event.email, event.password);
      if(resultat['message']=='Vérifier vos informations'){
        emit(EmailError(EmailErrr: 'Vérifier vos informations'));
      }

    });
  }
}
