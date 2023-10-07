class MessageModel{
  String message ;
  String id ;

  MessageModel({required this.message,required this.id });

   factory MessageModel.fromJson(jsonData){
     return MessageModel(message: jsonData["message"], id: jsonData["email"]);
   }
}