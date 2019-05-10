//
//  AlarmViewController.swift
//  Clock
//
//  Created by LogicalWings Mac on 14/11/18.
//  Copyright © 2018 LogicalWings Mac. All rights reserved.
//

import UIKit

class AlarmViewController: UIViewController {

    @IBOutlet weak var alarmTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "alarmVcTitle".localized()
        
        alarmTableView.register(UINib(nibName: "AlarmsTableViewCell", bundle: nil), forCellReuseIdentifier: "alarmsTableViewCell")
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnAddAlarm(_ sender: UIButton) {
        
        
    }
}

extension AlarmViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = alarmTableView.dequeueReusableCell(withIdentifier: "alarmsTableViewCell", for: indexPath) as! AlarmsTableViewCell
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
