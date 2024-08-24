import 'package:flutter/material.dart';
import 'package:matchflix/data_provider/auth_provider.dart';
import 'package:matchflix/data_repository/auth_repository.dart';
import 'package:matchflix/data_repository/storage_repository.dart';
import 'package:matchflix/presentation/screens/home_screen.dart';
import 'package:matchflix/presentation/widgets/input_field.dart';
import 'package:matchflix/presentation/widgets/primary_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isWrong = false;
  bool isLoading = true;


  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((p0) async {
      Map<String, String?> credential = await StorageRepository.getCredential();
      AuthProvider.login(credential['email']??"", credential['password']??"").then((value){
        if (value){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
        }
        else{
          setState(() {
            isLoading = false;
          });
        }
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: 
        isLoading?
        const Center(child: CircularProgressIndicator()):
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Container()),
          Center(child: Text("MatchFlix", style: Theme.of(context).textTheme.headlineLarge,)), 
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child:InputField(hintText: "Email", controller: emailController)),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: InputField(hintText: "Password", controller: passwordController, isPassword: true,)), 
          if (isWrong) const Padding(
            padding:EdgeInsets.only(left: 20, top: 8),
            child: Text("Email o password errati", style: TextStyle(color: Colors.red),)),
           const SizedBox(height: 32),
          Expanded(child: Container()),  
           PrimaryButton(text: "Crea un account", onPressed: (){
            AuthProvider.signUp(emailController.text, passwordController.text).then((value){
              if(value){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
              }
              else{
                setState(() {
                  isWrong = true;
                });
              }
            });
           }, showOnlyText: true,),
          const SizedBox(height: 12),
          Padding(
             padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(child: PrimaryButton(text: "Accedi", onPressed: (){
               AuthProvider.login(emailController.text, passwordController.text).then((value){
                 if(value){
                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
                 }
                 else{
                  setState(() {
                    isWrong = true;
                  });
                 }
               });
            })))
         ,const SizedBox(height: 16),

        ],
      )),
    );
  }
}