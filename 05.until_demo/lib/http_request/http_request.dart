import 'package:dio/dio.dart';

import 'http_config.dart';

class HttpRequest {
  ///基本设置
  /// receiveTimeout : 接受超时时间
  /// sendTimeout : 发送超时时间
  /// connectTimeout :链接超时时间
  static final BaseOptions baseOptions = BaseOptions(
      baseUrl: HttpConfig.baseURL,
      connectTimeout: HttpConfig.timeout);
  ///创建全局Dio
  static final Dio dio = Dio(baseOptions);

  ///封装带拦截器网络请求方法
  static Future<T> requestInter<T>(String url,
      {String method = "get",
       Map<String, dynamic> params,
       Interceptor inter}) async {
    // 1.创建单独配置
    final options = Options(method: method);

    // 全局拦截器
    // 创建默认的全局拦截器
    Interceptor dInter = InterceptorsWrapper(
        onRequest: (options) {
          print("请求拦截");
          return options;
        },
        onResponse: (response) {
          print("响应拦截");
          return response;
        },
        onError: (err) {
          print("错误拦截");
          return err;
        }
    );
    List<Interceptor> inters = [dInter];

    // 请求单独拦截器
    if (inter != null) {
      inters.add(inter);
    }

    // 统一添加到拦截器中
    dio.interceptors.addAll(inters);

    // 2.发送网络请求
    try {
      Response response = await dio.request(url, queryParameters: params, options: options);
      return response.data;
    } on DioError catch(e) {
      return Future.error(e);
    }
  }

  ///封装网络请求方法
  static Future<T> request<T>(String url, {String method = "get",
        Map<String, dynamic> params}) async {
    // 1.创建单独配置
    final options = Options(method: method);
    // 2.发送网络请求
    try {
      Response response = await dio.request(url, queryParameters: params, options: options);
      return response.data;
    } on DioError catch(e) {
      return Future.error(e);
    }
  }

  ///普通get方法
  static Future  get(Map<String, dynamic> params) async {
    try {
      Response response = await request(HttpConfig.baseURL, method: "get",params: params);
      return response;
    } on DioError catch(e) {
      return Future.error(e);
    }
  }

  ///post方法
  static Future post(Map<String, dynamic> params) async {
    try {
      Response response = await request(HttpConfig.baseURL, method: "post",params: params);
      return response;
    } on DioError catch(e) {
      return Future.error(e);
    }
  }


  ///拦截器get方法
  static Future  getInter(Map<String, dynamic> params) async {
    // 创建默认的全局拦截器
    Interceptor dInter = InterceptorsWrapper(
        onRequest: (options) {
          print("请求拦截");
          return options;
        },
        onResponse: (response) {
          print("响应拦截");
          return response;
        },
        onError: (err) {
          print("错误拦截");
          return err;
        }
    );
    try {
      Response response = await requestInter(
          HttpConfig.baseURL,
          method: "get",
          params: params,
          inter: null);
      return response;
    } on DioError catch(e) {
      return Future.error(e);
    }

  }

  ///拦截器post方法
  static Future  postInter(Map<String, dynamic> params) async {
    // 创建默认的全局拦截器
    Interceptor dInter = InterceptorsWrapper(
        onRequest: (options) {
          print("请求拦截");
          return options;
        },
        onResponse: (response) {
          print("响应拦截");
          return response;
        },
        onError: (err) {
          print("错误拦截");
          return err;
        }
    );
    try {
      Response response = await requestInter(
          HttpConfig.baseURL,
          method: "post",
          params: params,
          inter: null);
      return response;
    } on DioError catch(e) {
      return Future.error(e);
    }
  }
  
}