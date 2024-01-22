import 'package:rxdart/subjects.dart';
import '../../domain/model/profile_model.dart';

class ProfileViewModel {
  final BehaviorSubject<ProfileModel?> profile =
      BehaviorSubject.seeded(null);



  bool validateCode(String mail, String code){
    if (code == '5555'){
      profile.value = ProfileModel(name: 'Катя', email: mail, phone: '+7(920)000-00-00');
      return true;
    }
    return false;
  }

  void logout(){
    profile.value = null;
  }

}
