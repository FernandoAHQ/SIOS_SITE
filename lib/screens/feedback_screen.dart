import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sios_app/providers/providers.dart';
import 'package:sios_app/theme/app_theme.dart';
import 'package:sios_app/widgets/widgets.dart';

class FeedbackScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final feedbackProvider = Provider.of<FeedBackProvider>(context);
    final siteUProv = Provider.of<UsersSiteProvider>(context);

    siteUProv.getSiteUsers();
    
    return Scaffold(

      backgroundColor: Apptheme.primarylight,
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
                    onChange: (value) => feedbackProvider.description = value!,
                  ),
                  
                  const CustomTitle(
                    text: 'Feedback al Usuario',
                    color: Colors.white,
                  ),

                  _CustomFormFields(
                    initialValue: feedbackProvider.feedBack,
                    onChange: (value) => feedbackProvider.feedBack = value!,
                  ),

                  const CustomTitle(
                    text: 'Solución',
                    color: Colors.white,
                  ),

                  _CustomFormFields(
                    initialValue: feedbackProvider.solution,
                    onChange: (value) => feedbackProvider.solution = value!,
                    maxLines: 2,
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

                  UserListSlider(),

                  MaterialButton(
                    child: const Icon(Icons.print),
                    onPressed: feedbackProvider.printData
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
  final onChange;
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
      // initialValue: 'Hola Mundo',
      onChanged: onChange,
      // controller: TextEditingController(),
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