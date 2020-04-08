//
//  CampsViewController.swift
//  TravelWise
//
//  Created by Szymon Wereszczynski on 30/03/2020.
//  Copyright © 2020 Szymon Wereszczynski. All rights reserved.
//

import RxSwift

final class CampsViewController: BaseViewController {
    
    // MARK: - Constants
    
    private let tableView = UITableView()
    private let refreshControl = UIRefreshControl()

    private let viewModel: CampsViewModel
    
    // MARK: - VC's life cycle

    init(viewModel: CampsViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
         super.viewDidLoad()
         setupTableView()
         layout()
         bindViewModel()
     }
    
    // MARK: - Main
    
    override func setup() {
        [tableView].forEach { subview in
            subview
                |> disabledTranslatesAutoresizingMaskIntoConstraints
                |> view.addSubview
        }
    }
    
    private func setupTableView() {
        tableView.rowHeight = 62
        tableView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        tableView.separatorStyle = .singleLine
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = .red
        tableView.refreshControl = refreshControl
        tableView.rx.setDelegate(self).disposed(by: viewModel.bag)
//        tableView.register(cell: SearchAddressTableViewCell.self)
    }
    
    private func bindViewModel() {
        let input = CampsViewModel.Input(refreshTrigger: refreshControl.rx.controlEvent(.valueChanged).asObservable())

        let output = viewModel.transform(input: input)
        
//        output.stacks
//            .drive(tableView.rx.reusableItems(cellType: SearchAddressTableViewCell.self)) {  _, stack, cell in
//                cell.render(stack, dark: true)
//            }
//          .disposed(by: viewModel.bag)
        
//        output.error
//            .drive(rx.showError)
//            .disposed(by: viewModel.bag)
//
//        output.isLoading
//            .drive(loadingView.rx.showBottomLoadingBar)
//            .disposed(by: viewModel.bag)
        
        output.isLoading
            .filter { $0 == false }
            .drive(refreshControl.rx.isRefreshing)
            .disposed(by: viewModel.bag)
        
    }
    
    private func layout() {
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

extension CampsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
