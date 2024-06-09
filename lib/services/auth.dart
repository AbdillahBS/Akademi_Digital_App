class AuthService {
  final Map<String, String> _users = {
    'admin': 'admin',
  };

  bool login(String username, String password) {
    return _users.containsKey(username) && _users[username] == password;
  }

  bool register(String username, String email, String password) {
    if (!_users.containsKey(username)) {
      _users[username] = password; // Simpan kredensial baru
      return true; // Registrasi berhasil
    } else {
      return false; // Username sudah ada
    }
  }
}
