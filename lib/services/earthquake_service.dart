import 'package:flutter/material.dart';
import '../models/earthquake_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EarthquakeService {
  //static const String _url = "https://api.berkealp.net/kandilli/index.php?all";
  static const String _url = "https://api.orhanaydogdu.com.tr/deprem/kandilli/live?limit=200";

  static Future<List<Earthquake>> getEarthquakeData() async{
    /*
    şimdi bir static fonksiyon oluşturduk bu sınıf içerisinde adı da getEarthquakeData
    bize deprem ile ilgili datayı getirmeye yarayacak diye. ve bu fonksiyonun geriye bir List<Earthquake> döndürdüğünü söylemişiz
    asenkron çalışan bir fonksiyon içerisinde await kullanmışız belli ki ya da kullanacağız.
    diğer sınıflardan direkt olarak erişilebilsin diye bu özelliğe yani bu fonksiyona bu yüzden başına static koyduk.
     */

    var cevap = await http.get(Uri.parse(_url));
    /*
    cevap diye bir değişken oluşturduk işte burada http kütüphanesini kullandık
    http.get diyerek Uri.parse özelliği ile linkimizi verdik böylece http package ı bu url deki veriyi cevap a aktaracak.
    direkt olarak veriyi aktarmıyor response u aktarıyor ve bu linkteki response un içerisinde veri de responsun bir parçasıdır
     */

    List<Earthquake> earthquakeList = [];

    /*
    http durum kodlarından 200 durum kodu bağlantının başarı ile sağlandığını responsun verildiğini belirtir
    bu nedenle böyle bir if kontrolü yaptık ki bağlantıda sıkıntı olursa debugPrint ile öğrenebilelim
     */
    if(cevap.statusCode == 200){
      debugPrint("bağlantı başarı ile sağlandı 200 ok");
      //veri dümdüz string olarak cevap.body de bulunduğu için direkt string olduğu için işleme yapamıyoruz.
      List islenebilirData = jsonDecode(cevap.body)["result"];
      //bu nedenle jsonDecode fonksiyonunu kullanarak dümdüz string olan bu veriyi dartın anlayacağı şekle dönüştürüyoruz.
      //bu dönüşüm iki türlü olabilir eğer verimiz [ ile başlıyorsa bir liste olarak, { ile başlıyorsa map olarak olur.
      //bizim verimiz listeymiş.
      earthquakeList = islenebilirData.map((e) => Earthquake.fromMap(e)).toList();
      //listeyi maple her bir elemanı için fromMap metodunu kullanarak model sınıfımıza nesne oluşturuyor
      debugPrint(earthquakeList.first.coordinates.toString());
    }else{
      debugPrint("bağlantı sırasında hata oluştu");
    }

    return earthquakeList;
  }


}

