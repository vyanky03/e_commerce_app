import 'package:e_commerce_app/view/account/auth/sign_in_screen.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 8),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const Row(
            children: [
              CircleAvatar(
                radius: 36,
                backgroundColor: Colors.grey,
                child: CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage('assets/images/user_image.png'),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Sign in your account',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          ProfileTab(
            name: 'Profile Info',
            press: () {},
          ),
          ProfileTab(
            name: 'Notification',
            press: () {},
          ),
          ProfileTab(
            name: 'Settings',
            press: () {},
          ),
          ProfileTab(
            name: 'About Us',
            press: () {},
          ),
          ProfileTab(
            name: 'Terms and Conditions',
            press: () {},
          ),
          ProfileTab(
            name: 'Sing In',
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignInScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class ProfileTab extends StatelessWidget {
  const ProfileTab({
    super.key,
    required this.name,
    required this.press,
  });
  final String name;
  final Function() press;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: GestureDetector(
        onTap: press,
        child: Container(
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                spreadRadius: 0.1,
                blurRadius: 7,
                color: Colors.grey.withOpacity(0.4),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Icon(
                Icons.keyboard_arrow_right_rounded,
                size: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
