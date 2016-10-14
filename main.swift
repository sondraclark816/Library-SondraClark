//
//  main.swift
//  Library
//
//  Created by Sondra Clark on 10/12/16.
//  Copyright © 2016 Sondra Clark. All rights reserved.
//

import Foundation

print("Welcome To Sondra's Library! \n\nType 'Help' at any time to see a list of our menu options.")
print("\n** If you choose to Check Out a book, they will be due back seven (7) days from Check Out date. **")


let inventory = Inventory()

inventory.takeCommands()


inventory.quit()



exit(EXIT_SUCCESS)


