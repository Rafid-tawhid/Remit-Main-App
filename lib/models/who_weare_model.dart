class WhoWeareModel {
  WhoWeareModel({
      List<WhoWeAreTemplate>? whowearetemplate, 
      List<WhoWeAreContent>? whowearecontent,}){
    _whowearetemplate = whowearetemplate;
    _whowearecontent = whowearecontent;
}

  WhoWeareModel.fromJson(dynamic json) {
    if (json['who-we-are-template'] != null) {
      _whowearetemplate = [];
      json['who-we-are-template'].forEach((v) {
        _whowearetemplate?.add(WhoWeAreTemplate.fromJson(v));
      });
    }
    if (json['who-we-are-content'] != null) {
      _whowearecontent = [];
      json['who-we-are-content'].forEach((v) {
        _whowearecontent?.add(WhoWeAreContent.fromJson(v));
      });
    }
  }
  List<WhoWeAreTemplate>? _whowearetemplate;
  List<WhoWeAreContent>? _whowearecontent;
WhoWeareModel copyWith({  List<WhoWeAreTemplate>? whowearetemplate,
  List<WhoWeAreContent>? whowearecontent,
}) => WhoWeareModel(  whowearetemplate: whowearetemplate ?? _whowearetemplate,
  whowearecontent: whowearecontent ?? _whowearecontent,
);
  List<WhoWeAreTemplate>? get whowearetemplate => _whowearetemplate;
  List<WhoWeAreContent>? get whowearecontent => _whowearecontent;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_whowearetemplate != null) {
      map['who-we-are-template'] = _whowearetemplate?.map((v) => v.toJson()).toList();
    }
    if (_whowearecontent != null) {
      map['who-we-are-content'] = _whowearecontent?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class WhoWeAreContent {
  WhoWeAreContent({
      num? id, 
      String? contentId,
      WhoWeAreContentMainDescription? description,
      String? createdAt, 
      WhoWeAreSubContent? content,}){
    _id = id;
    _contentId = contentId;
    _description = description;
    _createdAt = createdAt;
    _content = content;
}

  WhoWeAreContent.fromJson(dynamic json) {
    _id = json['id'];
    _contentId = json['content_id'];
    _description = json['description'] != null ? WhoWeAreContentMainDescription.fromJson(json['description']) : null;
    _createdAt = json['created_at'];
    _content = json['content'] != null ? WhoWeAreSubContent.fromJson(json['content']) : null;
  }
  num? _id;
  String? _contentId;
  WhoWeAreContentMainDescription? _description;
  String? _createdAt;
  WhoWeAreSubContent? _content;
WhoWeAreContent copyWith({  num? id,
  String? contentId,
  WhoWeAreContentMainDescription? description,
  String? createdAt,
  WhoWeAreSubContent? content,
}) => WhoWeAreContent(  id: id ?? _id,
  contentId: contentId ?? _contentId,
  description: description ?? _description,
  createdAt: createdAt ?? _createdAt,
  content: content ?? _content,
);
  num? get id => _id;
  String? get contentId => _contentId;
  WhoWeAreContentMainDescription? get description => _description;
  String? get createdAt => _createdAt;
  WhoWeAreSubContent? get content => _content;

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

class WhoWeAreSubContent {
  WhoWeAreSubContent({
      num? id, 
      String? name, 
      ContentMedia? contentMedia,}){
    _id = id;
    _name = name;
    _contentMedia = contentMedia;
}

  WhoWeAreSubContent.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _contentMedia = json['content_media'] != null ? ContentMedia.fromJson(json['content_media']) : null;
  }
  num? _id;
  String? _name;
  ContentMedia? _contentMedia;
WhoWeAreSubContent copyWith({  num? id,
  String? name,
  ContentMedia? contentMedia,
}) => WhoWeAreSubContent(  id: id ?? _id,
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
      WhoWeAreSubContentSubDescription? description,}){
    _contentId = contentId;
    _description = description;
}

  ContentMedia.fromJson(dynamic json) {
    _contentId = json['content_id'];
    _description = json['description'] != null ? WhoWeAreSubContentSubDescription.fromJson(json['description']) : null;
  }
  String? _contentId;
  WhoWeAreSubContentSubDescription? _description;
ContentMedia copyWith({  String? contentId,
  WhoWeAreSubContentSubDescription? description,
}) => ContentMedia(  contentId: contentId ?? _contentId,
  description: description ?? _description,
);
  String? get contentId => _contentId;
  WhoWeAreSubContentSubDescription? get description => _description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['content_id'] = _contentId;
    if (_description != null) {
      map['description'] = _description?.toJson();
    }
    return map;
  }

}

class WhoWeAreSubContentSubDescription {
  WhoWeAreSubContentSubDescription({
      String? image,}){
    _image = image;
}

  WhoWeAreSubContentSubDescription.fromJson(dynamic json) {
    _image = json['image'];
  }
  String? _image;
WhoWeAreSubContentSubDescription copyWith({  String? image,
}) => WhoWeAreSubContentSubDescription(  image: image ?? _image,
);
  String? get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['image'] = _image;
    return map;
  }

}

class WhoWeAreContentMainDescription {
  WhoWeAreContentMainDescription({
      String? title, 
      String? shortDescription,}){
    _title = title;
    _shortDescription = shortDescription;
}

  WhoWeAreContentMainDescription.fromJson(dynamic json) {
    _title = json['title'];
    _shortDescription = json['short_description'];
  }
  String? _title;
  String? _shortDescription;
  WhoWeAreContentMainDescription copyWith({  String? title,
  String? shortDescription,
}) => WhoWeAreContentMainDescription(  title: title ?? _title,
  shortDescription: shortDescription ?? _shortDescription,
);
  String? get title => _title;
  String? get shortDescription => _shortDescription;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['short_description'] = _shortDescription;
    return map;
  }

}

class WhoWeAreTemplate {
  WhoWeAreTemplate({
      num? id, 
      String? languageId, 
      String? sectionName,
      WhoWeAreTemplateDescription? description,
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _languageId = languageId;
    _sectionName = sectionName;
    _description = description;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  WhoWeAreTemplate.fromJson(dynamic json) {
    _id = json['id'];
    _languageId = json['language_id'];
    _sectionName = json['section_name'];
    _description = json['description'] != null ? WhoWeAreTemplateDescription.fromJson(json['description']) : null;
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _languageId;
  String? _sectionName;
  WhoWeAreTemplateDescription? _description;
  String? _createdAt;
  String? _updatedAt;
WhoWeAreTemplate copyWith({  num? id,
  String? languageId,
  String? sectionName,
  WhoWeAreTemplateDescription? description,
  String? createdAt,
  String? updatedAt,
}) => WhoWeAreTemplate(  id: id ?? _id,
  languageId: languageId ?? _languageId,
  sectionName: sectionName ?? _sectionName,
  description: description ?? _description,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  String? get languageId => _languageId;
  String? get sectionName => _sectionName;
  WhoWeAreTemplateDescription? get description => _description;
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

class WhoWeAreTemplateDescription {
  WhoWeAreTemplateDescription({
      String? title, 
      String? subTitle, 
      String? shortDescription,}){
    _title = title;
    _subTitle = subTitle;
    _shortDescription = shortDescription;
}

  WhoWeAreTemplateDescription.fromJson(dynamic json) {
    _title = json['title'];
    _subTitle = json['sub_title'];
    _shortDescription = json['short_description'];
  }
  String? _title;
  String? _subTitle;
  String? _shortDescription;
  WhoWeAreTemplateDescription copyWith({  String? title,
  String? subTitle,
  String? shortDescription,
}) => WhoWeAreTemplateDescription(  title: title ?? _title,
  subTitle: subTitle ?? _subTitle,
  shortDescription: shortDescription ?? _shortDescription,
);
  String? get title => _title;
  String? get subTitle => _subTitle;
  String? get shortDescription => _shortDescription;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['sub_title'] = _subTitle;
    map['short_description'] = _shortDescription;
    return map;
  }

}