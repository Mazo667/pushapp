class PushMessage {
  final String messageId;
  final String title;
  final String body;
  final DateTime sentData;
  final Map<String,dynamic>? data;
  final String? imageUrl;

  PushMessage({
    required this.messageId,
    required this.title,
    required this.body,
    required this.sentData,
     this.data,
     this.imageUrl});

  @override
  String toString() {
    return '''
    PushMessage -
    MessageId: $messageId
    tittle:    $title
    body:      $body
    sentDate:  $sentData
    data:      $data
    ImageUrl:  $imageUrl
    ''';
  }
}