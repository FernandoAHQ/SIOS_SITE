import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sios_app/helpers/alerts.dart';
import 'package:sios_app/providers/providers.dart';
import 'package:sios_app/theme/app_theme.dart';
import 'package:sios_app/widgets/widgets.dart';

class FeedbackScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final feedbackProvider = Provider.of<FeedBackProvider>(context);
    final siteUProv = Provider.of<UsersSiteProvider>(context);

    
    return Scaffold(

      backgroundColor: const Color(0xFF265cfc),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: feedbackProvider.feedbackKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              
                  const CustomTitle(
                    text:'Descripción Real', 
                    color: Colors.white,
                  ),

                  _CustomFormFields(
                    initialValue: feedbackProvider.description,
                    onChange: (value) => feedbackProvider.description = value,
                  ),
                  
                  const CustomTitle(
                    text: 'Feedback al Usuario',
                    color: Colors.white,
                  ),

                  _CustomFormFields(
                    initialValue: feedbackProvider.feedBack,
                    onChange: (value) => feedbackProvider.feedBack = value,
                  ),

                  const CustomTitle(
                    text: 'Solución',
                    color: Colors.white,
                  ),

                  _CustomFormFields(
                    initialValue: feedbackProvider.solution,
                    onChange: (value) => feedbackProvider.solution = value,
                    maxLines: 3,
                  ),

                  const CustomTitle(
                    text: 'Dispositivo del Problema',
                    color: Colors.white,
                    size: 18,
                  ),

                  CheckboxListTile(
                    title: const CustomTitle(
                      text: 'Equipo Terminal',
                      color: Colors.white,
                    ),
                    checkColor: Colors.black,
                    activeColor: Colors.white,
                    value: feedbackProvider.isTerminalEquip,
                    onChanged: (value) => feedbackProvider.changeisTerminalEquip(value!),
                  ),

                  CheckboxListTile(
                    title: const CustomTitle(
                      text: 'Equipo de Red',
                      color: Colors.white,
                    ),
                    checkColor: Colors.black,
                    activeColor: Colors.white,
                    value: feedbackProvider.isNetworkEquip,
                    onChanged: (value) => feedbackProvider.changeIsNetworkEquip(value!),
                  ),

                  const CustomTitle(
                    text:'Personal Adicional',
                    color: Colors.white,
                  ),

                  FutureBuilder(
                    future: siteUProv.getSiteUsers(),
                    builder: (context,snapshot){
                      if (!snapshot.hasData) {
                        return const Center(child: CircularProgressIndicator(),);
                      }
                      else{
                        return UserListSlider();
                      }
                    }
                    
                  ),

                  Center(
                    child: MaterialButton(
                      color: Apptheme.secondary,
                      child: const Icon(Icons.send),
                      onPressed:(){}
                    ),
                  ),
                  Center(
                    child: MaterialButton(
                      color: Colors.green,
                      child: const Icon(Icons.print),
                      onPressed: feedbackProvider.printData
                    ),
                  )

                ],
              
              )
            ),
          ),
        ),
      ),
    );
    
  }
}

class _CustomFormFields extends StatelessWidget {

  final int? maxLines;
  final void Function(String) onChange;
  final String initialValue;
  
  const _CustomFormFields({
    Key? key,
    this.maxLines,
    required this.initialValue,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      onChanged: onChange,
      maxLines: maxLines ?? 5,
      decoration: const InputDecoration(
            
        fillColor: Colors.white,
        filled: true,

        enabledBorder: OutlineInputBorder(
          borderSide  : BorderSide(color: Color(0xffededed)),
        ),
            
        focusedBorder : OutlineInputBorder(
          borderSide  : BorderSide(color: Color(0xffededed))
        )
            
      ),
    );
  }
}