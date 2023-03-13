class CounterUpModels {
  CounterUpModels({
      List<CounterUpTemplate>? counteruptemplate, 
      List<CounterUpContent>? counterupcontent,}){
    _counteruptemplate = counteruptemplate;
    _counterupcontent = counterupcontent;
}

  CounterUpModels.fromJson(dynamic json) {
    if (json['counter-up-template'] != null) {
      _counteruptemplate = [];
      json['counter-up-template'].forEach((v) {
        _counteruptemplate?.add(CounterUpTemplate.fromJson(v));
      });
    }
    if (json['counter-up-content'] != null) {
      _counterupcontent = [];
      json['counter-up-content'].forEach((v) {
        _counterupcontent?.add(CounterUpContent.fromJson(v));
      });
    }
  }
  List<CounterUpTemplate>? _counteruptemplate;
  List<CounterUpContent>? _counterupcontent;
CounterUpModels copyWith({  List<CounterUpTemplate>? counteruptemplate,
  List<CounterUpContent>? counterupcontent,
}) => CounterUpModels(  counteruptemplate: counteruptemplate ?? _counteruptemplate,
  counterupcontent: counterupcontent ?? _counterupcontent,
);
  List<CounterUpTemplate>? get counteruptemplate => _counteruptemplate;
  List<CounterUpContent>? get counterupcontent => _counterupcontent;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_counteruptemplate != null) {
      map['counter-up-template'] = _counteruptemplate?.map((v) => v.toJson()).toList();
    }
    if (_counterupcontent != null) {
      map['counter-up-content'] = _counterupcontent?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class CounterUpContent {
  CounterUpContent({
      num? id, 
      String? contentId, 
      CounterUpMainDescription? description,
      String? createdAt, 
      CounterUpMainContent? content,}){
    _id = id;
    _contentId = contentId;
    _description = description;
    _createdAt = createdAt;
    _content = content;
}

  CounterUpContent.fromJson(dynamic json) {
    _id = json['id'];
    _contentId = json['content_id'];
    _description = json['description'] != null ? CounterUpMainDescription.fromJson(json['description']) : null;
    _createdAt = json['created_at'];
    _content = json['content'] != null ? CounterUpMainContent.fromJson(json['content']) : null;
  }
  num? _id;
  String? _contentId;
  CounterUpMainDescription? _description;
  String? _createdAt;
  CounterUpMainContent? _content;
CounterUpContent copyWith({  num? id,
  String? contentId,
  CounterUpMainDescription? description,
  String? createdAt,
  CounterUpMainContent? content,
}) => CounterUpContent(  id: id ?? _id,
  contentId: contentId ?? _contentId,
  description: description ?? _description,
  createdAt: createdAt ?? _createdAt,
  content: content ?? _content,
);
  num? get id => _id;
  String? get contentId => _contentId;
  CounterUpMainDescription? get description => _description;
  String? get createdAt => _createdAt;
  CounterUpMainContent? get content => _content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['content_id'] = _contentId;
    if (_description != null) {
      map['description'] = _description?.toJson();
    }
    map['created_at'] = _createdAt;
    if (_content != null) {
      map['content'] = _content?.toJson();
    }
    return map;
  }

}

class CounterUpMainContent {
  CounterUpMainContent({
      num? id, 
      String? name, 
      ContentMedia? contentMedia,}){
    _id = id;
    _name = name;
    _contentMedia = contentMedia;
}

  CounterUpMainContent.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _contentMedia = json['content_media'] != null ? ContentMedia.fromJson(json['content_media']) : null;
  }
  num? _id;
  String? _name;
  ContentMedia? _contentMedia;
CounterUpMainContent copyWith({  num? id,
  String? name,
  ContentMedia? contentMedia,
}) => CounterUpMainContent(  id: id ?? _id,
  name: name ?? _name,
  contentMedia: contentMedia ?? _contentMedia,
);
  num? get id => _id;
  String? get name => _name;
  ContentMedia? get contentMedia => _contentMedia;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    if (_contentMedia != null) {
      map['content_media'] = _contentMedia?.toJson();
    }
    return map;
  }

}

class ContentMedia {
  ContentMedia({
      String? contentId, 
      Description? description,}){
    _contentId = contentId;
    _description = description;
}

  ContentMedia.fromJson(dynamic json) {
    _contentId = json['content_id'];
    _description = json['description'] != null ? Description.fromJson(json['description']) : null;
  }
  String? _contentId;
  Description? _description;
ContentMedia copyWith({  String? contentId,
  Description? description,
}) => ContentMedia(  contentId: contentId ?? _contentId,
  description: description ?? _description,
);
  String? get contentId => _contentId;
  Description? get description => _description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['content_id'] = _contentId;
    if (_description != null) {
      map['description'] = _description?.toJson();
    }
    return map;
  }

}

class Description {
  Description({
      String? image,}){
    _image = image;
}

  Description.fromJson(dynamic json) {
    _image = json['image'];
  }
  String? _image;
Description copyWith({  String? image,
}) => Description(  image: image ?? _image,
);
  String? get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['image'] = _image;
    return map;
  }

}

class CounterUpMainDescription {
  ContentMediaDescription({
      String? title, 
      String? shortDescription,}){
    _title = title;
    _shortDescription = shortDescription;
}

  CounterUpMainDescription.fromJson(dynamic json) {
    _title = json['title'];
    _shortDescription = json['short_description'];
  }
  String? _title;
  String? _shortDescription;
//   CounterUpMainDescription copyWith({  String? title,
//   String? shortDescription,
// }) => CounterUpMainDescription(title:'',shortDescription'');
  String? get title => _title;
  String? get shortDescription => _shortDescription;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['short_description'] = _shortDescription;
    return map;
  }

}

class CounterUpTemplate {
  CounterUpTemplate({
      num? id, 
      String? languageId, 
      String? sectionName, 
      CounterUpTemplateDescription? description,
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _languageId = languageId;
    _sectionName = sectionName;
    _description = description;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  CounterUpTemplate.fromJson(dynamic json) {
    _id = json['id'];
    _languageId = json['language_id'];
    _sectionName = json['section_name'];
    _description = json['description'] != null ? CounterUpTemplateDescription.fromJson(json['description']) : null;
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _languageId;
  String? _sectionName;
  CounterUpTemplateDescription? _description;
  String? _createdAt;
  String? _updatedAt;
CounterUpTemplate copyWith({  num? id,
  String? languageId,
  String? sectionName,
  CounterUpTemplateDescription? description,
  String? createdAt,
  String? updatedAt,
}) => CounterUpTemplate(  id: id ?? _id,
  languageId: languageId ?? _languageId,
  sectionName: sectionName ?? _sectionName,
  description: description ?? _description,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  String? get languageId => _languageId;
  String? get sectionName => _sectionName;
  CounterUpTemplateDescription? get description => _description;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['language_id'] = _languageId;
    map['section_name'] = _sectionName;
    if (_description != null) {
      map['description'] = _description?.toJson();
    }
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}

class CounterUpTemplateDescription {
  CounterUpTemplateDescription({
      String? firstCounter, 
      String? firstContent, 
      String? secondCounter, 
      String? secondContent, 
      String? thirdCounter, 
      String? thirdContent, 
      String? fourthCounter, 
      String? fourthContent,}){
    _firstCounter = firstCounter;
    _firstContent = firstContent;
    _secondCounter = secondCounter;
    _secondContent = secondContent;
    _thirdCounter = thirdCounter;
    _thirdContent = thirdContent;
    _fourthCounter = fourthCounter;
    _fourthContent = fourthContent;
}

  CounterUpTemplateDescription.fromJson(dynamic json) {
    _firstCounter = json['first_counter'];
    _firstContent = json['first_content'];
    _secondCounter = json['second_counter'];
    _secondContent = json['second_content'];
    _thirdCounter = json['third_counter'];
    _thirdContent = json['third_content'];
    _fourthCounter = json['fourth_counter'];
    _fourthContent = json['fourth_content'];
  }
  String? _firstCounter;
  String? _firstContent;
  String? _secondCounter;
  String? _secondContent;
  String? _thirdCounter;
  String? _thirdContent;
  String? _fourthCounter;
  String? _fourthContent;
  CounterUpTemplateDescription copyWith({  String? firstCounter,
  String? firstContent,
  String? secondCounter,
  String? secondContent,
  String? thirdCounter,
  String? thirdContent,
  String? fourthCounter,
  String? fourthContent,
}) => CounterUpTemplateDescription(  firstCounter: firstCounter ?? _firstCounter,
  firstContent: firstContent ?? _firstContent,
  secondCounter: secondCounter ?? _secondCounter,
  secondContent: secondContent ?? _secondContent,
  thirdCounter: thirdCounter ?? _thirdCounter,
  thirdContent: thirdContent ?? _thirdContent,
  fourthCounter: fourthCounter ?? _fourthCounter,
  fourthContent: fourthContent ?? _fourthContent,
);
  String? get firstCounter => _firstCounter;
  String? get firstContent => _firstContent;
  String? get secondCounter => _secondCounter;
  String? get secondContent => _secondContent;
  String? get thirdCounter => _thirdCounter;
  String? get thirdContent => _thirdContent;
  String? get fourthCounter => _fourthCounter;
  String? get fourthContent => _fourthContent;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['first_counter'] = _firstCounter;
    map['first_content'] = _firstContent;
    map['second_counter'] = _secondCounter;
    map['second_content'] = _secondContent;
    map['third_counter'] = _thirdCounter;
    map['third_content'] = _thirdContent;
    map['fourth_counter'] = _fourthCounter;
    map['fourth_content'] = _fourthContent;
    return map;
  }

}