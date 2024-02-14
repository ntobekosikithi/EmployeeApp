//
//  ListOfEmployeesViewController.swift
//  EmployeeApp
//
//  Created by ns90840 on 2024/02/10.
//

import UIKit

class ListOfEmployeesViewController: UIViewController {
    

    @IBOutlet weak var employeesTableView: UITableView!
    
    private var employeesDatails: EmployeesDatailsResponse!
    private var selectedEmployee: Employee?
    private var setSelectedEmployee: ((Employee) -> Void)?
    private lazy var viewModel: ListOfEmployeesViewModel = {
        return ListOfEmployeesViewModel(view: self)
    }()
    
    private lazy var emptyStateView: EmptyStateView = {
        let view = EmptyStateView()
        return view
    }()
    
    private var currentPage: Int = 1
    private var currentPerPage: Int = 12
    
    init(selectedEmployee: Employee?, setSelectedEmployee: @escaping ((Employee) -> Void)) {
        self.selectedEmployee = selectedEmployee
        self.setSelectedEmployee = setSelectedEmployee
        super.init(nibName: String(describing: ListOfEmployeesViewController.self), bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = .localized(.listOfEmployeesScreenTitle)
        viewModel.getEmployees(page: "\(currentPage)",
                               perPage: "\(currentPerPage)")
        configureTableView()
    }
    
    func configureTableView() {
        employeesTableView.delegate = self
        employeesTableView.dataSource = self
        employeesTableView.register(EmloyeeTableViewCell.self)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height

        if offsetY > contentHeight - height {
            guard let employeesDatails = employeesDatails else { return }
            if currentPage <= employeesDatails.totalPages {
                viewModel.getEmployees(page: "\(currentPage + 1 )",
                                       perPage: "\(currentPerPage)")
            }
        }
    }
}

// MARK: - UITableViewDataSource and UITableViewDelegate
extension ListOfEmployeesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let employeesDatails = employeesDatails else { return 0}
        return employeesDatails.employees.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as EmloyeeTableViewCell
        let employee = employeesDatails.employees[indexPath.row]
        cell.configure(employee: employee, selectedId: selectedEmployee?.id)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let employee = employeesDatails.employees[indexPath.row]
        setSelectedEmployee?(employee)
        self.navigationController?.popViewController(animated: true)
    }
}

// MARK: - ListOfEmployeesView delegate functions
extension ListOfEmployeesViewController: ListOfEmployeesView {
    func showLoadingIndicator() {
        showActivityIndicatory()
    }
    
    func hideLoadingIndicator() {
        hideActivityIndicatory()
    }
    
    func displayEmployees(employees: EmployeesDatailsResponse) {
        if self.employeesDatails != nil {
            self.employeesDatails.employees.append(contentsOf: employees.employees)
        }else{
            self.employeesDatails = employees
        }
        self.currentPage = employees.page
        self.employeesTableView.reloadData()
    }
    
    func displayEmptyView() {
        employeesTableView.backgroundView = emptyStateView
        employeesTableView.separatorStyle = .none
    }
    
    func displayErrorMessage(message: String) {
        ErrorDisplayHelper.showError(message: message)
    }
}
