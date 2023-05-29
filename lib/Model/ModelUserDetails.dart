class ModelGetUserDetails {
  dynamic statusCode;
  dynamic message;
  Data? data;

  ModelGetUserDetails(
      {this.statusCode, this.message, this.data});

  ModelGetUserDetails.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  dynamic sId;
  dynamic name;
  dynamic email;
  dynamic isEmailVerified;
  dynamic mobile;
  dynamic isMobileVerified;
  dynamic role;
  dynamic status;
  dynamic language;
  dynamic otp;
  dynamic gender;
  dynamic dob;
  dynamic address;
  dynamic locationType;
  dynamic location;
  dynamic emirateId;
  dynamic emirateIdExpire;
  dynamic slotNo;
  dynamic nationality;
  dynamic nativeLanguage;
  dynamic religion;
  dynamic idDocument;
  dynamic profilePic;
  dynamic deviceType;
  dynamic deviceVoip;
  dynamic parentId;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic isDeleted;
  dynamic country;
  dynamic designation;
  dynamic sector;
  dynamic alternativeMobile;
  dynamic state;
  dynamic maritalStatus;
  dynamic iV;
  dynamic deviceToken;
  List<SchoolStaff>? schoolStaff;
  dynamic familyMembers;
  dynamic profileCompletePercentage;
  dynamic profileCompleteDate;
  dynamic barcode;
  SchoolStaff? jobDetails;
  dynamic families;
  Statistics? statistics;

  Data(
      {this.sId, this.name, this.email, this.isEmailVerified, this.mobile, this.isMobileVerified, this.role, this.status, this.language, this.otp, this.gender, this.dob, this.address, this.locationType, this.location, this.emirateId, this.emirateIdExpire, this.slotNo, this.nationality, this.nativeLanguage, this.religion, this.idDocument, this.profilePic, this.deviceType, this.deviceVoip, this.parentId, this.createdAt, this.updatedAt, this.isDeleted, this.country, this.designation, this.sector, this.alternativeMobile, this.state, this.maritalStatus, this.iV, this.deviceToken, this.schoolStaff, this.familyMembers, this.profileCompletePercentage, this.profileCompleteDate, this.barcode, this.jobDetails, this.families, this.statistics});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    isEmailVerified = json['isEmailVerified'];
    mobile = json['mobile'];
    isMobileVerified = json['isMobileVerified'];
    role = json['role'];
    status = json['status'];
    language = json['language'];
    otp = json['otp'];
    gender = json['gender'];
    dob = json['dob'];
    address = json['address'];
    locationType = json['locationType'];
    location = json['location'];
    emirateId = json['emirateId'];
    emirateIdExpire = json['emirateIdExpire'];
    slotNo = json['slotNo'];
    nationality = json['nationality'];
    nativeLanguage = json['nativeLanguage'];
    religion = json['religion'];
    idDocument = json['idDocument'].cast<String>();
    profilePic = json['profilePic'];
    deviceType = json['deviceType'];
    deviceVoip = json['deviceVoip'];
    if (json['parentId'] != null) {
      parentId = <Null>[];
      json['parentId'].forEach((v) {
        // parentId!.add(new Null.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    isDeleted = json['isDeleted'];
    country = json['country'];
    designation = json['designation'];
    sector = json['sector'];
    alternativeMobile = json['alternativeMobile'];
    state = json['state'];
    maritalStatus = json['maritalStatus'];
    iV = json['__v'];
    deviceToken = json['deviceToken'];
    if (json['schoolStaff'] != null) {
      schoolStaff = <SchoolStaff>[];
      json['schoolStaff'].forEach((v) {
        schoolStaff!.add(new SchoolStaff.fromJson(v));
      });
    }
    if (json['familyMembers'] != null) {
      familyMembers = <Null>[];
      json['familyMembers'].forEach((v) {
        // familyMembers!.add(new Null.fromJson(v));
      });
    }
    profileCompletePercentage = json['profileCompletePercentage'];
    profileCompleteDate = json['profileCompleteDate'];
    barcode = json['barcode'];
    jobDetails = json['jobDetails'] != null
        ? new SchoolStaff.fromJson(json['jobDetails'])
        : null;
    if (json['families'] != null) {
      families = <Null>[];
      json['families'].forEach((v) {
        // families!.add(new Null.fromJson(v));
      });
    }
    statistics = json['statistics'] != null
        ? new Statistics.fromJson(json['statistics'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['isEmailVerified'] = this.isEmailVerified;
    data['mobile'] = this.mobile;
    data['isMobileVerified'] = this.isMobileVerified;
    data['role'] = this.role;
    data['status'] = this.status;
    data['language'] = this.language;
    data['otp'] = this.otp;
    data['gender'] = this.gender;
    data['dob'] = this.dob;
    data['address'] = this.address;
    data['locationType'] = this.locationType;
    data['location'] = this.location;
    data['emirateId'] = this.emirateId;
    data['emirateIdExpire'] = this.emirateIdExpire;
    data['slotNo'] = this.slotNo;
    data['nationality'] = this.nationality;
    data['nativeLanguage'] = this.nativeLanguage;
    data['religion'] = this.religion;
    data['idDocument'] = this.idDocument;
    data['profilePic'] = this.profilePic;
    data['deviceType'] = this.deviceType;
    data['deviceVoip'] = this.deviceVoip;
    if (this.parentId != null) {
      data['parentId'] = this.parentId!.map((v) => v.toJson()).toList();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['isDeleted'] = this.isDeleted;
    data['country'] = this.country;
    data['designation'] = this.designation;
    data['sector'] = this.sector;
    data['alternativeMobile'] = this.alternativeMobile;
    data['state'] = this.state;
    data['maritalStatus'] = this.maritalStatus;
    data['__v'] = this.iV;
    data['deviceToken'] = this.deviceToken;
    if (this.schoolStaff != null) {
      data['schoolStaff'] = this.schoolStaff!.map((v) => v.toJson()).toList();
    }
    if (this.familyMembers != null) {
      data['familyMembers'] =
          this.familyMembers!.map((v) => v.toJson()).toList();
    }
    data['profileCompletePercentage'] = this.profileCompletePercentage;
    data['profileCompleteDate'] = this.profileCompleteDate;
    data['barcode'] = this.barcode;
    if (this.jobDetails != null) {
      data['jobDetails'] = this.jobDetails!.toJson();
    }
    if (this.families != null) {
      data['families'] = this.families!.map((v) => v.toJson()).toList();
    }
    if (this.statistics != null) {
      data['statistics'] = this.statistics!.toJson();
    }
    return data;
  }
}

class SchoolStaff {
  dynamic sId;
  dynamic isDeleted;
  dynamic user;
  School? school;
  dynamic role;
  dynamic dateOfEmployment;
  dynamic createdBy;
  dynamic updatedBy;
  dynamic designation;
  dynamic classPerWeek;
  dynamic employeeId;
  dynamic employmentCertificate;
  dynamic jobCertificate;
  dynamic jobGrade;
  dynamic jobTitle;
  dynamic salaryCertificate;
  dynamic slotNumber;
  dynamic slotType;
  dynamic studentGender;
  dynamic titleGrade;
  dynamic weekDays;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic iV;

  SchoolStaff(
      {this.sId, this.isDeleted, this.user, this.school, this.role, this.dateOfEmployment, this.createdBy, this.updatedBy, this.designation, this.classPerWeek, this.employeeId, this.employmentCertificate, this.jobCertificate, this.jobGrade, this.jobTitle, this.salaryCertificate, this.slotNumber, this.slotType, this.studentGender, this.titleGrade, this.weekDays, this.createdAt, this.updatedAt, this.iV});

  SchoolStaff.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    isDeleted = json['isDeleted'];
    user = json['user'];
    school =
    json['school'] != null ? new School.fromJson(json['school']) : null;
    role = json['role'];
    dateOfEmployment = json['dateOfEmployment'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
    designation = json['designation'];
    classPerWeek = json['classPerWeek'];
    employeeId = json['employeeId'];
    employmentCertificate = json['employmentCertificate'];
    jobCertificate = json['jobCertificate'];
    jobGrade = json['jobGrade'];
    jobTitle = json['jobTitle'];
    salaryCertificate = json['salaryCertificate'];
    slotNumber = json['slotNumber'];
    slotType = json['slotType'];
    studentGender = json['studentGender'];
    titleGrade = json['titleGrade'];
    weekDays = json['weekDays'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['isDeleted'] = this.isDeleted;
    data['user'] = this.user;
    if (this.school != null) {
      data['school'] = this.school!.toJson();
    }
    data['role'] = this.role;
    data['dateOfEmployment'] = this.dateOfEmployment;
    data['createdBy'] = this.createdBy;
    data['updatedBy'] = this.updatedBy;
    data['designation'] = this.designation;
    data['classPerWeek'] = this.classPerWeek;
    data['employeeId'] = this.employeeId;
    data['employmentCertificate'] = this.employmentCertificate;
    data['jobCertificate'] = this.jobCertificate;
    data['jobGrade'] = this.jobGrade;
    data['jobTitle'] = this.jobTitle;
    data['salaryCertificate'] = this.salaryCertificate;
    data['slotNumber'] = this.slotNumber;
    data['slotType'] = this.slotType;
    data['studentGender'] = this.studentGender;
    data['titleGrade'] = this.titleGrade;
    data['weekDays'] = this.weekDays;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Staffsubjects {
  dynamic classes;
  dynamic classSection;

  Staffsubjects({this.classes, this.classSection});

  Staffsubjects.fromJson(Map<String, dynamic> json) {
  if (json['class'] != null) {
  classes = <Null>[];
  json['class'].forEach((v) {
    // classes!.add(new Null.fromJson(v) );
  });
  }
  if (json['classSection'] != null) {
  classSection = <Null>[];
  json['classSection'].forEach((v) {
    // classSection!.add(new Null.fromJson(v));
  });
  }
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  if (this.classes != null) {
  data['class'] = this.classes!.map((v) => v.toJson()).toList();
  }
  if (this.classSection != null) {
  data['classSection'] = this.classSection!.map((v) => v.toJson()).toList();
  }
  return data;
  }
}

class SchoolSector {
  dynamic sId;
  dynamic isDeleted;
  dynamic name;
  Location? location;
  dynamic status;
  dynamic createdBy;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic iV;
  dynamic updatedBy;

  SchoolSector(
      {this.sId, this.isDeleted, this.name, this.location, this.status, this.createdBy, this.createdAt, this.updatedAt, this.iV, this.updatedBy});

  SchoolSector.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    isDeleted = json['isDeleted'];
    name = json['name'];
    location =
    json['location'] != null ? new Location.fromJson(json['location']) : null;
    status = json['status'];
    createdBy = json['createdBy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    updatedBy = json['updatedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['isDeleted'] = this.isDeleted;
    data['name'] = this.name;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['status'] = this.status;
    data['createdBy'] = this.createdBy;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['updatedBy'] = this.updatedBy;
    return data;
  }
}

class Location {
  dynamic type;
  List<double>? coordinates;

  Location({this.type, this.coordinates});

  Location.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['coordinates'] = this.coordinates;
    return data;
  }
}

class SchoolType {
  dynamic sId;
  dynamic isDeleted;
  dynamic name;
  dynamic status;
  dynamic createdBy;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic iV;
  dynamic updatedBy;

  SchoolType(
      {this.sId, this.isDeleted, this.name, this.status, this.createdBy, this.createdAt, this.updatedAt, this.iV, this.updatedBy});

  SchoolType.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    isDeleted = json['isDeleted'];
    name = json['name'];
    status = json['status'];
    createdBy = json['createdBy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    updatedBy = json['updatedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['isDeleted'] = this.isDeleted;
    data['name'] = this.name;
    data['status'] = this.status;
    data['createdBy'] = this.createdBy;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['updatedBy'] = this.updatedBy;
    return data;
  }
}

class Statistics {
  dynamic pendingTask;
  dynamic unclosedComplaint;
  dynamic starsEvaluationPending;
  dynamic assignmentToReview;
  dynamic attendanceRecord;
  dynamic performance;
  dynamic linkedStars;
  dynamic allocatedSchools;
  dynamic totalClassesAttendedThisWeek;
  dynamic avgOfInteractingWithChatting;

  Statistics(
      {this.pendingTask, this.unclosedComplaint, this.starsEvaluationPending, this.assignmentToReview, this.attendanceRecord, this.performance, this.linkedStars, this.allocatedSchools, this.totalClassesAttendedThisWeek, this.avgOfInteractingWithChatting});

  Statistics.fromJson(Map<String, dynamic> json) {
    pendingTask = json['pendingTask'];
    unclosedComplaint = json['unclosedComplaint'];
    starsEvaluationPending = json['starsEvaluationPending'];
    assignmentToReview = json['assignmentToReview'];
    attendanceRecord = json['attendanceRecord'];
    performance = json['performance'];
    linkedStars = json['linkedStars'];
    allocatedSchools = json['allocatedSchools'];
    totalClassesAttendedThisWeek = json['totalClassesAttendedThisWeek'];
    avgOfInteractingWithChatting = json['avgOfInteractingWithChatting'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pendingTask'] = this.pendingTask;
    data['unclosedComplaint'] = this.unclosedComplaint;
    data['starsEvaluationPending'] = this.starsEvaluationPending;
    data['assignmentToReview'] = this.assignmentToReview;
    data['attendanceRecord'] = this.attendanceRecord;
    data['performance'] = this.performance;
    data['linkedStars'] = this.linkedStars;
    data['allocatedSchools'] = this.allocatedSchools;
    data['totalClassesAttendedThisWeek'] = this.totalClassesAttendedThisWeek;
    data['avgOfInteractingWithChatting'] = this.avgOfInteractingWithChatting;
    return data;
  }
}

class School {
Staffsubjects? staffsubjects;
dynamic sId;
dynamic isDeleted;
dynamic name;
SchoolSector? schoolSector;
SchoolSector? schoolArea;
dynamic address;
dynamic language;
dynamic schoolId;
dynamic helplineNo;
dynamic email;
dynamic secondoryEmail;
dynamic website;
dynamic mobile;
SchoolType? schoolType;
dynamic status;
dynamic createdBy;
dynamic createdAt;
dynamic updatedAt;
dynamic iV;

School({this.staffsubjects, this.sId, this.isDeleted, this.name, this.schoolSector, this.schoolArea, this.address, this.language, this.schoolId, this.helplineNo, this.email, this.secondoryEmail, this.website, this.mobile, this.schoolType, this.status, this.createdBy, this.createdAt, this.updatedAt, this.iV});

School.fromJson(Map<String, dynamic> json) {
staffsubjects = json['staffsubjects'] != null ? new Staffsubjects.fromJson(json['staffsubjects']) : null;
sId = json['_id'];
isDeleted = json['isDeleted'];
name = json['name'];
schoolSector = json['schoolSector'] != null ? new SchoolSector.fromJson(json['schoolSector']) : null;
schoolArea = json['schoolArea'] != null ? new SchoolSector.fromJson(json['schoolArea']) : null;
address = json['address'];
language = json['language'];
schoolId = json['schoolId'];
helplineNo = json['helplineNo'];
email = json['email'];
secondoryEmail = json['secondoryEmail'];
website = json['website'];
mobile = json['mobile'];
schoolType = json['schoolType'] != null ? new SchoolType.fromJson(json['schoolType']) : null;
status = json['status'];
createdBy = json['createdBy'];
createdAt = json['createdAt'];
updatedAt = json['updatedAt'];
iV = json['__v'];
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
if (this.staffsubjects != null) {
data['staffsubjects'] = this.staffsubjects!.toJson();
}
data['_id'] = this.sId;
data['isDeleted'] = this.isDeleted;
data['name'] = this.name;
if (this.schoolSector != null) {
data['schoolSector'] = this.schoolSector!.toJson();
}
if (this.schoolArea != null) {
data['schoolArea'] = this.schoolArea!.toJson();
}
data['address'] = this.address;
data['language'] = this.language;
data['schoolId'] = this.schoolId;
data['helplineNo'] = this.helplineNo;
data['email'] = this.email;
data['secondoryEmail'] = this.secondoryEmail;
data['website'] = this.website;
data['mobile'] = this.mobile;
if (this.schoolType != null) {
data['schoolType'] = this.schoolType!.toJson();
}
data['status'] = this.status;
data['createdBy'] = this.createdBy;
data['createdAt'] = this.createdAt;
data['updatedAt'] = this.updatedAt;
data['__v'] = this.iV;
return data;
}
}

