class GetBranchDataModel {
  GetBranchDataModel({
      bool? status, 
      String? message, 
      List<BranchInfo>? branchInfo, 
      List<LocalAgentBranch>? localAgentBranch,}){
    _status = status;
    _message = message;
    _branchInfo = branchInfo;
    _localAgentBranch = localAgentBranch;
}

  GetBranchDataModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['branch_info'] != null) {
      _branchInfo = [];
      json['branch_info'].forEach((v) {
        _branchInfo?.add(BranchInfo.fromJson(v));
      });
    }
    if (json['local_agent_branch'] != null) {
      _localAgentBranch = [];
      json['local_agent_branch'].forEach((v) {
        _localAgentBranch?.add(LocalAgentBranch.fromJson(v));
      });
    }
  }
  bool? _status;
  String? _message;
  List<BranchInfo>? _branchInfo;
  List<LocalAgentBranch>? _localAgentBranch;
GetBranchDataModel copyWith({  bool? status,
  String? message,
  List<BranchInfo>? branchInfo,
  List<LocalAgentBranch>? localAgentBranch,
}) => GetBranchDataModel(  status: status ?? _status,
  message: message ?? _message,
  branchInfo: branchInfo ?? _branchInfo,
  localAgentBranch: localAgentBranch ?? _localAgentBranch,
);
  bool? get status => _status;
  String? get message => _message;
  List<BranchInfo>? get branchInfo => _branchInfo;
  List<LocalAgentBranch>? get localAgentBranch => _localAgentBranch;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_branchInfo != null) {
      map['branch_info'] = _branchInfo?.map((v) => v.toJson()).toList();
    }
    if (_localAgentBranch != null) {
      map['local_agent_branch'] = _localAgentBranch?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class LocalAgentBranch {
  LocalAgentBranch({
      String? agentCity, 
      String? agentCountry, 
      String? agentBranch, 
      String? total,}){
    _agentCity = agentCity;
    _agentCountry = agentCountry;
    _agentBranch = agentBranch;
    _total = total;
}

  LocalAgentBranch.fromJson(dynamic json) {
    _agentCity = json['agent_city'];
    _agentCountry = json['agent_country'];
    _agentBranch = json['agent_branch'];
    _total = json['total'];
  }
  String? _agentCity;
  String? _agentCountry;
  String? _agentBranch;
  String? _total;
LocalAgentBranch copyWith({  String? agentCity,
  String? agentCountry,
  String? agentBranch,
  String? total,
}) => LocalAgentBranch(  agentCity: agentCity ?? _agentCity,
  agentCountry: agentCountry ?? _agentCountry,
  agentBranch: agentBranch ?? _agentBranch,
  total: total ?? _total,
);
  String? get agentCity => _agentCity;
  String? get agentCountry => _agentCountry;
  String? get agentBranch => _agentBranch;
  String? get total => _total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['agent_city'] = _agentCity;
    map['agent_country'] = _agentCountry;
    map['agent_branch'] = _agentBranch;
    map['total'] = _total;
    return map;
  }

}

class BranchInfo {
  BranchInfo({
      String? branch, 
      String? bankbranchid, 
      String? locationid, 
      String? bankid,}){
    _branch = branch;
    _bankbranchid = bankbranchid;
    _locationid = locationid;
    _bankid = bankid;
}

  BranchInfo.fromJson(dynamic json) {
    _branch = json['BRANCH'];
    _bankbranchid = json['BANK_BRANCHID'];
    _locationid = json['LOCATIONID'];
    _bankid = json['BANKID'];
  }
  String? _branch;
  String? _bankbranchid;
  String? _locationid;
  String? _bankid;
BranchInfo copyWith({  String? branch,
  String? bankbranchid,
  String? locationid,
  String? bankid,
}) => BranchInfo(  branch: branch ?? _branch,
  bankbranchid: bankbranchid ?? _bankbranchid,
  locationid: locationid ?? _locationid,
  bankid: bankid ?? _bankid,
);
  String? get branch => _branch;
  String? get bankbranchid => _bankbranchid;
  String? get locationid => _locationid;
  String? get bankid => _bankid;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['BRANCH'] = _branch;
    map['BANK_BRANCHID'] = _bankbranchid;
    map['LOCATIONID'] = _locationid;
    map['BANKID'] = _bankid;
    return map;
  }

}