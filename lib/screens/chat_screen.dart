import 'package:chat_app/constants.dart';
import 'package:chat_app/cubites/chat/chat_cubit.dart';
import 'package:chat_app/cubites/chat/chat_state.dart';
import 'package:chat_app/models/messageModel.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../custom_wedget/customChatBuble.dart';

class ChatScreen extends StatelessWidget {

  static String id = "chatScreen";

  final controller = TextEditingController();

  String? textMessage ;

  final ScrollController _scrollController = ScrollController();




  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.
  collection(kCollictinName).orderBy("time",descending: true).snapshots();


  ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    List<MessageModel> messageList =BlocProvider.of<ChatCubit>(context).messageList;

    return Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: kPrimaryColor,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 50,
                        child: Image.asset("assets/images/img.png"),
                      ),
                      const Text("Chat"),
                    ],
                  ),
                ),
                body:
                //ListView.builder(itemCount:30,itemBuilder: (context,index){
                Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child:BlocConsumer<ChatCubit,ChatState>(builder: (BuildContext context, state) {

                        return  ListView.builder(
                          reverse: true,
                          controller: _scrollController,
                          itemCount: messageList.length,
                          itemBuilder: (BuildContext context, int index) {
                            if (email == BlocProvider.of<ChatCubit>(context).messageList[index].id) {
                              return Align(
                                  alignment: Alignment.centerLeft,
                                  child: CustomChatBuble(
                                    message: messageList[index].message,));
                            }else{
                              return Align(
                                  alignment: Alignment.centerRight,
                                  child: CustomChatBubleForFrind(
                                    message: messageList[index].message,));
                            }
                          },

                        );
                      },
                        listener: (BuildContext context, Object? state) {
                        },)
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextField(
                        controller: controller,
                        decoration: InputDecoration(
                            hintText: "type messahe",
                            suffixIcon: IconButton(color: kPrimaryColor, onPressed: () async{

                              BlocProvider.of<ChatCubit>(context).
                              addMessagaeToFireBase(email: email.toString(), textMessage: textMessage.toString());
                                 controller.clear();


                            }, icon: const Icon(Icons.send),),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: kPrimaryColor,),
                                borderRadius: BorderRadius.circular(16)
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: kPrimaryColor),
                                borderRadius: BorderRadius.circular(16)

                            )
                        ),
                        onChanged: (text){
                          textMessage = text;

                        },
                        onSubmitted: (value) async {
                          BlocProvider.of<ChatCubit>(context).
                          addMessagaeToFireBase(email: email.toString(), textMessage: textMessage.toString());
                          controller.clear();
                          _scrollController.animateTo(
                            0,
                            curve: Curves.easeOut,
                            duration: const Duration(milliseconds: 300),
                          );
                        }
                        ,
                      ),
                    ),
                  ],
                ),
              );
          }
}
