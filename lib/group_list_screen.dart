import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'group_store.dart';

class GroupListScreen extends StatelessWidget {
  final GroupStore groupStore = GroupStore();

  GroupListScreen({super.key}) {
    groupStore.fetchGroupList();
  }

  void _showUpdateDialog(BuildContext context, int id) {
    final TextEditingController nameController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Update Group Type"),
        content: TextField(
          controller: nameController,
          decoration: const InputDecoration(hintText: "Enter new name"),
        ),
        actions: [
          TextButton(
            onPressed: () async {
              final name = nameController.text;
              if (name.isNotEmpty) {
                await groupStore.updateGroupType(id, {"name": name});
                Navigator.pop(context);
              }
            },
            child: const Text("Update"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Group Types'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              groupStore.fetchGroupList();
            },
          ),
        ],
      ),
      body: Observer(
        builder: (_) {
          if (groupStore.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (groupStore.errorMessage != null) {
            return Center(child: Text(groupStore.errorMessage!));
          }
          return ListView.builder(
            itemCount: groupStore.groupList.length,
            itemBuilder: (context, index) {
              final group = groupStore.groupList[index];
              return ListTile(
                title: Text(group['name'] ?? 'No Name'),
                subtitle: Text("ID: ${group['id']}"),
                trailing: IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    _showUpdateDialog(context, group['id']);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
