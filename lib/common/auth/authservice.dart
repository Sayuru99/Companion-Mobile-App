import '../models/user.dart';

class AuthService {
  User? currentUser;

  Future<User?> login(String username) async {
    // Here you would make an API call to retrieve the user with the given username
    // and verify the password entered by the user.
    // For this example, we'll just simulate that by checking if the username is "john".
    if (username == "Ui_Admin") {
      // If the username is correct, create a new user object and assign it to currentUser.
      currentUser = User(
        id: 1,
        name: "UI Admin",
        username: "Ui_Admin",
        email: "admin@inter.com",
        avatar:
            "https://www.pngall.com/wp-content/uploads/12/Avatar-Profile-PNG-Picture.png",
        location: "Rajagiriya, Colombo",
        followers: 123971,
        events: 1210,
      );
      return currentUser;
    } else {
      // If the username is incorrect, return null.
      return null;
    }
  }

  void logout() {
    // Set currentUser to null to indicate that the user is logged out.
    currentUser = null;
  }
}
