//
//  ViewController.swift
//  lista_tarefas
//
//  Created by user211178 on 1/31/22.
//

import UIKit

class TableViewController: UITableViewController {
    // array com tarefas
    var tarefas = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // chamar a userDefaults quando iniciar o app
        tarefas = UserDefaults.standard.stringArray(forKey: "tarefas") ?? []
    }
    //botao adicionar
    @IBAction func tapAddBtn(_ sender: Any) {
        //alerta com textfield para adicionar tarefa
        let alert = UIAlertController(title: "Nova Tarefa", message: "Insira uma nova tarefa", preferredStyle: .alert)
        
        alert.addTextField{
            tfield in
            tfield.placeholder = "Insira aqui..."
        }
        
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        
        alert.addAction(UIAlertAction(title: "Pronto", style: .default, handler: { _ in
            //desembrulhar texto, adicionar linha e userdefaults
            if let tfield = alert.textFields?.first{
                if let text = tfield.text, !text.isEmpty{
                    self.tarefas.append(text)
                    
                    self.tableView.insertRows(at: [IndexPath(row: self.tarefas.count-1, section: 0)], with: .automatic)
                    
                    UserDefaults.standard.setValue(self.tarefas, forKey: "tarefas")
                }
            }
        }))
        
        present(alert, animated: true, completion: nil)
    }
    //contador de linhas
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tarefas.count
    }
    
    // criar célula
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = tarefas[indexPath.row]
        
        return cell
    }
    // selecção de célula e checkmark
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let cell = tableView.cellForRow(at: indexPath) else {return}
        
        if cell.accessoryType == .none{
            cell.accessoryType = .checkmark
        }else{
            cell.accessoryType = .none
        }
    }
    
    //arrastar para apagar
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let contextualAction = UIContextualAction(style: .destructive, title: "Remover") { (action, view, true) in
            self.tarefas.remove(at: indexPath.row)
            
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            
            UserDefaults.standard.setValue(self.tarefas, forKey: "tarefas")
        }
        let actions = UISwipeActionsConfiguration(actions: [contextualAction])
        
        return actions
    }
    
}

