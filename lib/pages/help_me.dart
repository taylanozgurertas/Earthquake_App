import 'package:flutter/material.dart';

class HelpMe extends StatefulWidget {
  const HelpMe({Key? key}) : super(key: key);

  @override
  State<HelpMe> createState() => _HelpMeState();
}

class _HelpMeState extends State<HelpMe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ACİL YARDIM BÖLÜMÜ"),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            SizedBox(height: 10,),
            Text("Enkaz Altındayım Ne Yapacağım?", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.red),),
            SizedBox(height: 10,),
            Text("*Öncelikle sakin olmaya çalışın bir haftaya kadar hatta daha fazla enkaz altında hayatta kalmanız mümkündür\n"
                "*Telefonunuz yanınızdaysa ayarlar>pil veya batarya>düşük güç moduna alın\n"
                "*Nefes alışınızı kontrol edin heyecanlanmamaya normal bir şekilde nefes almaya çalışın\n"
                "*Dışarıyı dinleyin,gelen tepkilere cevap verin. dışarıda gürültü varsa bağırmak bir işe yaramayacak ve gücünüzü kaybetmenize sebep olacaktır\n"
                "*Dışarıda gürültü azaldığında bağırarak veya elinize aldığınız taş vb. bir cisimle ritmik bir şekilde betona vurarak kendinizi farkettirmeye çalışın. şuanda teknoloji sayesinde arama kurtarma ekipleri parmağınızı betona vurma sesinizi bile algılayıp,yerinizi tespit edebiliyor\n"
                "*Kendinizi ve varsa etrafınızdaki diğer kişileri telkin edin. gelecek ile ilgili güzel hayaller kurun. güzel anılarınızı zihninizde canlandırın\n"
                "*Hareket etmeyin ve toz kaldırmayın\n"
                "*Kibrit ve çakmak yakmayın telefonunuz yanınızdaysa fener olarak nerede bulunduğunuzu anlayabilmek için açıp kapatın\n"
                "*Borulara ya da duvarlara vurarak yerinizi arama kurtarma ekiplerine ya da çevredeki insanlara belli etmeye çalışın\n"
                "*Bağırmayı SON ÇARE olarak kullanın ıslık çalmayı ve duvarlara yakındaki borulara vurmayı deneyin sürekli bağırıp çağırmayın kendinizi tüketmeyin",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10,),
            Text("112",style: TextStyle(fontSize: 25),),
            SizedBox(height: 10,),
            Text("AFAD Urfa: 04143137290\n"
    "AFAD Diyarbakır: 0412 326 1156\n"
    "AFAD Osmaniye: 0328 826 2002\n"
    "AFAD Antep: 03424281118\n"
    "AFAD Adana: 03222272854\n"
    "AFAD Adıyaman: 04162161231\n"
    "AFAD Batman 0488 213 91 33\n"
    "AFAD Hatay: 03261120000\n"
    "AFAD Maraş: 03442214991",style: TextStyle( fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
  }
}
