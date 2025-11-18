import 'package:leaptech_plus/core/models/current_user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final supabase = Supabase.instance.client;
  CurrentUserModel? currentUserModel;

  Future<CurrentUserModel?> getCurrentUser() async {
    final user = supabase.auth.currentUser;
    if (user == null) return null;

    // Fetch user profile from Supabase table "profiles"
    final data = await supabase
        .from('employees')
        .select()
        .eq('id', user.id)
        .maybeSingle();
    if (data == null) return null;

    currentUserModel = CurrentUserModel.fromMap(data);
    return currentUserModel;
  }

  bool get isLoggedIn => supabase.auth.currentUser != null;
}
