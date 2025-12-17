class TaskModel{
  final String id;
  final String title;
  final String description;
  final String status;
  final String email;
  final String createdData;
  TaskModel ({required this.status,
    required this.title,
    required this.description,
    required this.email,
    required this.createdData,
    required this.id
  });
  factory TaskModel.fromJson(Map<String,dynamic>jsonData){
    return TaskModel(status: jsonData['status']?? '',
        title: jsonData['title']?? '',
        description: jsonData['description']?? '',
        email: jsonData['email']?? '',
        createdData: jsonData['createdDate']?? '',
        id: jsonData['id']?? '');
  }

}