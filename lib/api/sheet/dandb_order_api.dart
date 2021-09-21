import 'package:flutter_app/models/dandb_order.dart';
import 'package:gsheets/gsheets.dart';

class DandBOrderSheetApi {
  static const _credentials = r'''
{
  "type": "service_account",
  "project_id": "dandbprjff",
  "private_key_id": "4b2a498910a8915ad7c1bfa0a3cd061c5658f5df",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCgONn8BrXTJEbr\nsrtawrha5TYLtfEm4NsOhxiiHjZYRT8C3SD4RD/mZqihvDCndBoVDLxJOHxucSJZ\nNn4wVnRrUIGmQk5ClIIKi+bGvnMQ8nyJEDP8f/yYQhrwJtbhdfD9KUeSL8BFFY4E\nyDzyqPbe0GC+8mKjzGn7uxlInYM7DCHlCNJb3AyNLDq3EooVGDxmd0DGdoOEnAmg\nGP3b+TJC9kCP21V6OQPJyUIUqRtGEwjN0Y4Xl+oFNldUTGHA6fYGsav9nk5rEIOq\ntEdxtu0S94OuSkERHxRHbd4QtYcisXIVEQP5R+JCdDLwdQQFqLxv/ySKzIi79+AR\nNd32F/rnAgMBAAECggEAAXuv6OQBrYwEbAzM1zDo6/kl4EM1kZqQlziA7d9BuYd1\nPIg3fz+CfUDYsXFAh2GibCzLVrzYdLKaEswCVwg12QMhxXGPr+YYCL5Ky0QwDylv\newVUtd2pb5oNDcljloAKVGLxb/+pKU/jGgA7MDPdin/QpXPbneXihUYHceNODQSH\n+9+IneupH4lIZqsCCh+b/bSgQGnEY3PXtO+JqQ6CQH2egOwOIiGUWnFzigylpOOt\nsiw6mywterECo0rYIaxnaZlpJobOHJkfxWXUttcajCrR5J6xlmACa50kTqk5L94c\n6J93dlsXUiDdhh3BW6FHSNirOg9iqlxdHSNZXMRfYQKBgQDMHQYj7/nhZ88suZj8\nH+zzYU5RG/X28QW154E2EbkG+GQ2hlkAZrWMZULH6qYUGewviHpRDoNxJmJzVScp\n8yIqJjRm7Hp/9uy1ohBoYN4vHl+WGKJ8v0OOxXznr0h5uz2ourwsaj2MgEupGTl1\nG7wx/NG3nYHQivFXGUMvLmkKfQKBgQDI84mB7Aw1DLeqbJBS90lWh/55ouYMV9mi\nuXlthGmIjHQUx7nej/pCfsU3+8wE1hKgyd+hb/5BFXpu1yKl3L7mCcbwsqKxcsZA\nT2tHbuJIq/+1jqf18YkKcu9OzD5q53dlvKJzM/DfFwm9eHN7MxRiKy31DxK2VFGW\nZpebCee0MwKBgQC5MjBrFQbtjKn+U5vKTxFINma/0xXV7BQZWybyrxvphiAvFLDW\nW1qoOwxfpbjwjiCtdDA/MWLznDdBm+Z/+nlqMuXi6Pew+ZMGrjgi7JlLuUxTPKDZ\nfRTICsns0S56PPiSCnRH/FFCFPoRQLDQX8zeshx6dC/fzuFw/JvnyD1IZQKBgDNe\nVgtZPPGes6CkKeybfCrbjsinRKlpF6BKS2kcjSGzzcS2HaRwJ6gx4dZizo957b8e\ne8U37MXUaLzGz/uYR1BktW84KvCzh0xPQPw8symiljZiJjtvp/l80gHRoi8PxmzC\nYMCUSYGt0PaXQOYAc7h4k0HuvXjQax7IUP739DwTAoGBAME6qrxLq3QLGpPqkWUF\nZOp3a/WIH2GG/VjH7qoI9UrtOXLPvZvYc3jyX21qLre+SL4P15FZIwaWdUsRBNSN\n6cpUmzU9MQcnA4fSMz6tklBrSBNVW2W9pRJHGr8uj/iCATCml/JtgYR4NA590A/G\nZxI1psye5tf4CnMcLh2kI1in\n-----END PRIVATE KEY-----\n",
  "client_email": "zhiew-496@dandbprjff.iam.gserviceaccount.com",
  "client_id": "112792182111947503868",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/zhiew-496%40dandbprjff.iam.gserviceaccount.com"
}


  ''';
  static final _spreadsheetId = "1PMNMmZVThSAbSaXvXnrhgPdTb5fBKCjTdYKkDbKnAtU";
  static final _gsheets = GSheets(_credentials);
  static Worksheet? _dborderSheet;

  static Future init() async {
    try {
      final spreadsheet = await _gsheets.spreadsheet(_spreadsheetId);
      _dborderSheet = await _getWorkSheet(spreadsheet, title: 'DandBOrdering');

      final firstRow = DandBOrderFields.getFields();
      _dborderSheet!.values.insertRow(1, firstRow);
    } catch (e) {
      print('Inti Error : $e');
    }
  }

  static Future<Worksheet> _getWorkSheet(Spreadsheet spreadsheet,
      {required String title}) async {
    try {
      return await spreadsheet.addWorksheet(title);
    } catch (e) {
      return spreadsheet.worksheetByTitle(title)!;
    }
  }

  static Future insert(List<Map<String, dynamic>> rowList) async {
    if (_dborderSheet == null) return;
    _dborderSheet!.values.map.appendRows(rowList);
  }
}
