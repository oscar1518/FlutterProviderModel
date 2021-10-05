import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider_architecture/core/models/post.dart';
import 'package:provider_architecture/ui/views/home_view.dart';
import 'package:provider_architecture/ui/views/login_view.dart';
import 'package:provider_architecture/ui/views/post_view.dart';

class Routes{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case '/':
        return MaterialPageRoute(builder: (_) => HomeView());
      case '/login' :
        return MaterialPageRoute(builder: (_) => LoginView());
      case '/post' :
        var post = settings.arguments as Post;
        return MaterialPageRoute(builder: (_) => PostView(post: post));
      default: 
        return MaterialPageRoute(builder: (_) => Scaffold(
          body: Center(child: Text('No hay ninguna ruta definida para ${settings.name}'),),
        )
      );
    }
  }
}