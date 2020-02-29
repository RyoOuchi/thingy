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
var localSearchCompletion: MKLocalSearchCompletion!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchCompleter.delegate = self as! MKLocalSearchCompleterDelegate
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
        print(completion)
        return cell
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//        let nextVC = segue.destination as! ViewController
//        let _ = nextVC.view
//        nextVC.label.text = sender as? String
//        nextVC.searchKey = sender as? String
//
//        nextVC.request = MKLocalSearch.Request(completer(sender as! MKLocalSearchCompletion, didFailWithError: nil)
//        request(completion: sender as! MKLocalSearchCompletion)
//
    
//    @IBAction func byPerformSegue(_ sender: Any) {
//        self.performSegue(withIdentifier: "toViewController", sender: nil)
//    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toViewController" {
            let nextVC = segue.destination as! ViewController
            nextVC.searchKey = textField.text
            nextVC.localSearchCompletion = localSearchCompletion
        }
        
    }

    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        localSearchCompletion = searchCompleter.results[indexPath.row]
        
        performSegue(withIdentifier: "toViewController", sender: nil)
    
    }


    
}

extension CellViewController: MKLocalSearchCompleterDelegate {
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        tableView.reloadData()
    }
    func completer(_ completer: MKLocalSearchCompleter, didFailWithError error: Error) {
    }
    
}




