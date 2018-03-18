import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //Cell List
    let steamGamesOverOneHunHours = ["Rocket League", "Call of Duty: Modern Warfare 2", "Fallout 4", "Call of Duty: Modern Warfare 3 - Multiplayer", "Grand Theft Auto V", "Counter-Strike: Global Offensive", "Fallout: New Vegas", "Planet Coaster", "Call of Duty: Modern Warfare 3", "The Elder Scrolls V: Skyrim", "Terraria", "Call of Duty: Modern Warfare 2 - Multiplayer", "Sid Meier's Civilization V", "Dark Souls III", "Subnautica", "Dragon's Dogma: Dark Arisen", "PAYDAY 2", "Call of Duty: Black Ops - Multiplayer", "PLAYERUNKNOWN'S BATTLEGROUNDS", "Cities: Skylines", "Metal Gear Solid V: The Phantom Pain", "Team Fortress 2", "Blender (software)", "Shovel Knight: Treasure Trove", "Dark Souls II: Scholar of the First Sin"]
    
    //Return number of cells (from list)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return(steamGamesOverOneHunHours.count)
    }
    
    //Display cells in table view
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        //Display cell text
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = steamGamesOverOneHunHours[indexPath.row]
        
        //(depending on style chosen, with subtitles showing hours played)
        if (indexPath.row <= 1)
        {
            cell.detailTextLabel?.text = "1000+ hours played";
        }
        else if (indexPath.row <= 2) {
            cell.detailTextLabel?.text = "700+ hours played";
        }
        else if (indexPath.row <= 4) {
            cell.detailTextLabel?.text = "400+ hours played";
        }
        else if (indexPath.row <= 5) {
            cell.detailTextLabel?.text = "300+ hours played";
        }
        else if (indexPath.row <= 11) {
            cell.detailTextLabel?.text = "200+ hours played";
        }
        else {
            cell.detailTextLabel?.text = "100+ hours played";
        }
        
        //Indentation (each row level will indent that row level vale [row 1 = 1 indent])
        //cell.indentationLevel = indexPath.row
        //I didn't want to have these active though
        
        //Display image on the left side of cell text
        let image: UIImage = UIImage(named: "steam_black")!
        cell.imageView?.image = image
        
        //Display highlighted image when cell is active
        let highlightedImage: UIImage = UIImage(named: "steam")!
        cell.imageView?.highlightedImage = highlightedImage
        
        //Modify font size
        cell.textLabel?.font = UIFont .boldSystemFont(ofSize: 11)
        
        //Show cell
        return(cell)
    }
    
    //Row Selection
    
    //Disabling first row
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath?
    {
        if (indexPath.row == 0)
        {
            return nil;
        }
        else {
            return indexPath;
        }
    }
    
    //Alert for selected row
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let rowValue = self.steamGamesOverOneHunHours[indexPath.row]
        let rowMsg = "You selected " + rowValue
        let alert = UIAlertController(title: "Row Selected!", message: rowMsg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes I Did", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    //Modify cell height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 30;
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
