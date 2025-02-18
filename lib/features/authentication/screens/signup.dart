import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pawrentingreborn/navigationMenu.dart';
import 'package:pawrentingreborn/data/services/AuthenticationService.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _dobController = TextEditingController();
  final _phoneController = TextEditingController();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _agreedToTerms = false;

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _dobController.text = DateFormat('dd-MM-yyyy').format(picked);
      });
    }
  }

  Future<void> _submitForm() async{
    if (_formKey.currentState!.validate()) {
      try{
        await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailController.text.trim(), password: _passwordController.text.trim());
        // await AuthenticationService(  FirebaseFirestore.instance).addUserDetail s(_firstNameController.text.trim(), _lastNameController.text.trim(), _phoneController.text.trim(), _usernameController.text.trim(), _emailController.text.trim(), _passwordController.text.trim(), _dobController.text.trim());
        Get.to(()=>NavigationMenu());
        print('Form submitted successfully');

      }
      catch(e){
        print(e);
      }
      // Implement your registration logic here
    }
    else{
      print('Salah dodol');
    }
  }

// masih bermasalah

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/login/wallpaper-login.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                Container(
                  height: 180,
                  width: 350,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 63),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Hello Friend!',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4749AE),
                          ),
                        ),
                        const Text(
                          "Let's Start Your Pawrenting\nJourney Today!",
                          style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFF686767),
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  // height: 600,
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Colors.grey.withOpacity(0.5),
                    //     spreadRadius: 0.5,
                    //     blurRadius: 7,
                    //     offset: const Offset(0, 5),
                    //   ),
                    // ],
                  ),
                  width: 350,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildTextField(
                          controller: _firstNameController,
                          label: 'First Name',
                          validator: (value) =>
                              value!.isEmpty ? 'Required' : null,
                        ),
                        const SizedBox(height: 15),
                        _buildTextField(
                          controller: _lastNameController,
                          label: 'Last Name',
                          validator: (value) =>
                              value!.isEmpty ? 'Required' : null,
                        ),
                        const SizedBox(height: 15),
                        _buildTextField(
                          controller: _dobController,
                          label: 'Date Of Birth',
                          readOnly: true,
                          onTap: _selectDate,
                          icon: const Icon(Icons.calendar_today),
                          validator: (value) =>
                              value!.isEmpty ? 'Required' : null,
                        ),
                        const SizedBox(height: 15),
                        _buildTextField(
                          controller: _phoneController,
                          label: 'Phone Number',
                          keyboardType: TextInputType.phone,
                          prefix: const Text('+62 '),
                          validator: (value) =>
                              value!.length < 10 ? 'Invalid number' : null,
                        ),
                        const SizedBox(height: 15),
                        _buildTextField(
                          controller: _usernameController,
                          label: 'Username',
                          validator: (value) =>
                              value!.isEmpty ? 'Required' : null,
                        ),
                        const SizedBox(height: 15),
                        _buildTextField(
                          controller: _emailController,
                          label: 'Email',
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) =>
                              !value!.contains('@') ? 'Invalid email' : null,
                        ),
                        const SizedBox(height: 15),
                        _buildTextField(
                          controller: _passwordController,
                          label: 'Password',
                          isPassword: true,
                          obscure: _obscurePassword,
                          toggleVisibility: () => setState(
                              () => _obscurePassword = !_obscurePassword),
                          validator: (value) =>
                              value!.length < 6 ? 'Min 6 characters' : null,
                        ),
                        const SizedBox(height: 15),
                        _buildTextField(
                          controller: _confirmPasswordController,
                          label: 'Re enter Password',
                          isPassword: true,
                          obscure: _obscureConfirmPassword,
                          toggleVisibility: () => setState(() =>
                              _obscureConfirmPassword =
                                  !_obscureConfirmPassword),
                          validator: (value) =>
                              value != _passwordController.text
                                  ? 'Passwords mismatch'
                                  : null,
                        ),
                        // const SizedBox(height: 0),
                        Container(
                          padding: EdgeInsets.zero,
                          child: Row(
                            children: [
                              Checkbox(
                                value: _agreedToTerms,
                                onChanged: (value) =>
                                    setState(() => _agreedToTerms = value!),
                                activeColor: Colors.indigo,
                              ),
                              const Expanded(
                                child: Align(
                                  alignment:
                                      Alignment.centerLeft, // ini juga udah
                                  child: const Text(
                                    'I agree to follow the terms of use',
                                    style: TextStyle(fontSize: 14),
                                    textAlign:
                                        TextAlign.start, // help ini udah dicoba
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // const SizedBox(height: 10),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xff6D52D7),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(31),
                              ),
                            ),
                            onPressed: () async {
                              await _submitForm();
                              
                            },
                            child: const Text(
                              'Register',
                              style:
                                  TextStyle(fontSize: 24, color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Center(
                          child: GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: const Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Already have an account? ",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  TextSpan(
                                    text: 'Login',
                                    style: TextStyle(
                                      color: Colors.indigo,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
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
    Widget? prefix,
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
        hintText: label,
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
          borderRadius: BorderRadius.circular(8),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.red.shade700),
        ),
      ),
    );
  }
}
