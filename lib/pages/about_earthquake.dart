import 'package:flutter/material.dart';

class AboutEarthQuake extends StatelessWidget {
  const AboutEarthQuake({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Depremde Yapılması Gerekenler"),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            Text("Depremden Önce Uygulanması Gerekenler",style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),),
            SizedBox(height: 10,),
            Text("*Tavan ve duvara asılan avize, klima vb. cihazlar bulundukları yere ağırlıklarını taşıyacak şekilde, duvar ve pencerelerden yeterince uzağa ve kanca ile asılmalıdır.\n"
                "*İçinde ağır eşyalar bulunan dolap kapakları mekanik kilitler takılarak sıkıca kapalı kalmaları sağlanmalı.\n"
                "*Tezgah üzerindeki kayabilecek beyaz eşyaların altına metal profil koyarak bunların kayması önlenmelidir.\n"
                "*Zehirli, patlayıcı, yanıcı maddeler düşmeyecek bir konumda sabitlenmeli ve kırılmayacak bir şekilde depolanmalıdır. Bu maddelerin üzerlerine fosforlu, belirleyici etiketler konulmalıdır.\n"
                "*Rafların önüne elastik bant ya da tel eklenebilir. Küçük nesneler ve şişeler, birbirlerine çarpmayacak ve devrilmeyecek şekilde, kutuların içine yerleştirilmelidir.\n"
                "*Gaz kaçağı ve yangına karşı, gaz vanası ve elektrik sigortaları otomatik hale getirilmelidir.\n"
                "*Binadan acilen çıkmak için kullanılacak yollardaki tehlikeler ortadan kaldırılmalı, bu yollar işaretlenmeli, çıkışı engelleyebilecek eşyalar çıkış yolu üzerinden kaldırılmalıdır.\n"
                "*Geniş çıkış yolları oluşturulmalıdır. Dışa doğru açılan kapılar kullanılmalı, acil çıkış kapıları kilitli olmamalıdır. Acil çıkışlar aydınlatılmalıdır.\n"
                "*Karyolalar pencerenin ve üzerine devrilebilecek ağır dolapların yanına konulmamalı, karyolanın üzerinde ağır eşya olan raf bulundurulmamalıdır."),
            SizedBox(height: 10,),
            Text("Deprem Anında Yapılması Gerekenler",style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),),
            SizedBox(height: 10,),
            Text("*Sabitlenmemiş dolap, raf, pencere vb. eşyalardan uzak durulmalıdır.\n"
                "*Varsa sağlam sandalyelerle desteklenmiş masa altına veya dolgun ve hacimli koltuk, kanepe, içi dolu sandık gibi koruma sağlayabilecek eşya yanına çömelerek hayat üçgeni oluşturulmalıdır.\n"
                "*Baş iki el arasına alınarak veya bir koruyucu (yastık, kitap vb) malzeme ile korunmalıdır. Sarsıntı geçene kadar bu pozisyonda beklenmelidir.\n"
                "*Güvenli bir yer bulup, diz üstü ÇÖK, Başını ve enseni koruyacak şekilde KAPAN, Düşmemek için sabit bir yere TUTUN. \n"
                "*Merdivenlere ya da çıkışlara doğru koşulmamalıdır.\n"
                "*Balkona çıkılmamalıdır.\n"
                "*Balkonlardan ya da pencerelerden aşağıya atlanmamalıdır.\n"
                "*Kesinlikle asansör kullanılmamalıdır.\n"
                "*Telefonlar acil durum ve yangınları bildirmek dışında kullanılmamalıdır.\n"
                "*Kibrit, çakmak yakılmamalı, elektrik düğmelerine dokunulmamalıdır.\n"
                "*Tekerlekli sandalyede isek tekerlekler kilitlenerek baş ve boyun korumaya alınmalıdır."),
            SizedBox(height: 30,),

          ],
        ),
      ),
    );
  }
}












