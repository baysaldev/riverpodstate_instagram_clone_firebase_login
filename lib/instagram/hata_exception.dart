class Hatalar {
  static String goster(String hataKodu) {
    switch (hataKodu) {
      case "[firebase_auth/email-already-in-use]":
        return "Bu mail adresiz kullanılmaktadır, lütfen farklı bir mail adresi deneyiniz";

      case " ([firebase_auth/user-not-found] There is no user record corresponding to this identifier. The user may have been deleted.)":
        return "Bu kullanıcı sistemde bulunmamaktasdır. Lütfen kayıt olup tekrar deneyiniz";

      default:
        return "Bir hata oluştu";
    }
  }
}
