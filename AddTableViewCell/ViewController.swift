//
//  ViewController.swift
//  AddTableViewCell
//
//  Created by ちいつんしん on 2021/03/05.
//

import UIKit
class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!

    var header = [String]()
    var row = [[String]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.isEditing = true

        header = (65...90).map{ String(Character(UnicodeScalar($0)!)) }
        header.append("others")

        for n in 0..<header.count {
            row.append([""])
        }
    }

    //Section数
    func numberOfSections(in tableView: UITableView) -> Int {
        return header.count
    }

    //    Header Title
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return header[section]
    }
    //
    //    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
    //        return "Footter"
    //    }

    //Section中のrowの数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return row[section].count
    }

    //cellの中身を規定
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        cell.textLabel?.text = row[indexPath.section][indexPath.row]
        return cell
    }

    //cellの削除
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        row.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)

    }

    //cellの移動
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let num = row[sourceIndexPath.section][sourceIndexPath.row]
        row[sourceIndexPath.section].remove(at: sourceIndexPath.row)
        row[destinationIndexPath.section].insert(num, at: destinationIndexPath.row)

    }

    //cellの追加
    @IBAction func insert(_ sender: Any) {


        let text = textField.text ?? ""
        let letter = text.prefix(1).uppercased()
        print(letter)

        if let firstIndex = header.firstIndex(of: letter){
            row[firstIndex].insert(text, at: row[firstIndex].endIndex)
            tableView.insertRows(at: [IndexPath(row: row[firstIndex].endIndex - 1, section: firstIndex)], with: .automatic)
        }else {
            row[row.endIndex - 1].insert(text, at: row[row.endIndex - 1].endIndex)
            tableView.insertRows(at: [IndexPath(row: row[row.endIndex - 1].endIndex - 1, section: row.endIndex - 1)], with: .automatic)
        }

        textField.text = ""

    }
}


