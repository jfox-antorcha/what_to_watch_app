import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleLarge;

    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
        ),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Icon(
                CupertinoIcons.film,
                color: colors.primary,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                'What To Watch',
                style: titleStyle,
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(CupertinoIcons.search),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
