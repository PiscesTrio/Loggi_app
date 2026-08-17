class Repository {


    final List<String> _products = [
    '{"image":null,"quantity":6,"cost":5000.0,"name":"Guangming","description":"ぎゅうにゅう","location":"Godown 1, 1st Floor","company":"明治","group":"Milk"}',
    '{"image":null,"cost":null,"quantity":null,"name":A号仓库,"description":null,"location":"Godown 1, 1st Floor","company":null,"group":"Milk"}',
  ];
  Future<List<String>> get getProducts =>  Future.delayed(const Duration(seconds: 1), ()=> _products);
}