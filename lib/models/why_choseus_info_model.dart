class WhyChoseusInfoModel {
  WhyChoseusInfoModel({
      List<WhyChooseUsTemplate>? whychooseustemplate, 
      List<WhyChooseUsContent>? whychooseuscontent,}){
    _whychooseustemplate = whychooseustemplate;
    _whychooseuscontent = whychooseuscontent;
}

  WhyChoseusInfoModel.fromJson(dynamic json) {
    if (json['why-choose-us-template'] != null) {
      _whychooseustemplate = [];
      json['why-choose-us-template'].forEach((v) {
        _whychooseustemplate?.add(WhyChooseUsTemplate.fromJson(v));
      });
    }
    if (json['why-choose-us-content'] != null) {
      _whychooseuscontent = [];
      json['why-choose-us-content'].forEach((v) {
        _whychooseuscontent?.add(WhyChooseUsContent.fromJson(v));
      });
    }
  }
  List<WhyChooseUsTemplate>? _whychooseustemplate;
  List<WhyChooseUsContent>? _whychooseuscontent;
WhyChoseusInfoModel copyWith({  List<WhyChooseUsTemplate>? whychooseustemplate,
  List<WhyChooseUsContent>? whychooseuscontent,
}) => WhyChoseusInfoModel(  whychooseustemplate: whychooseustemplate ?? _whychooseustemplate,
  whychooseuscontent: whychooseuscontent ?? _whychooseuscontent,
);
  List<WhyChooseUsTemplate>? get whychooseustemplate => _whychooseustemplate;
  List<WhyChooseUsContent>? get whychooseuscontent => _whychooseuscontent;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_whychooseustemplate != null) {
      map['why-choose-us-template'] = _whychooseustemplate?.map((v) => v.toJson()).toList();
    }
    if (_whychooseuscontent != null) {
      map['why-choose-us-content'] = _whychooseuscontent?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class WhyChooseUsContent {
  WhyChooseUsContent({
      num? id, 
      String? contentId,
      WhyChoseUsContentDescription? description,
      String? createdAt, 
      WhyChoseUsContent? content,}){
    _id = id;
    _contentId = contentId;
    _description = description;
    _createdAt = createdAt;
    _content = content;
}

  WhyChooseUsContent.fromJson(dynamic json) {
    _id = json['id'];
    _contentId = json['content_id'];
    _description = json['description'] != null ? WhyChoseUsContentDescription.fromJson(json['description']) : null;
    _createdAt = json['created_at'];
    _content = json['content'] != null ? WhyChoseUsContent.fromJson(json['content']) : null;
  }
  num? _id;
  String? _contentId;
  WhyChoseUsContentDescription? _description;
  String? _createdAt;
  WhyChoseUsContent? _content;
WhyChooseUsContent copyWith({  num? id,
  String? contentId,
  WhyChoseUsContentDescription? description,
  String? createdAt,
  WhyChoseUsContent? content,
}) => WhyChooseUsContent(  id: id ?? _id,
  contentId: contentId ?? _contentId,
  description: description ?? _description,
  createdAt: createdAt ?? _createdAt,
  content: content ?? _content,
);
  num? get id => _id;
  String? get contentId => _contentId;
  WhyChoseUsContentDescription? get description => _description;
  String? get createdAt => _createdAt;
  WhyChoseUsContent? get content => _content;

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

class WhyChoseUsContent {
  WhyChoseUsContent({
      num? id, 
      String? name, 
      WhyChoseUsContentMedia? contentMedia,}){
    _id = id;
    _name = name;
    _contentMedia = contentMedia;
}

  WhyChoseUsContent.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _contentMedia = json['content_media'] != null ? WhyChoseUsContentMedia.fromJson(json['content_media']) : null;
  }
  num? _id;
  String? _name;
  WhyChoseUsContentMedia? _contentMedia;
WhyChoseUsContent copyWith({  num? id,
  String? name,
  WhyChoseUsContentMedia? contentMedia,
}) => WhyChoseUsContent(  id: id ?? _id,
  name: name ?? _name,
  contentMedia: contentMedia ?? _contentMedia,
);
  num? get id => _id;
  String? get name => _name;
  WhyChoseUsContentMedia? get contentMedia => _contentMedia;

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

class WhyChoseUsContentMedia {
  WhyChoseUsContentMedia({
      String? contentId, 
      WhyChoseUsContentMediaDescription? description,}){
    _contentId = contentId;
    _description = description;
}

  WhyChoseUsContentMedia.fromJson(dynamic json) {
    _contentId = json['content_id'];
    _description = json['description'] != null ? WhyChoseUsContentMediaDescription.fromJson(json['description']) : null;
  }
  String? _contentId;
  WhyChoseUsContentMediaDescription? _description;
WhyChoseUsContentMedia copyWith({  String? contentId,
  WhyChoseUsContentMediaDescription? description,
}) => WhyChoseUsContentMedia(  contentId: contentId ?? _contentId,
  description: description ?? _description,
);
  String? get contentId => _contentId;
  WhyChoseUsContentMediaDescription? get description => _description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['content_id'] = _contentId;
    if (_description != null) {
      map['description'] = _description?.toJson();
    }
    return map;
  }

}

class WhyChoseUsContentMediaDescription {
  WhyChoseUsContentMediaDescription({
      String? image,}){
    _image = image;
}

  WhyChoseUsContentMediaDescription.fromJson(dynamic json) {
    _image = json['image'];
  }
  String? _image;
WhyChoseUsContentMediaDescription copyWith({  String? image,
}) => WhyChoseUsContentMediaDescription(  image: image ?? _image,
);
  String? get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['image'] = _image;
    return map;
  }

}

class WhyChoseUsContentDescription {
  WhyChoseUsContent1stDescription({
      String? title, 
      String? shortDescription,}){
    _title = title;
    _shortDescription = shortDescription;
}

  WhyChoseUsContentDescription.fromJson(dynamic json) {
    _title = json['title'];
    _shortDescription = json['short_description'];
  }
  String? _title;
  String? _shortDescription;
//   WhyChoseUsContentDescription copyWith({  String? title,
//   String? shortDescription,
// }) => WhyChoseUsContentDescription( title: title ?? _title,
//   shortDescription: shortDescription ?? _shortDescription,
// );
  String? get title => _title;
  String? get shortDescription => _shortDescription;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['short_description'] = _shortDescription;
    return map;
  }

}

class WhyChooseUsTemplate {
  WhyChooseUsTemplate({
      num? id, 
      String? languageId, 
      String? sectionName,
     WhoWeAreMainDescription? description,
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _languageId = languageId;
    _sectionName = sectionName;
    _description = description;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  WhyChooseUsTemplate.fromJson(dynamic json) {
    _id = json['id'];
    _languageId = json['language_id'];
    _sectionName = json['section_name'];
    _description = json['description'] != null ? WhoWeAreMainDescription.fromJson(json['description']) : null;
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _languageId;
  String? _sectionName;
  WhoWeAreMainDescription? _description;
  String? _createdAt;
  String? _updatedAt;
WhyChooseUsTemplate copyWith({  num? id,
  String? languageId,
  String? sectionName,
  WhoWeAreMainDescription? description,
  String? createdAt,
  String? updatedAt,
}) => WhyChooseUsTemplate(  id: id ?? _id,
  languageId: languageId ?? _languageId,
  sectionName: sectionName ?? _sectionName,
  description: description ?? _description,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  String? get languageId => _languageId;
  String? get sectionName => _sectionName;
  WhoWeAreMainDescription? get description => _description;
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

class WhoWeAreMainDescription {
  WhoWeAreMainDescription({
      String? title,}){
    _title = title;
}

  WhoWeAreMainDescription.fromJson(dynamic json) {
    _title = json['title'];
  }
  String? _title;
  WhoWeAreMainDescription copyWith({  String? title,
}) => WhoWeAreMainDescription(  title: title ?? _title,
);
  String? get title => _title;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    return map;
  }

}