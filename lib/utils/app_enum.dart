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
  landlord,
  director,
  agent,
  siteManager,
  financeManager,
}

// enum CompanySiteContactType {
//   landlord,
//   director,
//   agent,
//   siteManager,
//   financeManager,
// }

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

enum FormCertType {
  electrical,
  gas,
  electricalAndGas
}
