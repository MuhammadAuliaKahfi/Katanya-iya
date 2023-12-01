import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  List<Contact>? _contacts; // Perbaikan di sini, inisialisasi dengan null

  @override
  void initState() {
    getContact();
    super.initState();
  }

  Future<void> getContact() async {
    List<Contact> contacts = await ContactsService.getContacts();
    print(contacts);
    setState(() {
      _contacts = contacts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Contact")),
      body: _contacts != null && _contacts!.isNotEmpty // Perbaikan di sini
          ? ListView.builder(
              itemCount: _contacts!.length, // Perbaikan di sini
              itemBuilder: (BuildContext context, int index) {
                Contact? contact = _contacts![index]; // Perbaikan di sini
                return ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 18),
                  leading: (contact?.avatar != null &&
                          contact.avatar!.isNotEmpty)
                      ? CircleAvatar(
                          backgroundImage: MemoryImage(contact.avatar!),
                        )
                      : CircleAvatar(
                          backgroundColor: Theme.of(context).primaryColor,
                          child: Text(contact!.initials()),
                        ),
                  title: Text(contact.displayName ?? ''),
                );
              },
            )
          : const Center(
              child: Text('Kontak Kosong'),
            ),
    );
  }
}
