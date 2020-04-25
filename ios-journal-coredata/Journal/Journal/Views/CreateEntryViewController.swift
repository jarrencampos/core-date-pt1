//
//  ViewController.swift
//  Journal
//
//  Created by Jarren Campos on 4/22/20.
//  Copyright © 2020 Jarren Campos. All rights reserved.
//

import UIKit

class CreateEntryViewController: UIViewController {
    
    var entryController: EntryController?
    
    @IBOutlet weak var entryTitleTextField: UITextField!
    @IBOutlet weak var entryTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    @IBAction func save(_ sender: UIBarButtonItem) {
        
        guard let title = entryTitleTextField.text,
            let bodyText = entryTextView.text else { return }
        
        if let entry = entry {
            entryController?.update(entry: entry, title: title, bodyText: bodyText)
        } else {
            entryController?.createEntry(with: title, bodyText: bodyText)
        }
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    private func updateViews() {
        guard let entry = entry,
            isViewLoaded else {
                title = "Create Entry"
                return
        }
        
        title = entry.title
        entryTitleTextField.text = entry.title
        entryTextView.text = entry.bodyText
    }
    
    var entry: Entry? {
        didSet {
            updateViews()
        }
    }
}


