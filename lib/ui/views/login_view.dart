import 'package:flutter/material.dart';
import 'package:provider_architecture/core/enums/view_state.dart';
import 'package:provider_architecture/core/viewmodels/login_model.dart';
import 'package:provider_architecture/ui/shared/app_colors.dart';
import 'package:provider_architecture/ui/views/base_view.dart';
import 'package:provider_architecture/ui/widgets/login_header.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginModel>(
      onModelReady: (model){/*Call something on the model*/},
      builder: (context, model, child) => Scaffold(
          backgroundColor: backgroundColor,
        body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LoginHeader(
            validationMessage: model.errorMessage,
            controller: _controller,),
            model.state == ViewState.Busy ? CircularProgressIndicator() : TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
              ),
              onPressed: () async {
                var loginSuccess = await model.login(_controller.text);
                if (loginSuccess){
                  Navigator.pushNamed(context, '/');
                }
              }, 
              child: Text(
                "Login",
                style: TextStyle(color: Colors.black),
              )
            )
        ],),
      ),
    );
  }
}