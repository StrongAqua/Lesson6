import UIKit

// UIViewController, UITableViewDelegate, UITableViewDataSource
class ListViewController: UIViewController, ArtistsListViewInput {
    let tableView = UITableView(frame: .zero, style: .plain)
    
    var dataHandler: ArtistsTableDataHandler!
    var configurator: ArtistsListConfigurator!
    var presenter: ArtistsListViewOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataHandler = ArtistsTableDataHandler()
        configurator = ArtistsListConfigurator(self)
        presenter = configurator.presenter

        configureUI()
        presenter.viewIsReady()
    }

    func reload(_ viewModels: [ArtistsListViewModel]) {
        dataHandler.reload(viewModels)
    }
}

private extension ListViewController {
    func configureUI() {
        view.backgroundColor = .white
        title = "Artists"
        
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        constraintTableView()
    }
    
    func constraintTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}
