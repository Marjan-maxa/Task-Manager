// {"status":"success",
// "data":{"_id":"693b1198880cc5d30a303c55",
// "email":"Marjan05@gmail.com",
// "firstName":"Mr.",
// "lastName":"Marjan",
// "mobile":"01944781379",
// "createdDate":"2025-10-02T06:21:41.011Z"},
// "token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3NjU1NjczNzcsImRhdGEiOiJNYXJqYW4wNUBnbWFpbC5jb20iLCJpYXQiOjE3NjU0ODA5Nzh9.m13pkMSi56kmeQzQiN0nOlh6ORWPIp8QqASUbWCnCWg"}


class UserModel{
  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final String mobile;
  final String photo;

UserModel({required this.id,
  required this.email,
  required this.firstName,
  required this.lastName,
  required this.mobile, required this.photo});

 factory UserModel.fromJson(Map<String,dynamic>jsonData){
  return UserModel(id: jsonData['id']??'',
      email: jsonData['email']??'',
      firstName: jsonData['firstName']??'',
      lastName: jsonData['lastName']??'',
      mobile: jsonData['mobile']??'',
    photo: jsonData['mobile']??'',
  );
  }

  Map<String,dynamic>toJson(){
   return {
     "_id":id,
     "email":email,
     "firstName":firstName,
     "lastName":lastName,
     "mobile":mobile,

   };
  }

}