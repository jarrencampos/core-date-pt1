//
//  EntryTableViewCell.swift
//  Journal
//
//  Created by Jarren Campos on 4/22/20.
//  Copyright © 2020 Jarren Campos. All rights reserved.
//

import UIKit

class EntryTableViewCell: UITableViewCell {

    
    @IBOutlet weak var entryTitleLabel: UILabel!
    @IBOutlet weak var entryBodyLabel: UILabel!
    @IBOutlet weak var entryDateLabel: UILabel!
    
    private func updateViews() {
        guard let entry = entry else { return }
        
        entryTitleLabel.text = entry.title
        entryBodyLabel.text = entry.bodyText
    }
    
    var entry: Entry? {
        didSet {
            updateViews()
        }
    }

}
