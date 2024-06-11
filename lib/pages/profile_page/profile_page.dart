import 'package:flutter/material.dart';
import 'package:fitmo_mobile/widgets/bottom_nav.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Expanded(flex: 2, child: _TopPortion()),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    "Richie Lorie",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 32),
                  FloatingActionButton.extended(
                    onPressed: () {},
                    // onPressed: () async {
                    //   await GoogleSignIn().signIn().then((value) {
                    //     setState(() {
                    //       user = value!;
                    //     });
                    //   });
                    // },
                    heroTag: 'login',
                    elevation: 0,
                    backgroundColor: Colors.red[300],
                    label: const Text("Login"),
                    icon: const Icon(Icons.account_circle),
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     FloatingActionButton.extended(
                  //       onPressed: () {},
                  //       heroTag: 'follow',
                  //       elevation: 0,
                  //       label: const Text("Follow"),
                  //       icon: const Icon(Icons.person_add_alt_1),
                  //     ),
                  //     const SizedBox(width: 16.0),
                  //     FloatingActionButton.extended(
                  //       onPressed: () {},
                  //       heroTag: 'account',
                  //       elevation: 0,
                  //       backgroundColor: Colors.red[300],
                  //       label: const Text("Account"),
                  //       icon: const Icon(Icons.account_circle),
                  //     ),
                  //   ],
                  // ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
          const BottomNav(),
        ],
      ),
    );
  }
}

class _TopPortion extends StatelessWidget {
  const _TopPortion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 50),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Color(0xff0043ba), Color(0xff006df1)]),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              )),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: 150,
            height: 150,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80')),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    child: Container(
                      margin: const EdgeInsets.all(8.0),
                      decoration: const BoxDecoration(
                          color: Colors.green, shape: BoxShape.circle),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
