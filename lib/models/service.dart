
class Service{

  String id;
  String department;
  String title;
  String description;
  String category;
  String status;
  String createdAt;
  String severity;
  String userId;
  String toUserId;

  Service({

    required this.id,
    required this.department,
    required this.title,
    required this.description,
    required this.category,
    required this.status,
    required this.createdAt,
    required this.severity,
    required this.userId,
    required this.toUserId,
    
  });  

  factory Service.extraerInfo( json ) => Service(
    id          : json['service']['_id'],
    department  : json['service']['report']['department'],
    title       : json['service']['report']['title'],
    description : json['service']['report']['description'],
    category    : json['service']['report']['category'],
    status      : json['service']['status'],
    createdAt   : json['service']['createdAt'],
    severity    : json['service']['severity'],
    userId      : json['service']['assignedTo']['_id'],
    toUserId    : json['service']['user']['_id'],
  );

}