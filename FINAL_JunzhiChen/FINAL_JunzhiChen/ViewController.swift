//
//  TodosViewController.swift
//  FINAL_JunzhiChen
//
//  Created by Orange on 2022-12-15.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var todosLabel: UILabel!
    @IBOutlet var today: UILabel!
    
    @IBOutlet var table: UITableView!
    @IBOutlet var label: UILabel!

    var models: [(title: String, reminder: String)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        todosLabel.font = UIFont(name:"HelveticaNeue-Bold", size: 44.0)
        today.font = UIFont(name:"HelveticaNeue-Bold", size: 30.0)
        
        table.delegate = self
        table.dataSource = self
        title = ""
        view.backgroundColor = Theme.current.background

        self.navigationController?.navigationBar.isHidden=false

    }
    
    @IBAction func didTapNewReminder() {
        guard let vc = storyboard?.instantiateViewController(identifier: "new") as? EntryViewController else {
            return
        }
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.completion = { reminderTitle, reminder in
            self.navigationController?.popToRootViewController(animated: true)
            self.models.append((title: reminderTitle, reminder: reminder))

            self.label.isHidden = true
            self.table.isHidden = false

            self.table.reloadData()
        }
        navigationController?.pushViewController(vc, animated: true)
    }

    // Table

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = models[indexPath.row].title
//        cell.detailTextLabel?.text = models[indexPath.row].reminder
        cell.detailTextLabel?.text = ""

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let model = models[indexPath.row]

        // Show reminder controller
        guard let vc = storyboard?.instantiateViewController(identifier: "reminder") as? ReminderViewController else {
            return
        }
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.title = "Reminder"
        vc.reminderTitle = model.title
        vc.reminder = model.reminder
        navigationController?.pushViewController(vc, animated: true)
        self.navigationController?.navigationBar.isHidden=false

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        view.backgroundColor = Theme.current.background
        todosLabel.textColor = Theme.current.textColor

    }
    

}
