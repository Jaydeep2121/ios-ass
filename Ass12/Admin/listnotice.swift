
import UIKit

class listnotice: UIViewController {
    private let myTable = UITableView()
    private let toolBar:UIToolbar = {
        let toolBar = UIToolbar()
        let item1 = UIBarButtonItem(barButtonSystemItem: .add, target:self, action: #selector(add_notice))
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.items = [space,item1,space]
        return toolBar
    }()
    private var notes = [Noticeb]()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(myTable)
        view.addSubview(toolBar)
        myTable.dataSource = self
        myTable.delegate = self
        myTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        toolBar.frame = CGRect(x: 0, y: 70, width: view.width, height: 40)
        myTable.frame = CGRect(x: 0,y: toolBar.bottom + 10, width: view.frame.size.width,
                               height: view.frame.size.height - view.safeAreaInsets.top - view.safeAreaInsets.bottom)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        notes = coredatahandler.shared.fetchnotice()
        myTable.reloadData()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
        myTable.reloadData()
        notes = coredatahandler.shared.fetchnotice()
        myTable.reloadData()
    }
    @objc func add_notice(){
        let sc = NoticeVC()
        navigationController?.pushViewController(sc, animated: true)
    }
    
}
extension listnotice: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let emp = notes[indexPath.row]
        cell.textLabel?.text = "\(emp.title!) \t | \t \(emp.data!) \t | \t \(emp.pdate!)  \t | \t \(emp.course!)"
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = NoticeVC()
        vc.S1 = notes[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let emp = notes[indexPath.row]
        coredatahandler.shared.deletenotice(emp: emp){
            self.notes.remove(at:indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
