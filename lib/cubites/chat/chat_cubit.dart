import 'dart:async';

import 'package:chat_app/cubites/chat/chat_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants.dart';
import '../../models/messageModel.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  CollectionReference users =
      FirebaseFirestore.instance.collection(kCollictinName);
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.
  collection(kCollictinName).orderBy("time",descending: true).snapshots();

  List<MessageModel> messageList = [];


  addMessagaeToFireBase(
      {required String email, required String textMessage}) async {
    await users.add(
        {"message": textMessage, "time": DateTime.now(), "email": email});
  }

  void getMessage(){
    messageList.clear();
    _usersStream.listen((event) {
        for(var doc in event.docs){
          messageList.add(MessageModel.fromJson(doc));
        }

        emit(ChatSuccess());
    });


    }

  }


