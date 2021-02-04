# vue.js-blog
Kurulum
Proje dosyasını indirdikten sonra npm install komutu ile npm modüllerini indirmeniz gerekiyor.
Yeni bir mysql veritabanı oluşturup adına "vueblog" demeniz gerekiyor
Bu mysql veritabanına projede bulunan vueblog.sql dosyasını içeri aktarmanız gerekmektedir.
Proje Hakkında
Bu proje vue.js, vuex, bootstrap, vue-router, axios, php ve mysql kullanılarak geliştirilmiş bir blog projesidir.

Kullanımı
Anasayfa kısmında paylaşılan blog yazıları yer almaktadır. Navbar kısmında yer alan kategorilere ayrılmış olan blog yazılarını kategorilerine göre inceleyebilme imkanı sağlamaktadır. Anasayfada listelenen blog yazılarının hangi kategoriye ait olduğunu göstermekle birlikte blog yazısının ait olduğu kategori başlığı bağlantısına tıklandığında o kategoriye ait blog yazıları listelenmektedir. Blog yazılarını incelemek için üzerine tıklandıktan sonra açılan sayfada blog yazıları incelenebilmekte. Arama kısmında ise yazı başlığıyla eşleşen sonuçlar aratıldığında ilgili sonuçlar listeleniyor.

Admin Paneli
/login url i ile admin giriş sayfasına erişim sağlanabilmekte.
Kullanıcı adı : admin
Şifre : admin
Giriş işlemi yapıldıktan sonra localstorage ile oturum bilgisi tarayıcıya kaydediliyor. 
Admin panelinde blog yazısı ekleme, blog yazısı düzenleme, blog yazısı silme gibi işlemler yapılabilmekte. Basit ve kullanışlı arayüz ile blog yazı yönetimi oldukça kolay.
Çıkış yapma işlemi ile localstorage de tutulan oturum bilgisi temizleniyor.

