import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../viewmodels/auth_vm.dart';

class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authProvider.select((state) => state.user));

    return Scaffold(
      appBar: AppBar(title: const Text('Profil')),
      body: user == null
          ? const Center(child: Text('Data pengguna tidak tersedia.'))
          : ListView(
              padding: const EdgeInsets.all(24),
              children: [
                CircleAvatar(
                  radius: 36,
                  child: Text(
                    user.name.isEmpty ? '?' : user.name[0].toUpperCase(),
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                const SizedBox(height: 24),
                ListTile(
                  leading: const Icon(Icons.person_outline),
                  title: const Text('Nama'),
                  subtitle: Text(user.name),
                ),
                ListTile(
                  leading: const Icon(Icons.email_outlined),
                  title: const Text('Email'),
                  subtitle: Text(user.email),
                ),
                if (user.createdAt != null)
                  ListTile(
                    leading: const Icon(Icons.calendar_today_outlined),
                    title: const Text('Bergabung sejak'),
                    subtitle: Text(user.createdAt!.toString().split(' ').first),
                  ),
              ],
            ),
    );
  }
}
