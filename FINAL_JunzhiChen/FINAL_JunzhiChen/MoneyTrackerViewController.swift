//
//  MoneyTrackerViewController.swift
//  FINAL_JunzhiChen
//
//  Created by Orange on 2022-12-15.
//

import UIKit

class MoneyTrackerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var moneyLabel: UILabel!
    @IBOutlet var movements: UIButton!
    @IBOutlet var showAll: UIButton!
    
    @IBOutlet var table: UITableView!
    @IBOutlet var label: UILabel!
    var models: [(title: String, amount: String)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        moneyLabel.font = UIFont(name:"HelveticaNeue-Bold", size: 44.0)
        
        movements?.layer.borderWidth = 1.0
        movements?.layer.cornerRadius = 10.0
        movements?.addConstraint((movements?.heightAnchor.constraint(equalToConstant: 40))!)
        showAll?.layer.borderWidth = 1.0
        showAll?.layer.cornerRadius = 5.0
        showAll?.layer.borderColor = UIColor.black.withAlphaComponent(0.25).cgColor
        
        table.delegate = self
        table.dataSource = self
        title = ""
        
        self.navigationController?.navigationBar.isHidden=false

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        moneyLabel.textColor = Theme.current.textColor
        view.backgroundColor = Theme.current.background

    }
    
    @IBAction func didTapNewAmount() {
        guard let vc = storyboard?.instantiateViewController(identifier: "new2") as? AmountViewController else {
            return
        }
        
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.completion = { amountTitle, amount in
            self.navigationController?.popViewController(animated: true)
            self.models.append((title: amountTitle, amount: amount))

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
        cell.detailTextLabel?.text = models[indexPath.row].amount

        return cell
    }

}
