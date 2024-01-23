import 'package:flutter/material.dart';
import 'package:music/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("S E T T I N G S"),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Theme
              .of(context)
              .colorScheme
              .secondary,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(25),
          margin: const EdgeInsets.all(25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Dark Mode",style: TextStyle(fontWeight: FontWeight.bold),),
            Switch(value: Provider
                .of<ThemeProvide>(context, listen: false)
                .isDark,
                onChanged: (value) =>
                    Provider.of<ThemeProvide>(context, listen: false).toggle(),
              activeColor: Colors.white,
              activeTrackColor: Colors.black,
            )
          ],

        ),
      ),
    );
  }
}
