import 'dart:convert';
import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
  'BCH',
  'XMR'
];

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = '11BFE200-D4C7-4172-ADAA-09DC9C75BFD6';

class CoinData {
  Future getCoinData(String selectedCurrency) async {
    Map<String, String> cryptoPrices = {};
    for (String crypto in cryptoList) {
      try {
        String requestURL = '$coinAPIURL/$crypto/$selectedCurrency?apikey=$apiKey';
        http.Response response = await http.get(requestURL);
        
        if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        double price = decodedData['rate'];
        cryptoPrices[crypto] = price.toStringAsFixed(0);
        } else {
          print(response.statusCode);
          }
      } catch (e) {
        print(e);
        }
    }
    return cryptoPrices;
  }
}
