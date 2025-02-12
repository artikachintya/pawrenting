import 'package:flutter/material.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar2.dart';
import 'package:pawrentingreborn/features/profile/widgets/profilePictandUsername.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';
import 'package:pawrentingreborn/utils/constants/texts.dart';
import 'package:pawrentingreborn/navigationMenu.dart';
import 'package:pawrentingreborn/features/signup/signup.dart';
 
class PersonalData extends StatelessWidget {
  const PersonalData({super.key});

  @override
  Widget build(BuildContext context) {
    final _firstNameController = TextEditingController();
    return Scaffold(
      // bottomNavigationBar: IN,
      appBar: const TAppBar2(
        title: "Personal Data",
        subtitle: "",
      ),
      backgroundColor: TColors.primary,
      body: SingleChildScrollView(
        child: Center(
          child: Container( //container for background
            margin: EdgeInsets.fromLTRB(20, 30, 20, 0),
            width: 352,
            height: 824,
            decoration: BoxDecoration(
                color: TColors.secondary,
                borderRadius: BorderRadius.circular(16)),
            child: Column(
              children: [
                Stack( // stack for user profile and edit icon
                  children: [
                    Profilepictandusername(
                        profilePicture: TImages.userProfilePic,
                        name: "",
                        username: ""
                    ),
                    Positioned( //circle for edit icon bg 
                      top: 122,
                      left: 200,
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: TColors.accent,
                          shape: BoxShape.circle, 
                        ),
                      ),
                    ),
                    Positioned( //edit icon 
                      top: 124,
                      left: 202,
                      child: Image.asset(
                        TImages.editIcon, 
                        height: 26,
                        width: 26,
                      ),                    
                    ),
                  ],
                ),
              
                Container(
                  width: 315,
                  child: _buildTextField( //field text for first name
                    controller: _firstNameController,
                    label: 'First Name',
                    hintText: 'Kim',
                    validator: (value) =>
                        value!.isEmpty ? 'Required' : null,
                  ),
                ),

                Container(
                  width: 315,
                  child: _buildTextField( //field text for first name
                    controller: _firstNameController,
                    label: 'Last Name',
                    hintText: 'Kardashian',
                    validator: (value) =>
                        value!.isEmpty ? 'Required' : null,
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    bool isPassword = false,
    bool obscure = false,
    VoidCallback? toggleVisibility,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
    bool readOnly = false,
    VoidCallback? onTap,
    Widget? icon,
    Widget? prefix, required hintText,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword && obscure,
      keyboardType: keyboardType,
      readOnly: readOnly,
      onTap: onTap,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        prefix: prefix,
        suffixIcon: icon ??
            (isPassword
                ? IconButton(
                    icon: Icon(
                      obscure ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey,
                    ),
                    onPressed: toggleVisibility,
                  )
                : null),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 7),
        errorStyle: const TextStyle(height: 0.8, fontSize: 12),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red.shade700),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red.shade700),
        ),
      ),
    );
}
}