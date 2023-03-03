import 'dart:async';
import 'package:flutter/material.dart';
import 'package:untitled/pages/about_earthquake.dart';
import 'package:untitled/pages/earthquake_detail.dart';
import 'package:untitled/pages/help_me.dart';
import 'package:untitled/services/earthquake_service.dart';
import 'models/earthquake_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Gerçekleşen Depremler'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Timer timer;

  //late final Future<List<Earthquake>> _depremListesi;
  Future<void> deneme() async {
    Timer.periodic(const Duration(minutes: 1), (timer) {
      setState(() {
        debugPrint("1 dakikada bir yenilendi");
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //program çalıştığı zaman bu fonksiyon çalışsın
    deneme();
    //program çalıştığı zaman yalnızca bir kere çalışacak
    //_depremListesi = EarthquakeService.getEarthquakeData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.black,
        actions: [
          GestureDetector(
            child: const Icon(Icons.repeat),
            onTap: () {
              setState(() {
                debugPrint("deprem listesini güncelliyorum");
              });
            },
          ),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
              child: const Icon(Icons.accessibility_sharp),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const AboutEarthQuake()));
              }),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const HelpMe()));
            },
            child: const Icon(
              Icons.add_alert,
              color: Colors.red,
            ),
          ),
        ],
      ),
      body: FutureBuilder<List<Earthquake>>(
        future: EarthquakeService.getEarthquakeData(),
        initialData: const [],
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            //eğer future olarak verdiğimiz fonksiyondan veri geliyorsa yani deprem listemiz geldiyse snapshot.data ya
            List<Earthquake> depremListesi = snapshot
                .data!; //şu anda depremListesinde tamam veri var geldi deprem bilgileri
            return ListView.builder(
              //ListView.builder return edecek eğer snapshotta veri varsa
              itemCount: depremListesi.length,
              //Bu ListView'in uzunluğu deprem Listesinin uzunluğu kadar
              itemBuilder: (context, index) {
                //context ve index, index 0 dan başlayacak listenin uzunluğu kadar devam edecek
                return ListTile(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>EarthquakeDetail(konumBilgisi: depremListesi[index].coordinates!.first, konumBilgisison: depremListesi[index].coordinates!.last,)));
                  },
                  //her bir index için 0 için 1 için 2 için ... ListTile return edecek

                  title: Row(
                    children: [
                      Expanded(
                        child: Text(
                          depremListesi[index].lokasyon!,
                          style: TextStyle(
                            fontSize: 16,
                            color: depremListesi[index].mag! > 4
                                ? Colors.red.shade600
                                : Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "büyüklük: ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      Text(depremListesi[index].mag.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: depremListesi[index].mag! > 4.0
                                  ? Colors.red.shade600
                                  : Colors.black)),
                      const SizedBox(
                        width: 15,
                      ),
                      const Text(
                        "saat: ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      Text(
                        depremListesi[index].dateHour!,
                        style: TextStyle(
                          fontSize: 15,
                          color: depremListesi[index].mag! > 4
                              ? Colors.red.shade600
                              : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  leading: Column(
                    children: [
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: Icon(
                          Icons.add,
                          color: depremListesi[index].mag! > 4
                              ? Colors.red.shade600
                              : Colors.green,
                        ),
                      ),

                    ],
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            //eğer snapshotta veri yoksa
            return Center(
              child: Text(snapshot.error.toString()), //o veriyi yazdır
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
