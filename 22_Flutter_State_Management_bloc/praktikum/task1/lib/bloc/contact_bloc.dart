import 'package:crud_bloc/data/data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crud_bloc/models/contact.dart';
import 'package:equatable/equatable.dart';

part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactBloc() : super(ContactInitial()) {
    on<GetContactList>((event, emit) {
      try {
        emit(ContactLoading());
        emit(ContactLoaded(data: dataDummy));
      } catch (e) {
        emit(ContactFailed(error: e.toString()));
      }
    });

    on<CreateContactList>((event, emit) {
      try {
        emit(ContactLoading());
        dataDummy.add(event.contact);
        emit(ContactLoaded(data: dataDummy));
      } catch (e) {
        emit(ContactFailed(error: e.toString()));
      }
    });

    on<DeleteContactList>((event, emit) {
      try {
        emit(ContactLoading());
        dataDummy.removeWhere(
          (element) => element.id == event.id,
        );
        emit(ContactLoaded(data: dataDummy));
      } catch (e) {
        emit(ContactFailed(error: e.toString()));
      }
    });
  }
}
