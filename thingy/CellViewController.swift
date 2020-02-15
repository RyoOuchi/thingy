//
//  CellViewController.swift
//  thingy
//
//  Created by Ryo on 2020/02/15.
//  Copyright © 2020 Ryo. All rights reserved.
//

import UIKit
import MapKit

class CellViewController: UIViewController {
    
private var searchCompleter = MKLocalSearchCompleter()
@IBOutlet private weak var tableView: UITableView!
@IBOutlet private weak var textField: UITextField!
     
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchCompleter.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
    }

    @IBAction private func textFieldEditingChanged(_ sender: Any) {
        searchCompleter.queryFragment = textField.text!
    }
    
    

}
     

extension CellViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchCompleter.results.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let completion = searchCompleter.results[indexPath.row]
        cell.textLabel?.text = completion.title
        cell.detailTextLabel?.text = completion.subtitle
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        let nextVC = segue.destination as! ViewController
        let _ = nextVC.view // ラベルのインスタンス作成のため…ダサいw 他にいい手はないのか.

        nextVC.label.text = sender as? String
        nextVC.searchKey = sender as? String
    }
    
    /// セル選択時（UITableViewDataSource optional）
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        // 次の画面へ移動
        performSegue(withIdentifier: "next", sender: searchCompleter.results[indexPath.row])
    }


    
}

extension CellViewController: MKLocalSearchCompleterDelegate {
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        tableView.reloadData()
    }
    func completer(_ completer: MKLocalSearchCompleter, didFailWithError error: Error) {
    }
    
}



