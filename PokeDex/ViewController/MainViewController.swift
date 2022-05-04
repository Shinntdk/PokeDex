//
//  ViewController.swift
//  PokeDex
//
//  Created by Natthida Kritveeranant on 3/5/2565 BE.
//

import UIKit

class MainViewController: UIViewController {
    private let tableView = UITableView()
    private var offset :Int?
//    let nameLabel = UILabel()
    private var pokemonList: [APIResult] = []
    private let tableViewLoadingCellNib = UINib(nibName: "LoadindCell", bundle: nil)

    override func viewDidLoad() {
        super.viewDidLoad()

        configuretionView()

        let anonymousFunction = { (fetchedAmiiboList: [APIResult]) in
            DispatchQueue.main.async {
                self.pokemonList = fetchedAmiiboList
                self.tableView.reloadData()
            }
        }

        PokeAPI.shared.fetchPokemonList(onCompletion: anonymousFunction)
    }

    private func configuretionView() {
        view.backgroundColor = .systemBackground

//        tableView.backgroundColor = .blue
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(tableViewLoadingCellNib, forCellReuseIdentifier: "tableViewLoadingCellNib")

        view.addSubview(tableView)

        // MARK: Layout
        tableView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate(
            [
                tableView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
                tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ]
        )
    }
}


// MARK: - Extension
extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let pokemon = pokemonList[indexPath.row]
        cell.textLabel?.text = pokemon.name
        return cell

    }
}
