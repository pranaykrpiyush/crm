class ChatItemModel {
  final String name;
  final String message;
  final String time;
  final String avatarUrl;

  ChatItemModel({required this.name, required this.message, required this.time, required this.avatarUrl});
}

List<ChatItemModel> chatItemData = [
  ChatItemModel(
      name: "Mike",
      message: "Welcome",
      time: "15:30",
      avatarUrl:
      "https://i.ibb.co/54Vqkz8/IMG-20190714-123654.jpg"),
   ChatItemModel(
      name: "Mike Mike",
      message: "Welcome ",
      time: "17:30",
      avatarUrl:
      "https://i.ibb.co/54Vqkz8/IMG-20190714-123654.jpg"),
   ChatItemModel(
      name: "Mike Kemi",
      message: "Hello ",
      time: "5:00",
      avatarUrl:
      "https://i.ibb.co/54Vqkz8/IMG-20190714-123654.jpg"),
   ChatItemModel(
      name: "Deven",
      message: "Hi there",
      time: "10:30",
      avatarUrl:
      "https://i.ibb.co/54Vqkz8/IMG-20190714-123654.jpg"),
   ChatItemModel(
      name: "USER",
      message: "Hey there",
      time: "12:30",
      avatarUrl:
      "https://i.ibb.co/54Vqkz8/IMG-20190714-123654.jpg"),
   ChatItemModel(
      name: "USER 2",
      message: "Loresm Ipsum",
      time: "15:30",
      avatarUrl:
      "https://i.ibb.co/54Vqkz8/IMG-20190714-123654.jpg"),
];
