//
//  ViewController.swift
//  Books That Come to Life!
//
//  Created by Dara Klein on 7/21/18.
//  Copyright © 2018 Dara Klein. All rights reserved.
//

import UIKit
import CoreData

class BooklistVC: UITableViewController {
    
    var booksArray = [Books]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
     print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
//MARK: - Data Manipulation Methods
   func saveBookData() {
    
    do {
     try context.save()
        print("Saved")
    } catch {
    print("Error Saving to context \(error)")
    
    }
        tableView.reloadData()
    }
    
    func loadBookData() {
        
    }
    
// MARK: - TableView Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return booksArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookCell", for: indexPath)
        
        cell.textLabel?.text = booksArray[indexPath.row].title
        
        return cell
    }
    
    
//MARK: - TableView Delegate Methods
    


//TODO: - Add Extension
    
//MARK: - Searchbar Delegate Methods

//MARK: - Query dataBase
    
//MARK: - @IBActions
//MARK: - Add New Book
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add a new Book", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Book", style: .default) { (action) in
            //what happens once Add Button is Pressed
            let newBook = Books(context: self.context)
            newBook.title = textField.text!
            self.booksArray.append(newBook)
            print(newBook)
            saveBookData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Add a Book"
            textField = alertTextField
        }
        alert.addAction(action)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(alert, animated: true, completion: nil)
        }

    }
    


