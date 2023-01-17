Map<String, String> headerNanMultipart(String token) {
  return {
    'Content-type': 'application/json',
    'Accept': '*/*',
    'Accept-Encoding': 'gzip, deflate, br',
    'Connection': 'keep-alive',
    'Authorization': token,
  };
}

Map<String, String> headersMultipart(String token) {
  return {
    'Accept': '*/*',
    'Accept-Encoding': 'gzip, deflate, br',
    'Connection': 'keep-alive',
    'Authorization': token,
  };
}

Map<String, String> headersDelete(String token) {
  return {
    'Accept': '*/*',
    'Accept-Encoding': 'gzip, deflate, br',
    'Connection': 'keep-alive',
    'Authorization': token,
  };
}
