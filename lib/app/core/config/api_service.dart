// ignore_for_file: constant_identifier_names

class ApiService {
  static const String URL_BASE = 'http://localhost/sys_venda/api';
  static const String CREATE_PRODUCT = '$URL_BASE/product/create_product.php';
  static const String DELETE_PRODUCT = '$URL_BASE/product/delete_product.php';
  static const String GET_ALL_PRODUCTS =
      '$URL_BASE/product/get_all_products.php';
  static const String GET_PRODUCT_FOR_ID =
      '$URL_BASE/product/get_product_for_id.php';
  static const String UPDATE_PRODUCT = '$URL_BASE/product/update_product.php';

  static const String CREATE_CLIENT = '$URL_BASE/client/create_client.php';
  static const String DELETE_CLIENT = '$URL_BASE/client/delete_client.php';
  static const String GET_ALL_CLIENTS = '$URL_BASE/client/get_all_clients.php';
  static const String GET_CLIENT_FOR_ID =
      '$URL_BASE/client/get_client_for_id.php';
  static const String UPDATE_CLIENT = '$URL_BASE/api/client/update_client.php';

  static const String CREATE_SALE = '$URL_BASE/sale/create_sale.php';
  static const String GET_SALES_FOR_CLIENT =
      '$URL_BASE/sale/get_sales_for_client.php';
}
