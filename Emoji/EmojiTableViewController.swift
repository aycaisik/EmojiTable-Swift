//
//  EmojiTableViewController.swift
//  Emoji
//
//  Created by Ayรงa Iลฤฑk on 8.01.2023.
//

import UIKit

class EmojiTableViewController: UITableViewController {
    
    
    // MARK: - Properties
    
      var emojis: [Emoji] = [
          Emoji(symbol: "๐", name: "Grinning Face",
                description: "A typical smiley face.", usage: "happiness"),
          Emoji(symbol: "๐", name: "Confused Face",
                description: "A confused, puzzled face.", usage: "unsure what to think; displeasure"),
          Emoji(symbol: "๐", name: "Heart Eyes",
                description: "A smiley face with hearts for eyes.",
                usage: "love of something; attractive"),
          Emoji(symbol: "๐ฎ", name: "Police Officer",
                description: "A police officer wearing a blue cap with a gold badge.",
                usage: "person of authority"),
          Emoji(symbol: "๐ข", name: "Turtle",
                description: "A cute turtle.",
                usage: "Something slow"),
          Emoji(symbol: "๐", name: "Elephant",
                description: "A gray elephant.",
                usage: "good memory"),
          Emoji(symbol: "๐", name: "Spaghetti",
                description: "A plate of spaghetti.",
                usage: "spaghetti"),
          Emoji(symbol: "๐ฒ", name: "Die",
                description: "A single die.",
                usage: "taking a risk, chance; game"),
          Emoji(symbol: "โบ๏ธ", name: "Tent",
                description: "A small tent.",
                usage: "camping"),
          Emoji(symbol: "๐", name: "Stack of Books",
                description: "Three colored books stacked on each other.",
                usage: "homework, studying"),
          Emoji(symbol: "๐", name: "Broken Heart",
                description: "A red, broken heart.",
                usage: "extreme sadness"),
          Emoji(symbol: "๐ค", name: "Snore",
                description: "Three blue \'z\'s.",
                usage: "tired, sleepiness"),
          Emoji(symbol: "๐", name: "Checkered Flag",
                description: "A black-and-white checkered flag.",
                usage: "completion") ,
          Emoji(symbol: "๐", name: "Wฤฑz Wฤฑz Bee",
                description: "A cute bee.",
                usage: "send valentine")
      ]
      
      // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
    
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        // 1 section varsa bu fonksiyonu yazmak zorunda deฤilsiniz.
        // รรผnkรผ: Varsayฤฑlan section sayฤฑsฤฑ zaten 1'dir.
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        // Her section iรงin 1 kez รงalฤฑลฤฑyor. รrneฤin, 4 section'a sahip bir tableView varsa,
        // Bu fonksiyon her section iรงin 1kez olmak รผzere toplam 4 kez รงalฤฑลacaktฤฑr.
        // Section parametresi o an รงizilmekte olan section bilgisini verir.
        return emojis.count //Elimizdeki emoji sayฤฑsฤฑ kadar hรผcre olmasฤฑ..
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Bir hรผcre, ne zamanki ekrana gelecek; cellForRow ile รงizilir.
        // Bu fonksiyonun kaรง kez รงalฤฑลacaฤฤฑ belli deฤildir.
            // รrnek 1: Kullanฤฑcฤฑ hiรง scrool etmez ise, ekranda gรถrรผnebilir olan hรผcre sayฤฑsฤฑ kadar รงalฤฑลฤฑr.
            // รrnek 2: Kullanฤฑcฤฑ scroll etmeye baลlarsa scroll ettiฤi sรผrece bu fonksiyon รงalฤฑลฤฑr.
             
        //IndexPath: O an รงizilmekte olan hรผcrenin konum bilgisi
        //Adฤฑm 1 : O an รงizilmekte olan emoji nesnesine indexPath deฤeri ile ulaลmak
        let emoji = emojis[indexPath.row]
        
        //Adฤฑm 2 : Hรผcre oluลturmak.
        //ReuseIdentifier: Storyboard'da hรผcre iรงin verdiฤiniz identifier deฤeri.
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmojiCell")!
        
        //Adฤฑm 3: Hรผcreyi data ile doldurmak.
        cell.textLabel?.text = "\(emoji.symbol)- \(emoji.name)" //Title
        cell.detailTextLabel?.text = "\(emoji.description)" //Subtitle
        
        return cell
        
    }
    
    //MARK: - Table View Delegete
    //Zorunlu deฤil bu fonksiyonlarฤฑ yazmak.
    //Hรผcreye tฤฑklandฤฑ bilgisi.
    //didselectrow yazsan yetiyor.
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Bu fonksiyon, kullanฤฑcฤฑ hรผcrenizi seรงtiฤi zaman(รผstรผne tฤฑkladฤฑฤฤฑ zaman)รงalฤฑลฤฑr.
        //indexPath'in row propertysini kullanarak รผstรผne tฤฑklanฤฑlan emojiye ulaลฤฑlฤฑr.
        let selectedEmoji = emojis[indexPath.row]
        print("\(selectedEmoji.symbol)\(indexPath)")
        
    }
    
    //MARK: - Actions
    
    //move row at yazdฤฑk รงฤฑktฤฑ.
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        //sourceIndexPath: sฤฑrasฤฑ deฤiลtirilmek istenen hรผcrenin konumu.
        //destinationIndexPath: gidilmesi istenen konum.(Parmak ekran kaldฤฑrฤฑlฤฑnca)
        
        //COK ONEMLI: "emojis" arrayin tableview hรผcre sฤฑrasฤฑyla aynฤฑ kalmasฤฑ gerekir.
        //Bu senkronu saฤlayabilmek iรงin hareket ettirilen objenin, arrayde de konumu deฤiลtirilir.
        //Adฤฑm 1: Hareket ettirilen emoji nesnesine ulaลmak ve arrayden silmek.
        let movedEmoji = emojis.remove(at: sourceIndexPath.row)
        //Adฤฑm 2: Silinen elemanฤฑ arrayde yeni yerine ekleriz.
        emojis.insert(movedEmoji, at: destinationIndexPath.row)
        //Adฤฑm 3: TableView gรผncellenen array sฤฑrasฤฑ ile tรผm elemanlarฤฑnฤฑ yeniden รงizicek.
        tableView.reloadData() 
        
    }
    
    @IBAction func editButtonTapped(_ button:UIBarButtonItem){
        
        //isEditing o an TableViewin edit modda olup olmadฤฑฤฤฑ bilgisini verir.
        let tableViewEditing = tableView.isEditing
        //TableViewin editing moda girmesini ve รงฤฑkmasฤฑnฤฑ saฤlar.
        tableView.setEditing(!tableViewEditing, animated: true)
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
