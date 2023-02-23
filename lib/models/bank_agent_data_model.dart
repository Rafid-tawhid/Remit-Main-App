class BankAgentDataModel {
  BankAgentDataModel({
      bool? status, 
      String? message, 
      List<BankInfo>? bankInfo, 
      List<LocalAgent>? localAgent,}){
    _status = status;
    _message = message;
    _bankInfo = bankInfo;
    _localAgent = localAgent;
}

  BankAgentDataModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['bank_info'] != null) {
      _bankInfo = [];
      json['bank_info'].forEach((v) {
        _bankInfo?.add(BankInfo.fromJson(v));
      });
    }
    if (json['local_agent'] != null) {
      _localAgent = [];
      json['local_agent'].forEach((v) {
        _localAgent?.add(LocalAgent.fromJson(v));
      });
    }
  }
  bool? _status;
  String? _message;
  List<BankInfo>? _bankInfo;
  List<LocalAgent>? _localAgent;
BankAgentDataModel copyWith({  bool? status,
  String? message,
  List<BankInfo>? bankInfo,
  List<LocalAgent>? localAgent,
}) => BankAgentDataModel(  status: status ?? _status,
  message: message ?? _message,
  bankInfo: bankInfo ?? _bankInfo,
  localAgent: localAgent ?? _localAgent,
);
  bool? get status => _status;
  String? get message => _message;
  List<BankInfo>? get bankInfo => _bankInfo;
  List<LocalAgent>? get localAgent => _localAgent;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_bankInfo != null) {
      map['bank_info'] = _bankInfo?.map((v) => v.toJson()).toList();
    }
    if (_localAgent != null) {
      map['local_agent'] = _localAgent?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class LocalAgent {
  LocalAgent({
      String? agentCity, 
      String? agentCountry, 
      String? total,}){
    _agentCity = agentCity;
    _agentCountry = agentCountry;
    _total = total;
}

  LocalAgent.fromJson(dynamic json) {
    _agentCity = json['agent_city'];
    _agentCountry = json['agent_country'];
    _total = json['total'];
  }
  String? _agentCity;
  String? _agentCountry;
  String? _total;
LocalAgent copyWith({  String? agentCity,
  String? agentCountry,
  String? total,
}) => LocalAgent(  agentCity: agentCity ?? _agentCity,
  agentCountry: agentCountry ?? _agentCountry,
  total: total ?? _total,
);
  String? get agentCity => _agentCity;
  String? get agentCountry => _agentCountry;
  String? get total => _total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['agent_city'] = _agentCity;
    map['agent_country'] = _agentCountry;
    map['total'] = _total;
    return map;
  }

}

class BankInfo {
  BankInfo({
      String? agent, 
      String? totalBranch,}){
    _agent = agent;
    _totalBranch = totalBranch;
}

  BankInfo.fromJson(dynamic json) {
    _agent = json['AGENT'];
    _totalBranch = json['total_branch'];
  }
  String? _agent;
  String? _totalBranch;
BankInfo copyWith({  String? agent,
  String? totalBranch,
}) => BankInfo(  agent: agent ?? _agent,
  totalBranch: totalBranch ?? _totalBranch,
);
  String? get agent => _agent;
  String? get totalBranch => _totalBranch;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['AGENT'] = _agent;
    map['total_branch'] = _totalBranch;
    return map;
  }

  @override
  String toString() {
    return 'BankInfo{_agent: $_agent, _totalBranch: $_totalBranch}';
  }
}