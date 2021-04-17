import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_ui_temp/Response/Forecastresponse.dart';
import 'package:weather_ui_temp/Response/weatherresponse.dart';
import 'package:flutter/services.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  int _temperature = 20;
  String _location = 'Loading';
  String _weather = 'Loading';
  String _country = '';
  String _sunrise = 'Loading';
  String _sunset = 'Loading';
  String _wi = '';
  String _pressure = 'Loading';
  String _humidity = 'Loading';

  String _windSpeed = '';
  int _timeZone;
  var _foreMins =List(8);
  var _foreMax= new List(8);
  var _foreIcons = new List(8);
  var _foreTimes = new List(8);
  var _bg = '';
  int _max = 26;
  int _min = 23;
  bool isLoaded = true;
  List<String> cloudy = ["Go on a spontaneous road trip","Create a road trip playlist","Have a movie marathon","Enjoy your Day"];
  List<String> clear = ["Go for fishing","Enjoy Your Day","Time to make Juice","Fly a Kite","Do a Birdwatch"];
  List<String> thunderstrom = ["Go for a walk and jump in the puddles","Don't forget your raincoats","Take an umbrella","Drink some Coffee","Enjoy your Day"];
  List<String> drizzle = ["Go for a walk and jump in the puddles","Don't forget your raincoats","Take an umbrella","Drink some Coffee","Enjoy your Day"];
  List<String> rain = ["Go for a walk and jump in the puddles","Don't forget your raincoats","Take an umbrella","Drink some Coffee","Enjoy your Day"];
  List<String> mist = ["Reduce your speed while driving","Do fog photography","Scare people","Draw smileys on foggy windows"];
  List<String> fog = ["Reduce your speed while driving","Do fog photography","Scare people","Draw smileys on foggy windows"];
  List<String> smoke = ["Reduce your speed while driving","Do fog photography","Scare people","Draw smileys on foggy windows"];
  List<String> hase = ["Reduce your speed while driving","Do fog photography","Scare people","Draw smileys on foggy windows"];
  List<String> dust= ["Wear sunglasses when walking out in the streets","Wrap a scarf around your face"];
  List<String> sand = ["Wear sunglasses when walking out in the streets","Wrap a scarf around your face"];
  List<String> ash = ["Wear sunglasses when walking out in the streets","Wrap a scarf around your face"];
  List<String> squall = ["Wear sunglasses when walking out in the streets","Wrap a scarf around your face"];
  List<String> tornado = ["Be in your home","Don't go for outdoor"];
  var _suggestMe = 'A cool tip for you';
  void fetchBg(String mains){
    if(mains.toString().toLowerCase()=='clouds'){
      _bg = 'https://cdn.wallpapersafari.com/62/36/g6QsB3.jpg';
      Random random = new Random();
      int i = random.nextInt(4);
      _suggestMe = cloudy[i];
    }    
    if(mains.toString().toLowerCase()=='clear'){
      _bg = 'https://wallpaper-house.com/data/out/12/wallpaper2you_541938.jpg';
      var len = clear.length;
      Random random = new Random();
      int i = random.nextInt(len);
      _suggestMe = clear[i];
    }
    if(mains.toString().toLowerCase()=='thunderstrom'){
      _bg = 'https://c4.wallpaperflare.com/wallpaper/246/411/711/thunder-lightning-sky-atmosphere-wallpaper-preview.jpg';
      var len = thunderstrom.length;
      Random random = new Random();
      int i = random.nextInt(len);
      _suggestMe = thunderstrom[i];
    }
    if(mains.toString().toLowerCase()=='drizzle'){
      _bg = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6T8cN-ONKu1aYIoJQGQKJC3hjQqGj5o-50A&usqp=CAU';
      print(drizzle);
      var len = drizzle.length;
      Random random = new Random();
      int i = random.nextInt(len);
      _suggestMe = drizzle[i];
    }
    if(mains.toString().toLowerCase()=='rain'){
      _bg = 'https://www.teahub.io/photos/full/1-15838_rain-gzel-harika-wow-and-immagine-i-pad.jpg';
      var len = rain.length;
      Random random = new Random();
      int i = random.nextInt(len);
      _suggestMe = rain[i];
    }
    if(mains.toString().toLowerCase()=='mist'){
      _bg = 'https://i.pinimg.com/originals/d9/03/aa/d903aa5c821e83a4c547eaaf16c6203e.png';
      var len = mist.length;
      Random random = new Random();
      int i = random.nextInt(len);
      _suggestMe = mist[i];
    }
    if(mains.toString().toLowerCase()=='fog'){
      _bg = 'https://i.pinimg.com/originals/6d/c3/30/6dc330e0cd454ebd7065121af3f59811.jpg';
      var len = fog.length;
      Random random = new Random();
      int i = random.nextInt(len);
      _suggestMe = fog[i];
    }
    if(mains.toString().toLowerCase()=='smoke'){
      _bg = 'https://i.pinimg.com/originals/d9/03/aa/d903aa5c821e83a4c547eaaf16c6203e.png';
      var len = smoke.length;
      Random random = new Random();
      int i = random.nextInt(len);
      _suggestMe = smoke[i];
    }
    if(mains.toString().toLowerCase()=='haze'){
      _bg = 'https://i.pinimg.com/564x/c7/d2/66/c7d2665edbf2e5042ac403a82a6ec90a.jpg';
      var len =hase.length;
      Random random = new Random();
      int i = random.nextInt(len);
      _suggestMe = hase[i];
      print(hase);
    }    
    if(mains.toString().toLowerCase()=='dust'){
      _bg = 'https://media.nationalgeographic.org/assets/photos/000/205/20529.jpg';
      var len = dust.length;
      Random random = new Random();
      int i = random.nextInt(len);
      _suggestMe = dust[i];
    }    
    if(mains.toString().toLowerCase()=='sand'){
      _bg = 'https://media.nationalgeographic.org/assets/photos/000/205/20529.jpg';
      var len = sand.length;
      Random random = new Random();
      int i = random.nextInt(len);
      _suggestMe = sand[i];
    }    
    if(mains.toString().toLowerCase()=='ash'){
      _bg = 'https://media.nationalgeographic.org/assets/photos/000/205/20529.jpg';
      var len = ash.length;
      Random random = new Random();
      int i = random.nextInt(len);
      _suggestMe = ash[i];
    }    
    if(mains.toString().toLowerCase()=='squall'){
      _bg = 'https://media.nationalgeographic.org/assets/photos/000/205/20529.jpg';
      var len = squall.length;
      Random random = new Random();
      int i = random.nextInt(len);
      _suggestMe = squall[i];
    }    
    if(mains.toString().toLowerCase()=='tornado'){
      _bg = 'http://www.mobileswall.com/wp-content/uploads/2015/07/640-Tornado-l.jpg';
      var len = tornado.length;
      Random random = new Random();
      int i = random.nextInt(len);
      _suggestMe = tornado[i];
    }
  }
  Future<WeatherRes> fetchSearch(String input) async{
    var weatherRes;
    var forecastRes;
    var _srh,_ssh,_srm,_ssm,_srs,_sss;
    var forecastSearch = await http.get("https://api.openweathermap.org/data/2.5/forecast?q=$input&appid=eea55d1ca9004b900a096814f86fe0a3");
    var searchRes = await http.get("https://api.openweathermap.org/data/2.5/weather?q=$input&appid=eea55d1ca9004b900a096814f86fe0a3");
    print(searchRes.toString());
    if(searchRes.statusCode == 200 && forecastSearch.statusCode == 200){
      var resJson  = json.decode(searchRes.body);
      weatherRes = WeatherRes.fromJson(resJson);
      var foreJson = json.decode(forecastSearch.body);
      forecastRes = Forecast.fromJson(foreJson);
      print(weatherRes.weather[0].main);
      int i = 0;
      setState(() {
        _location = weatherRes.name;
        _temperature = resJson["main"]["temp"].round() - 273;
        _weather = weatherRes.weather[0].main;
        fetchBg(_weather);
        _country = weatherRes.sys.country;
        _min =resJson["main"]["temp_min"].round() - 273;
        _max =resJson["main"]["temp_max"].round() - 273;
        _sunrise = weatherRes.sys.sunrise.toString();
        _pressure = weatherRes.main.pressure.toString() + " hPa";
        _humidity = weatherRes.main.humidity.toString() + " %";
        _windSpeed = resJson["wind"]["speed"].toString() + " km";
        _timeZone = resJson["timezone"];
        _srh = DateTime.fromMillisecondsSinceEpoch((resJson["sys"]["sunrise"] + _timeZone)*1000,isUtc: true).hour;
        _srm = DateTime.fromMillisecondsSinceEpoch((resJson["sys"]["sunrise"] + _timeZone)*1000,isUtc: true).minute;
        _srs = DateTime.fromMillisecondsSinceEpoch((resJson["sys"]["sunrise"] + _timeZone)*1000,isUtc: true).second;
        _ssh = DateTime.fromMillisecondsSinceEpoch((resJson["sys"]["sunset"] + _timeZone)*1000,isUtc: true).hour;
        _ssm = DateTime.fromMillisecondsSinceEpoch((resJson["sys"]["sunset"] + _timeZone)*1000,isUtc: true).minute;
        _sss = DateTime.fromMillisecondsSinceEpoch((resJson["sys"]["sunset"] + _timeZone)*1000,isUtc: true).second;
        if(_srh<10){_srh = '0'+ _srh.toString();}else{_srh = _srh.toString();}
        if(_srm<10){_srm = '0'+ _srm.toString();}else{_srm = _srm.toString();}
        if(_srs<10){_srs = '0'+ _srs.toString();}else{_srs = _srs.toString();}
        if(_ssh<10){_ssh = '0'+ _ssh.toString();}else{_ssh = _ssh.toString();}
        if(_ssm<10){_ssm = '0'+ _ssm.toString();}else{_ssm = _ssm.toString();}
        if(_sss<10){_sss = '0'+ _sss.toString();}else{_sss = _sss.toString();}      
        _wi = 'https://openweathermap.org/img/wn/'+resJson["weather"][0]["icon"]+'@2x.png';
        for(i=0;i<8;i++){
          _foreMins[i] = (forecastRes.list[i].main.tempMin - 273).round().toString() + ' °C';
          _foreMax[i] = (forecastRes.list[i].main.tempMax - 273).round().toString() + ' °C';
          _foreIcons[i] = 'https://openweathermap.org/img/wn/' +foreJson['list'][i]["weather"][0]["icon"]+ '@2x.png';
          var x = DateTime.parse(forecastRes.list[i].dtTxt.toString()).toLocal();
          if(x.hour>24){_foreTimes[i] = (x.hour).toString() +' : 00';}else{_foreTimes[i] = (x.hour+3).toString() +' : 00';}
        }
      });
      print(cloudy[1]);
      _sunrise = _srh +" : "+ _srm +" : "+ _srs;
      _sunset = _ssh +" : " + _ssm +" : "+ _sss;
      var m = 1608467648;
      print(_foreMins);
      print(DateTime.fromMillisecondsSinceEpoch(m*1000).hour.toString()+':'+DateTime.fromMillisecondsSinceEpoch(m*1000).minute.toString() + ':' + DateTime.fromMillisecondsSinceEpoch(m*1000).second.toString() );
    }
    return weatherRes;
  }
  Future<void> _showAbt() async{
    return showAboutDialog(
      context: context,
      applicationName: 'Blue Sky Weathers',
      applicationVersion: 'version 1.0.0',
      applicationIcon: Image(
        image: AssetImage('assets/images/logo.png'),
        width: 100,
        height: 100,
        fit: BoxFit.cover,
      ),
      children: <Widget>[
        SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Made with ❤️ by'),
              Text(
                'Karthik Raja',
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
        ),
      ]
    );    
  }
  void onTextSubmission(String input){
    fetchSearch(input);
  }
  @override
  void initState(){
    super.initState();
    fetchSearch('London');
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: _bg==''?AssetImage('assets/images/night.jpg'):NetworkImage(_bg,),
            fit: BoxFit.cover,
            colorFilter: new ColorFilter.mode(
              Colors.black.withOpacity(0.7), 
              BlendMode.dstATop
            )
          )
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
                child: Column(         
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(0, 30, 10, 30),
                              width: 350,
                              child: TextField(
                                onSubmitted: (String input){
                                  onTextSubmission(input);
                                },
                                style: TextStyle(
                                  color: Colors.white, 
                                  fontSize: 24
                                ),
                                decoration: InputDecoration(
                                  hintText: 'Search for Location',
                                  hintStyle: TextStyle(
                                    color: Colors.white, 
                                    fontSize: 20
                                  ),
                                  prefixIcon: Icon(Icons.location_on, color: Colors.white)
                                )
                              )
                            ),
                            IconButton(
                              icon: Icon(Icons.info_outline),
                              iconSize: 30.0,
                              color: Colors.white,
                              onPressed: _showAbt,
                            ),
                          ],
                        ),
                      ]
                    ),
                    Container(
                      width: 350,
                      child: Text(
                          _suggestMe,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 25,
                            fontFamily: 'Balsans',
                            fontWeight: FontWeight.w300,
                            color: Colors.white
                          ),
                        ),
                      ),
                    Padding(
                    padding: const EdgeInsets.only(left:135.0),
                    child: Column(
                      children: [
                        _wi==''?Row(
                          children: [
                            Image(
                              image: AssetImage('assets/images/error.png'),
                              width: 150,
                              height: 150,
                              fit: BoxFit.cover,
                              alignment: Alignment.center,
                            ),
                          ],
                        ):Row(
                          children: [
                            Image(
                              image: NetworkImage(_wi),
                              width: 150,
                              height: 150,
                              fit: BoxFit.cover,
                              alignment: Alignment.center,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Column(              
                            children: <Widget>[
                              Container(
                                width: 400,
                                child: Text(
                                    _temperature.toString() + '  °C',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 60, 
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontFamily: 'Langar'
                                  ),
                                ),
                              ),
                              Container(
                                width: 400,
                                child: Text(
                                  _location + ' ,  ' + _country,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(                      
                            padding: EdgeInsets.only(top: 30.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Weather:     '+_weather,
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white
                                  ),
                                ),
                              Text(
                                'Min/Max:    '+ _min.toString() + ' °C /' + _max.toString() + ' °C',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white
                                ),
                              ),
                            ]
                          ),
                        )
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0,bottom: 0),
                  child: Text(
                    'Detailed Summary',
                    style: TextStyle(
                      fontFamily: 'Itim',
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                  ),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(bottom: 30.0,top: 10.0),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 150,
                                    child: Text(
                                      'Sunrise:   ',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontFamily: 'Itim',
                                        fontSize: 25,
                                        fontWeight: FontWeight.w200,
                                        color: Colors.white,                                   
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 150,
                                    child: Text(
                                      _sunrise,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontFamily: 'Itim',
                                        fontSize: 25,
                                        fontWeight: FontWeight.w200,
                                        color: Colors.white
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 150,
                                    child: Text(
                                      'Sunset:    ',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontFamily: 'Itim',
                                        fontSize: 25,
                                        fontWeight: FontWeight.w200,
                                        color: Colors.white
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 150,
                                    child: Text(
                                      _sunset,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontFamily: 'Itim',
                                        fontSize: 25,
                                        fontWeight: FontWeight.w200,
                                        color: Colors.white
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right:80.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 120,
                                      child: Text(
                                          'Country:',
                                          textAlign: TextAlign.left,                                        
                                          style: TextStyle(
                                            fontFamily: 'Itim',
                                            fontSize: 25,
                                            fontWeight: FontWeight.w200,
                                            color: Colors.white
                                          ),
                                        ),
                                    ),
                                    Container(
                                      width: 100,
                                      child: Text(
                                        '\t\t\t'+_country,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontFamily: 'Itim',
                                          fontSize: 25,
                                          fontWeight: FontWeight.w200,
                                          color: Colors.white
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right:8.0),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 150,
                                      child: Text(
                                        'Pressure:   ',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontFamily: 'Itim',
                                          fontSize: 25,
                                          fontWeight: FontWeight.w200,
                                          color: Colors.white
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 150,
                                      child: Text(
                                        _pressure,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontFamily: 'Itim',
                                          fontSize: 25,
                                          fontWeight: FontWeight.w200,
                                          color: Colors.white
                                        ),
                                      ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right:50.0),
                              child: Row(
                                children: [
                                  Container(
                                    width: 150,
                                    child: Text(
                                      'Humidity:   ',
                                      style: TextStyle(
                                        fontFamily: 'Itim',
                                        fontSize: 25,
                                        fontWeight: FontWeight.w200,
                                        color: Colors.white
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 100,
                                    child: Text(
                                        _humidity,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontFamily: 'Itim',
                                          fontSize: 25,
                                          fontWeight: FontWeight.w200,
                                          color: Colors.white
                                        ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right:50.0),
                              child: Row(
                                children: [
                                  Container(
                                    width: 150,
                                    child: Text(
                                      'WindSpeed:   ',
                                      style: TextStyle(
                                        fontFamily: 'Itim',
                                        fontSize: 25,
                                        fontWeight: FontWeight.w200,
                                        color: Colors.white
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 110,
                                    child: Text(
                                        _windSpeed,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontFamily: 'Itim',
                                          fontSize: 25,
                                          fontWeight: FontWeight.w200,
                                          color: Colors.white
                                        ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ]
                        ),
                      )
                    ],
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top:15.0),
                    child: Text(
                      'Forecast of $_location \nfor next 24 hours',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'Rubik',
                        fontSize: 20
                      ),
                    ),
                  )
                ]
              ),
              Padding(
                padding: const EdgeInsets.only(top:40.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0,bottom: 30.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(0, 0, 0, 0.1),
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: <Widget>[
                                _foreIcons[0]!=null?Image(
                                  image: NetworkImage(_foreIcons[0]), width: 50
                                ):Image(
                                  image: AssetImage('assets/images/error.png'), width: 50
                                ),
                                _foreTimes[0]!=null?Text(
                                  'Time: '+_foreTimes[0],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15
                                  ),
                                ):Text(
                                  'Time',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15
                                  )
                                ),
                                _foreMins[0]!=null?Text(
                                  'Min: '+_foreMins[0],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15
                                  ),
                                ):Text(
                                  'Min',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15
                                  ),
                                ),
                                _foreMax[0]!=null?Text(
                                  'Max: '+_foreMax[0],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15
                                  ),
                                ):Text(
                                  'Max',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15
                                  ),
                                )
                              ]
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0,bottom: 30.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(0, 0, 0, 0.1),
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: <Widget>[
                                _foreIcons[1]!=null?Image(
                                  image: NetworkImage(_foreIcons[1]), width: 50
                                ):Image(
                                  image: AssetImage('assets/images/error.png'), width: 50
                                ),
                                _foreTimes[1]!=null?Text(
                                  'Time: '+_foreTimes[1],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15
                                  ),
                                ):Text(
                                  'Time',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15
                                  )
                                ),
                                _foreMins[1]!=null?Text(
                                  'Min: '+_foreMins[1],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15
                                  ),
                                ):Text(
                                  'Min',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15
                                  ),
                                ),
                                _foreMax[1]!=null?Text(
                                  'Max: '+_foreMax[1],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15
                                  ),
                                ):Text(
                                  'Max',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15
                                  ),
                                )
                              ]
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0,bottom: 30.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(0, 0, 0, 0.1),
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: <Widget>[
                                _foreIcons[2]!=null?Image(
                                  image: NetworkImage(_foreIcons[2]), width: 50
                                ):Image(
                                  image: AssetImage('assets/images/error.png'), width: 50
                                ),
                                _foreTimes[2]!=null?Text(
                                  'Time: '+_foreTimes[2],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15
                                  ),
                                ):Text(
                                  'Time',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15
                                  )
                                ),
                                _foreMins[2]!=null?Text(
                                  'Min: '+_foreMins[2],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15
                                  ),
                                ):Text(
                                  'Min',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15
                                  ),
                                ),
                                _foreMax[2]!=null?Text(
                                  'Max: '+_foreMax[2],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15
                                  ),
                                ):Text(
                                  'Max',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15
                                  ),
                                )
                              ]
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0,bottom: 30.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(0, 0, 0, 0.1),
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: <Widget>[
                                _foreIcons[3]!=null?Image(
                                  image: NetworkImage(_foreIcons[3]), width: 50
                                ):Image(
                                  image: AssetImage('assets/images/error.png'), width: 50
                                ),
                                _foreTimes[3]!=null?Text(
                                  'Time: '+_foreTimes[3],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15
                                  ),
                                ):Text(
                                  'Time',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15
                                  )
                                ),
                                _foreMins[3]!=null?Text(
                                  'Min: '+_foreMins[3],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15
                                  ),
                                ):Text(
                                  'Min',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15
                                  ),
                                ),
                                _foreMax[3]!=null?Text(
                                  'Max: '+_foreMax[3],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15
                                  ),
                                ):Text(
                                  'Max',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15
                                  ),
                                )
                              ]
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0,bottom: 30.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(0, 0, 0, 0.1),
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: <Widget>[
                                _foreIcons[4]!=null?Image(
                                  image: NetworkImage(_foreIcons[4]), width: 50
                                ):Image(
                                  image: AssetImage('assets/images/error.png'), width: 50
                                ),
                                _foreTimes[4]!=null?Text(
                                  'Time: '+_foreTimes[4],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15
                                  ),
                                ):Text(
                                  'Time',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15
                                  )
                                ),
                                _foreMins[4]!=null?Text(
                                  'Min: '+_foreMins[4],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15
                                  ),
                                ):Text(
                                  'Min',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15
                                  ),
                                ),
                                _foreMax[4]!=null?Text(
                                  'Max: '+_foreMax[4],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15
                                  ),
                                ):Text(
                                  'Max',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15
                                  ),
                                )
                              ]
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0,bottom: 30.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(0, 0, 0, 0.1),
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: <Widget>[
                                _foreIcons[5]!=null?Image(
                                  image: NetworkImage(_foreIcons[5]), width: 50
                                ):Image(
                                  image: AssetImage('assets/images/error.png'), width: 50
                                ),
                                _foreTimes[5]!=null?Text(
                                  'Time: '+_foreTimes[5],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15
                                  ),
                                ):Text(
                                  'Time',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15
                                  )
                                ),
                                _foreMins[5]!=null?Text(
                                  'Min: '+_foreMins[5],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15
                                  ),
                                ):Text(
                                  'Min',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15
                                  ),
                                ),
                                _foreMax[5]!=null?Text(
                                  'Max: '+_foreMax[5],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15
                                  ),
                                ):Text(
                                  'Max',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15
                                  ),
                                )
                              ]
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0,bottom: 30.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(0, 0, 0, 0.1),
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: <Widget>[
                                _foreIcons[6]!=null?Image(
                                  image: NetworkImage(_foreIcons[6]), width: 50
                                ):Image(
                                  image: AssetImage('assets/images/error.png'), width: 50
                                ),
                                _foreTimes[6]!=null?Text(
                                  'Time: '+_foreTimes[6],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15
                                  ),
                                ):Text(
                                  'Time',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15
                                  )
                                ),
                                _foreMins[6]!=null?Text(
                                  'Min: '+_foreMins[6],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15
                                  ),
                                ):Text(
                                  'Min',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15
                                  ),
                                ),
                                _foreMax[6]!=null?Text(
                                  'Max: '+_foreMax[6],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15
                                  ),
                                ):Text(
                                  'Max',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15
                                  ),
                                )
                              ]
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0,bottom: 30.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(0, 0, 0, 0.1),
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: <Widget>[
                                _foreIcons[7]!=null?Image(
                                  image: NetworkImage(_foreIcons[7]), width: 50
                                ):Image(
                                  image: AssetImage('assets/images/error.png'), width: 50
                                ),
                                _foreTimes[7]!=null?Text(
                                  'Time: '+_foreTimes[7],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15
                                  ),
                                ):Text(
                                  'Time',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15
                                  )
                                ),
                                _foreMins[7]!=null?Text(
                                  'Min: '+_foreMins[7],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15
                                  ),
                                ):Text(
                                  'Min',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15
                                  ),
                                ),
                                _foreMax[7]!=null?Text(
                                  'Max: '+_foreMax[7],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15
                                  ),
                                ):Text(
                                  'Max',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15
                                  ),
                                )
                              ]
                            ),
                          ),
                        ),
                      ),
                    ]
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}