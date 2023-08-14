enum FormStatus {
  create,
  update,
  complete,
  template,
}

enum FormDataStatus {
  newForm,
  newTemp,
  setTemp,
  editCert,
  editTemp,
}

enum FormDateType {
  recommendation,
  reportBy,
  inspectedBy,
}

enum TemplateStatus {
  newTemp,
  updateTemp,
  deleteTemp,
  defaultTemp,
}

enum CustomerType {
  individual,
  company,
}

enum CustomerContactType {
  landlord,
  agent,
}

enum CompanyContactType {
  director,
  agent,
  siteManager,
}

enum SiteContactType {
  agent,
  tenant,
  landlord,
  director,
  siteManager,
  financeManager,
}

enum SitePropertyType {
  flat,
  studio,
  house,
  office,
  warehouse,
  other,
}

enum FilterType {
  pending,
  inProgress,
  completed,
  canceled,
  all,
}

enum FormCertType { electrical, gas, electricalAndGas }

enum ImageFormatType {
  local,
  network,
}

enum AttachmentType { image, note }

enum DateType { date, time12Hr, time24Hr }
