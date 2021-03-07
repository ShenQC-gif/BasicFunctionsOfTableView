//
//  ViewController.swift
//  AddTableViewCell
//
//  Created by ちいつんしん on 2021/03/05.
//

import UIKit
class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    var array = [1,2,3,4,5]
    var ifHidden = [false,true,false,true,false]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.isEditing = true
        print(array.endIndex)
    }

    //Section中のrowの数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }

    //cellの中身を規定
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        cell.textLabel?.text = "\(array[indexPath.row])"
        cell.textLabel?.isHidden = ifHidden[indexPath.row]
        return cell
    }

    //cellの削除
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        array.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)

    }

    //cellの移動
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let num = array[sourceIndexPath.row]
        array.remove(at: sourceIndexPath.row)
        array.insert(num, at: destinationIndexPath.row)

    }

    //cellの追加
    @IBAction func insert(_ sender: Any) {
        array.insert(array.count + 1, at: array.endIndex)
        tableView.insertRows(at: [IndexPath(row: array.endIndex - 1, section: 0)], with: .right)
    }
}


