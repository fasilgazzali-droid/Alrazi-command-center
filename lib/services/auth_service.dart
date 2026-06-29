import '../models/user_role.dart';

class AuthService {
  AuthService._();

  static final Map<String, Map<String, dynamic>> _accounts = {
    "PRIN_MAIN_990X#ALRAZI_SECURE": {
      "role": UserRole.principal,
      "name": "Principal Admin",
    },
    "TECH_FACULTY_404M\$ALRAZI_DESK": {
      "role": UserRole.teacher,
      "name": "Faculty Workspace",
    },
    "STUD_PORTAL_101Z@ALRAZI_HUB": {
      "role": UserRole.student,
      "name": "Student Portal",
    },
  };

  static LoginResult? login(String passkey) {
    final account = _accounts[passkey.trim()];

    if (account == null) {
      return null;
    }

    return LoginResult(
      role: account["role"] as UserRole,
      displayName: account["name"] as String,
    );
  }
}

class LoginResult {
  final UserRole role;
  final String displayName;

  const LoginResult({
    required this.role,
    required this.displayName,
  });
}
