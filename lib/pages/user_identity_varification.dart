import 'package:flutter/material.dart';

class UserIdentityVerification extends StatelessWidget {
  static const String routeName='/verificition';
  const UserIdentityVerification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Identity Verification'),),
      body: Center(
        child: ElevatedButton(
          onPressed: (){},
          child: Text('View Identities'),
        ),
      ),
    );
  }
}
