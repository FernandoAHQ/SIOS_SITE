
class Report{

  final String id;
  final String report;
  final String status;
  final String createdAt;
  final String updatedAt;
  final String assignedTo;

  Report({

    required this.id,
    required this.report,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.assignedTo
    
  });

  factory Report.convertirLista(List<dynamic> data, int index)=> Report(
    id: data[index]['_id'],
    assignedTo: '',
    createdAt: '',
    report: '',
    status: '',
    updatedAt: '',
  );

  

}