//
//  SelectPreferredColorViewController.swift
//  EmployeeApp
//
//  Created by ns90840 on 2024/02/10.
//

import UIKit

class SelectPreferredColorViewController: UIViewController {

    @IBOutlet weak var selectColorTableView: UITableView!
    
    private var preferredColors: ColorsDetailsRepsonse!
    private var selectedColorCallBack: ((Color) -> Void)?
    private var selectedColor: Color?
    private var perPage: Int = 12
    private lazy var viewModel: SelectPreferredColorViewModel = {
        return SelectPreferredColorViewModel(view: self)
    }()
    private lazy var emptyStateView: EmptyStateView = {
        let view = EmptyStateView()
        return view
    }()
    
    init(selectedColor: Color?, selectedColorCallBack: @escaping ((Color) -> Void)) {
        self.selectedColorCallBack = selectedColorCallBack
        self.selectedColor = selectedColor
        super.init(nibName: String(describing: SelectPreferredColorViewController.self), bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getPreferredColors(perPage: "\(perPage)")
        configureView()
    }
    
    func configureView() {
        title = .localized(.choosePreferredColorScreenTitle)
        selectColorTableView.delegate = self
        selectColorTableView.dataSource = self
        selectColorTableView.register(SelectPreferredColorTableViewCell.self)
    }

}

// MARK: - UITableViewDataSource and UITableViewDelegate
extension SelectPreferredColorViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let preferredColors = preferredColors else { return 0 }
        return preferredColors.colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as SelectPreferredColorTableViewCell
        let color = preferredColors.colors[indexPath.row]
        cell.configure(color: color, selectedId: selectedColor?.id)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let color = preferredColors.colors[indexPath.row]
        selectedColorCallBack?(color)
        self.navigationController?.popViewController(animated: true)
    }
}

// MARK: - SelectPreferredColorView delegate function
extension SelectPreferredColorViewController: SelectPreferredColorView {
    func showLoadingIndicator() {
        showActivityIndicatory()
    }
    
    func hideLoadingIndicator() {
        hideActivityIndicatory()
    }
    
    func displayColors(colors: ColorsDetailsRepsonse) {
        preferredColors = colors
        selectColorTableView.reloadData()
    }
    
    func displayEmptyView() {
        selectColorTableView.backgroundView = emptyStateView
        selectColorTableView.separatorStyle = .none
    }
    
    func displayErrorMessage(message: String) {
        ErrorDisplayHelper.showError(message: message)
    }
}
