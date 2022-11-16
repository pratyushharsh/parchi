import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:logging/logging.dart';

import '../entity/pos/contact_entity.dart';

class ContactRepository {
  final log = Logger('ContactRepository');
  List<ContactEntity>? _contacts;

  Future<List<ContactEntity>> getContact() async {
    if (_contacts == null) {
      var data = await _getContactFromPhonebook();
      if (data == null) {
        _contacts = List.empty();
      } else {
        _contacts = data
            .map((e) {

              Phone? ph;
              try {
                ph = e.phones.first;
              } catch (e) {
                // No Phone Found
              }

              Email? em;
              try {
                em = e.emails.first;
              } catch (e) {
                // No Email Found
              }

              return ContactEntity(
                contactId: 'P${e.id}',
                firstName: e.name.first,
                lastName: e.name.last,
                phoneNumber: ph?.number,
                email: em?.address, storeId: '', createTime: DateTime.now()
              );
        },)
            .toList();
      }
      return _contacts!;
    } else {
      return _contacts!;
    }
  }

  Future<List<Contact>?> _getContactFromPhonebook() async {
    if (!await FlutterContacts.requestPermission(readonly: true)) {
      log.info("Permission Denied");
    } else {
      return await FlutterContacts.getContacts(withProperties: true);
    }
    return null;
  }
}
