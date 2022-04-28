import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sios_app/providers/providers.dart';
import 'package:sios_app/theme/app_theme.dart';
import 'package:sios_app/widgets/widgets.dart';

class FeedbackScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final feedbackProvider = Provider.of<FeedBackProvider>(context);
    
    return Scaffold(
      backgroundColor: Apptheme.primarylight,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: feedbackProvider.feedbackKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
              
                  CustomTitle(
                    text:'Descripción Real', 
                    color: Colors.white,
                  ),
                  _CustomFormFields(),
                  CustomTitle(
                    text: 'Feedback al Usuario',
                    color: Colors.white,
                  ),
                  _CustomFormFields(),
                  CustomTitle(
                    text: 'Solución',
                    color: Colors.white,
                  ),
                  _CustomFormFields(
                    maxLines: 2,
                  ),
              
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
  
  const _CustomFormFields({
    Key? key,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: TextEditingController(),
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