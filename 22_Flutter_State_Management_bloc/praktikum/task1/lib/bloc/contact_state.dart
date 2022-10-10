// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'contact_bloc.dart';

abstract class ContactState extends Equatable {
  const ContactState();

  @override
  List<Object> get props => [];
}

class ContactInitial extends ContactState {}

class ContactLoading extends ContactState {}

class ContactLoaded extends ContactState {
  final List<Contact> data;
  const ContactLoaded({
    required this.data,
  });

  @override
  List<Object> get props => [data];
}

class ContactFailed extends ContactState {
  final String error;
  const ContactFailed({
    required this.error,
  });

  @override
  List<Object> get props => [error];
}
