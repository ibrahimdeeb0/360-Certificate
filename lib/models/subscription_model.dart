class SubscriptionModel {
  SubscriptionModel({
    required this.monthlyPlans,
    required this.yearlyPlans,
  });

  SubscriptionModel.fromJson(Map<String, dynamic> json) {
    monthlyPlans = List.from(json['monthly_plans'])
        .map((e) => MonthlyPlans.fromJson(e))
        .toList();
    yearlyPlans = List.from(json['yearly_plans'])
        .map((e) => YearlyPlans.fromJson(e))
        .toList();
  }

  late final List<MonthlyPlans> monthlyPlans;
  late final List<YearlyPlans> yearlyPlans;

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['monthly_plans'] = monthlyPlans.map((e) => e.toJson()).toList();
    _data['yearly_plans'] = yearlyPlans.map((e) => e.toJson()).toList();
    return _data;
  }
}

class MonthlyPlans {
  MonthlyPlans({
    required this.id,
    required this.name,
    required this.stripePlan,
    required this.price,
    required this.createdAt,
    required this.updatedAt,
    required this.interval,
    required this.features,
    this.description,
  });

  MonthlyPlans.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    stripePlan = json['stripe_plan'];
    price = json['price'];
    description = null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    interval = json['interval'];
    features =
        List.from(json['features']).map((e) => Features.fromJson(e)).toList();
  }

  late final int id;
  late final String name;
  late final String stripePlan;
  late final int price;
  late final String? description;
  late final String createdAt;
  late final String updatedAt;
  late final String interval;
  late final List<Features> features;

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['stripe_plan'] = stripePlan;
    _data['price'] = price;
    _data['description'] = description;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['interval'] = interval;
    _data['features'] = features.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Features {
  Features({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.pivot,
  });
  Features.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = Pivot.fromJson(json['pivot']);
  }

  late final int id;
  late final String name;
  late final String createdAt;
  late final String updatedAt;
  late final Pivot pivot;

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['pivot'] = pivot.toJson();
    return _data;
  }
}

class Pivot {
  Pivot({
    required this.planId,
    required this.featureId,
    this.maxAmount,
  });

  Pivot.fromJson(Map<String, dynamic> json) {
    planId = json['plan_id'];
    featureId = json['feature_id'];
    maxAmount = null;
  }

  late final int planId;
  late final int featureId;
  late final int? maxAmount;

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['plan_id'] = planId;
    _data['feature_id'] = featureId;
    _data['max_amount'] = maxAmount;
    return _data;
  }
}

class YearlyPlans {
  YearlyPlans({
    required this.id,
    required this.name,
    required this.stripePlan,
    required this.price,
    required this.createdAt,
    required this.updatedAt,
    required this.interval,
    required this.features,
    this.description,
  });
  late final int id;
  late final String name;
  late final String stripePlan;
  late final int price;
  late final Null description;
  late final String createdAt;
  late final String updatedAt;
  late final String interval;
  late final List<Features> features;

  YearlyPlans.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    stripePlan = json['stripe_plan'];
    price = json['price'];
    description = null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    interval = json['interval'];
    features =
        List.from(json['features']).map((e) => Features.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['stripe_plan'] = stripePlan;
    _data['price'] = price;
    _data['description'] = description;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['interval'] = interval;
    _data['features'] = features.map((e) => e.toJson()).toList();
    return _data;
  }
}
