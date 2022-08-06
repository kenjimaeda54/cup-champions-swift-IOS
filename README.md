# Cup champions
Aplicativo para consultar os campeoes de cada copa do mundo


## Feature
- Reforcei o uso  do table view
- Utilizei como table view controller e customizei também em uma view controller
- Com table view controller  posso os métodos delegate implementados, porem em uma view controller preciso implementar
- Para montar uma table view, existem métodos obrigatórios que precisam ser implementados
- Números de seções, números de linhas e a célula, restante  são opcionais
- No exemplo abaixo utilizei o recurso de seções.
- Separei por: fases de grupos, oitavas,semifinais e finais



```swift
//MARK: - UITableViewDelegate , UITableViewDataSource
extension WorldCupViewController:UITableViewDataSource {
	
	//numeros de secoes
	func numberOfSections(in tableView: UITableView) -> Int {
		return  worldCup?.matches.count ?? 1
	}
	
	//numberos de linhas dentro da secao
	//section
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		let numberRows = worldCup?.matches[section].games
		return numberRows?.count ?? 1
	}
	
  //titulo na secao
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		if let stage = worldCup?.matches[section].stage {
			return stage
		}
		return nil
	}
	
	
	//criando as celulas
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! GamesTableViewCell
		//pego os Match
		let match = worldCup?.matches[indexPath.section]
		//pego o game
		let game = match?.games[indexPath.row]
		if let haveGame = game {
			cell.formatCell(haveGame)
		}
		return cell
	}
	
}

```
