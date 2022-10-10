part of 'contact_bloc.dart';

abstract class ContactEvent extends Equatable {
  const ContactEvent();

  @override
  List<Object> get props => [];
}

class GetContactList extends ContactEvent {}

class CreateContactList extends ContactEvent {
  final Contact contact;
  const CreateContactList({
    required this.contact,
  });

  @override
  List<Object> get props => [contact];
}

class DeleteContactList extends ContactEvent {
  final String id;
  const DeleteContactList({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}
