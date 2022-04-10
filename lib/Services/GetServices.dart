import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:balanc_ed_2/Models/AllTransactionsModel.dart';
import 'package:http/http.dart' as http;
import 'package:balanc_ed_2/Models/ExpenseBreakdownModel.dart';
import 'package:balanc_ed_2/Models/MonthlyExpensesModel.dart';
import 'package:balanc_ed_2/Models/NetworthModel.dart';
import 'package:balanc_ed_2/Models/NewsModel.dart';
import 'package:balanc_ed_2/Models/UserProfileModel.dart';
import 'package:balanc_ed_2/Services/SharedPreferences.dart';

class GetServices {
/* Future<List<Article>>getAllArticles()async
 {
   Uri uri = Uri.parse("https://ashish226.pythonanywhere.com/api/article/");
   var head = {
     "Content-Type":"application/json"
   };
   var response = await http.get(uri,headers: head);
   if(response.statusCode==200)
     {
       return (json.decode(response.body) as List)
           .map((data) => Article.fromJson(data))
           .toList();
     }
   else
     {
       print(response.statusCode.toString());
     }
 }
 Future<List<StockPrices>>getAllStocks()async
 {
   Uri uri = Uri.parse("https://ashish226.pythonanywhere.com/api/stock/");
   var head = {
     "Content-Type":"application/json"
   };
   var response = await http.get(uri,headers: head);
   if(response.statusCode==200)
   {
     return (json.decode(response.body) as List)
         .map((data) => StockPrices.fromJson(data))
         .toList();
   }
   else
   {
     print(response.statusCode.toString());
   }
 }
 Future<CryCurr>getAllCrypto()async
 {
  print("Goint to call");
   Uri uri = Uri.parse("https://ashish226.pythonanywhere.com/api/crypto/");
   var response = await http.get(uri);
   if(response.statusCode==200)
   {
     return CryCurr.fromJson(jsonDecode(response.body));
   }
   else
   {
     print(response.statusCode.toString());
   }
 }
 Future<News>getNews()async
 {
   Uri uri = Uri.parse("https://ashish226.pythonanywhere.com/api/news/");
   var head = {
     "Content-Type":"application/json"
   };
   var response = await http.get(uri,headers: head);
   if(response.statusCode==200)
   {
      var x = utf8.encode(response.body);
      var y = utf8.decode(x);
     return News.fromJson(jsonDecode(y));
   }
   else
   {

   }
 }
 Future<CurrencyConverter>getExchangeRate()async
 {
   print("API CALLED");
   Uri uri = Uri.parse("https://metals-api.com/api/convert?access_key=9sz3dz877i3yu3kthp12egn27qwab782i366wapdpc2kcj7c2aaoaigolmdv&&from=USD&to=INR&amount=1");
   var response = await http.get(uri);
   print("API RECIEVED");
   if(response.statusCode==200)
   {
  */ /*   print("THIS IS Ornaments");
     print(response.body);*/ /*
     return CurrencyConverter.fromJson(jsonDecode(response.body));
   }
   else
   {
  */ /*   print("THIS IS Ornaments");
     print(response.statusCode.toString());*/ /*
   }
 }*/
  getProfilePic() async {
    String? token = await getToken(key: "token1");
    if (token != null) {
      var headers = {"Authorization": "Token $token"};
      Uri uri =
          Uri.parse("https://ashish226.pythonanywhere.com/api/profile-pic/");
      var request = await http.get(uri, headers: headers);
      if (request.statusCode == 200) {
        var jsonData = jsonDecode(request.body);
        await savePic(saveKey: "profilepic", saveValue: jsonData["image_url"]);
      }
    }
  }

  Future<UserProfile?> getUserProfile() async {
    String? token = await getToken(key: "token1");

    if (token != null) {
      var headers = {"Authorization": "Bearer $token"};
      Uri uri = Uri.parse(
          "https://api-balanced-epic.azurewebsites.net/api/userdetails");
      var request = await http.get(uri, headers: headers);
      if (request.statusCode == 200) {
        print(request.body);
        var jsonData = jsonDecode(request.body);
        return UserProfile.fromJson(jsonData);
      } else {
        Fluttertoast.showToast(msg: "Sorry, User Profile is not available");
      }
      return null;
    }
  }

  Future<dynamic> getUserGoals() async {
    String? token = await getToken(key: "token1");
    if (token != null) {
      var headers = {"Authorization": "Bearer $token"};
      Uri uri =
          Uri.parse("https://api-balanced-epic.azurewebsites.net/api/goal");
      var request = await http.get(uri, headers: headers);
      if (request.statusCode == 200) {
        print(request.body);
        var jsonData = jsonDecode(request.body);
        return UserProfile.fromJson(jsonData);
      } else {
        Fluttertoast.showToast(msg: "Sorry, User Profile is not available");
      }
      return null;
    }
  }

  Future<List<TransactionDetails>?> getAllTransactionDetails() async {
    String? token = await getToken(key: "token1");
    if (token != null) {
      var headers = {"Authorization": "Bearer $token"};
      Uri uri = Uri.parse(
          "https://api-balanced-epic.azurewebsites.net/api/transaction");
      var request = await http.get(uri, headers: headers);
      var jsonData;
      if (request.statusCode == 200) {
        jsonData = jsonDecode(request.body);
      } else {
        Fluttertoast.showToast(
            msg: "Sorry, An Error occured while fetching data");
        return null;
      }
      return (jsonData as List)
          .map((jsonData) => TransactionDetails.fromJson(jsonData))
          .toList();
    }
  }

  getDailyForecast() async {
    String? token = await getToken(key: "token1");
    if (token != null) {
      var headers = {"Authorization": "Bearer $token"};
      Uri uri =
          Uri.parse("https://api-balanced-epic.azurewebsites.net/api/forecast");
      var request = await http.get(uri, headers: headers);
      var jsonData;
      if (request.statusCode == 200) {
        jsonData = jsonDecode(request.body);
      } else {
        Fluttertoast.showToast(
            msg: "Sorry, An Error occured while fetching data");
        return null;
      }
      return (jsonData as List)
          .map((jsonData) => TransactionDetails.fromJson(jsonData))
          .toList();
    }
  }

  Future<List<MonthlyExpense>?> getMonthlyExpense() async {
    String? token = await getToken(key: "token1");
    if (token != null) {
      var headers = {"Authorization": "Bearer $token"};
      Uri uri = Uri.parse(
          "https://api-balanced-epic.azurewebsites.net/api/analytics/monthly_break");
      var request = await http.get(uri, headers: headers);
      var jsonData;
      if (request.statusCode == 200) {
        jsonData = jsonDecode(request.body);
      } else {
        Fluttertoast.showToast(
            msg: "Sorry, An Error occured while fetching data");
        return null;
      }
      return (jsonData as List)
          .map((jsonData) => MonthlyExpense.fromJson(jsonData))
          .toList();
    }
  }

  Future<List<ExpenseBreakdown>?> getBreakdown() async {
    String? token = await getToken(key: "token1");
    if (token != null) {
      var headers = {"Authorization": "Bearer $token"};
      Uri uri = Uri.parse(
          "https://api-balanced-epic.azurewebsites.net/api/analytics/expense_break");
      var request = await http.get(uri, headers: headers);
      var jsonData;
      if (request.statusCode == 200) {
        jsonData = jsonDecode(request.body);
      } else {
        Fluttertoast.showToast(
            msg: "Sorry, An Error occured while fetching data");
        return null;
      }
      return (jsonData as List)
          .map((jsonData) => ExpenseBreakdown.fromJson(jsonData))
          .toList();
    }
  }

  Future<List<NetWorth>?> getNetWorth() async {
    String? token = await getToken(key: "token1");

    if (token != null) {
      var headers = {"Authorization": "Bearer $token"};
      Uri uri = Uri.parse(
          "https://api-balanced-epic.azurewebsites.net/api/analytics/net_worth");
      var request = await http.get(uri, headers: headers);
      var jsonData;
      if (request.statusCode == 200) {
        jsonData = jsonDecode(request.body);
      } else {
        Fluttertoast.showToast(
            msg: "Sorry, An Error occured while fetching data");
        return null;
      }
      return (jsonData as List)
          .map((jsonData) => NetWorth.fromJson(jsonData))
          .toList();
    }
  }

  Future<List<NewsClass>?> getNews() async {
    Uri uri = Uri.parse("https://api-balanced-epic.azurewebsites.net/api/news");
    var request = await http.get(uri);
    var jsonData;
    if (request.statusCode == 200) {
      jsonData = jsonDecode(request.body);
    } else {
      Fluttertoast.showToast(
          msg: "Sorry, An Error occured while fetching data");
      return null;
    }
    return (jsonData as List)
        .map((jsonData) => NewsClass.fromJson(jsonData))
        .toList();
  }
}
