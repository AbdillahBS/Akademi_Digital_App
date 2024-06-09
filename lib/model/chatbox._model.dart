class ChatBoxListTile {
  final String profileImageUrl;
  final String name;
  final String message;
  final String time;
  final int unreadCount;

  ChatBoxListTile({
    required this.profileImageUrl,
    required this.name,
    required this.message,
    required this.time,
    required this.unreadCount,
  });
}

List<ChatBoxListTile> dummyChatData = [
  ChatBoxListTile(
    profileImageUrl:
        'https://cdn1.katadata.co.id/media/images/thumb/2022/11/11/KARAKTER_ANIME_BERKACAMATA-2022_11_11-18_07_36_287df90b274e29dc9c0475173e46b789_960x640_thumb.png',
    name: 'M. Haqqul Hakim',
    message: 'Assalamualaikum',
    time: '18:30',
    unreadCount: 1,
  ),
  ChatBoxListTile(
    profileImageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPpd2dKUULlTHDgoufs2wFrK7KQlYsPp5WFw&s',
    name: 'Furkon Azis Aini',
    message: 'Bagaimana apakah bisa?',
    time: '9:15',
    unreadCount: 1,
  ),
  ChatBoxListTile(
    profileImageUrl:
        'https://preview.redd.it/s62j2g9w64sa1.png?auto=webp&s=c64d53d7a1bfb0d0b8eeff732ba418a8f774cead',
    name: 'Faishal Reza Ubaidillah',
    message: 'Jangan lupa dibaca modulnya!',
    time: 'Kemarin',
    unreadCount: 0,
  ),
  ChatBoxListTile(
    profileImageUrl:
        'https://cdn.epicstream.com/images/ncavvykf/epicstream/946901a65db90448643c797cf26e2583753a1bd3-1556x968.jpg?rect=1,0,1555,968&w=723&h=450&auto=format',
    name: 'Abdillah Bagus Saputra',
    message: 'Semangat!',
    time: '23.00',
    unreadCount: 1,
  ),
];
