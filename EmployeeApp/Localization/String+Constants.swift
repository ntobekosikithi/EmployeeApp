//
//  String+Constants.swift
//  EmployeeApp
//
//  Created by ns90840 on 2024/02/11.
//

import Foundation

extension Localizable {
    
    //Common
    static let commonNextButtonTitle = Localizable(NSLocalizedString("common.next.button.title", comment: ""))
    static let commonSuccessfulViewTitle = Localizable(NSLocalizedString("common.successful.view.title", comment: ""))
    static let commonDoneButtonTitle = Localizable(NSLocalizedString("common.done.button.title", comment: ""))
    static let commonLoginButtonTitle = Localizable(NSLocalizedString("common.login.button.title", comment: ""))

    //Screen titles
    static let employeeDetailsScreenTitle = Localizable(NSLocalizedString("employee.details.screen.title", comment: ""))
    static let listOfEmployeesScreenTitle = Localizable(NSLocalizedString("list.of.employees.screen.title", comment: ""))
    static let additionalInfoScreenTitle = Localizable(NSLocalizedString("additional.info.screen.title", comment: ""))
    static let reviewScreenTitle = Localizable(NSLocalizedString("review.screen.title", comment: ""))
    static let choosePreferredColorScreenTitle = Localizable(NSLocalizedString("choose.preferred.color.screen.title", comment: ""))
    
    //error messages
    static let enterValidEmailAddress = Localizable(NSLocalizedString("enter.valid.email.address.message", comment: ""))
    static let emailIsRequired = Localizable(NSLocalizedString("email.required.message", comment: ""))
    static let passwordIsRequired = Localizable(NSLocalizedString("password.required.message", comment: ""))
    static let passwordIsTooShort = Localizable(NSLocalizedString("password.too.short.message", comment: ""))
    static let dateOfBirthRequired = Localizable(NSLocalizedString("date.of.birth.required.message", comment: ""))
    static let enterValidDate = Localizable(NSLocalizedString("enter.valid.date.message", comment: ""))
    static let placeOfBirthRequired = Localizable(NSLocalizedString("place.of.birth.required.message", comment: ""))
    static let enterValidResidentialAddress = Localizable(NSLocalizedString("enter.valid.residential.address", comment: ""))
    static let failedToSaveToken = Localizable(NSLocalizedString("failed.to.save.token", comment: ""))
    
    //Custom message view
    static let updateEmployeeSuccessfulViewDescription = Localizable(NSLocalizedString("update.employee.successful.view.description", comment: ""))
    
}
