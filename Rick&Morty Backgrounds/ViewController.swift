//
//  ViewController.swift
//  Rick&Morty Backgrounds
//
//  Created by Anton Huisamen on 2018/06/25.
//  Copyright © 2018 antonsolo. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    // Your Actor Property
    var actor: Actor! {
        didSet {
            guard let actor = actor else { return }
            DispatchQueue.main.async {
                self.characterNameLabel.text = actor.name
                self.labelRightOne.text = actor.status
                self.labelRightTwo.text = actor.species
                self.labelRightThree.text = actor.gender
                self.labelRightFour.text = actor.origin.name
                self.labelRightFive.text = actor.location.name
            }

            if let url = URL(string: actor.image) {
                mainImageview.contentMode = .scaleAspectFill
                downloadImage(url: url)
            }
        }
    }
    
    let actorFetcher = ActorFetcher()
    

    
    var mainImageview: UIImageView = {
       var imageview = UIImageView()
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.clipsToBounds = true
        return imageview
    }()
    var labelLeftOne: UILabel = {
        var leftLabel = UILabel()
        leftLabel.backgroundColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
        leftLabel.text = "Status"
        leftLabel.textColor = UIColor(red: 159/255, green: 158/255, blue: 158/255, alpha: 1)
        return leftLabel
    }()
    var labelLeftTwo: UILabel = {
        var leftLabel = UILabel()
        leftLabel.backgroundColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
        leftLabel.text = "Species"
        leftLabel.textColor = UIColor(red: 159/255, green: 158/255, blue: 158/255, alpha: 1)
        return leftLabel
    }()
    var labelLeftThree: UILabel = {
        var leftLabel = UILabel()
        leftLabel.backgroundColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
        leftLabel.text = "Gender"
        leftLabel.textColor = UIColor(red: 159/255, green: 158/255, blue: 158/255, alpha: 1)
        return leftLabel
    }()
    var labelLeftFour: UILabel = {
        var leftLabel = UILabel()
        leftLabel.backgroundColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
        leftLabel.text = "Origin"
        leftLabel.textColor = UIColor(red: 159/255, green: 158/255, blue: 158/255, alpha: 1)
        return leftLabel
    }()
    var labelLeftFive: UILabel = {
        var leftLabel = UILabel()
        leftLabel.backgroundColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
        leftLabel.text = "LastLocation"
        leftLabel.textColor = UIColor(red: 159/255, green: 158/255, blue: 158/255, alpha: 1)
        return leftLabel
    }()
    var labelRightOne: UILabel = {
        var rightLabel = UILabel()
        rightLabel.backgroundColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
        rightLabel.textAlignment = .right
        rightLabel.text = "API"
        rightLabel.textColor = UIColor(red: 255/255, green: 150/255, blue: 0/255, alpha: 1)
        return rightLabel
    }()
    var labelRightTwo: UILabel = {
        var rightLabel = UILabel()
        rightLabel.backgroundColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
        rightLabel.textAlignment = .right
        rightLabel.text = "API"
        rightLabel.textColor = UIColor(red: 255/255, green: 150/255, blue: 0/255, alpha: 1)
        return rightLabel
    }()
    var labelRightThree: UILabel = {
        var rightLabel = UILabel()
        rightLabel.backgroundColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
        rightLabel.textAlignment = .right
        rightLabel.text = "API"
        rightLabel.textColor = UIColor(red: 255/255, green: 150/255, blue: 0/255, alpha: 1)
        return rightLabel
    }()
    var labelRightFour: UILabel = {
        var rightLabel = UILabel()
        rightLabel.backgroundColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
        rightLabel.textAlignment = .right
        rightLabel.text = "API"
        rightLabel.textColor = UIColor(red: 255/255, green: 150/255, blue: 0/255, alpha: 1)
        return rightLabel
    }()
    var labelRightFive: UILabel = {
        var rightLabel = UILabel()
        rightLabel.backgroundColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
        rightLabel.textAlignment = .right
        rightLabel.text = "API"
        rightLabel.textColor = UIColor(red: 255/255, green: 150/255, blue: 0/255, alpha: 1)
        rightLabel.numberOfLines = 2
        return rightLabel
    }()
    var mainStackView: UIStackView = {
        var stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = UILayoutConstraintAxis.vertical
        stackView.alignment = UIStackViewAlignment.fill
        stackView.distribution = UIStackViewDistribution.fillEqually
        stackView.spacing = 0
        return stackView
    }()
    var labelStackViewOne: UIStackView = {
        var stackViewOne = UIStackView()
        stackViewOne.translatesAutoresizingMaskIntoConstraints = false
        stackViewOne.distribution = UIStackViewDistribution.fillEqually
        stackViewOne.axis = UILayoutConstraintAxis.horizontal
        stackViewOne.alignment = UIStackViewAlignment.fill
        stackViewOne.spacing = 0
        return stackViewOne
    }()
    
    var labelStackViewTwo: UIStackView = {
        var stackViewTwo = UIStackView()
        stackViewTwo.translatesAutoresizingMaskIntoConstraints = false
        stackViewTwo.distribution = UIStackViewDistribution.fillEqually
        stackViewTwo.axis = UILayoutConstraintAxis.horizontal
        stackViewTwo.alignment = UIStackViewAlignment.fill
        stackViewTwo.spacing = 0
        return stackViewTwo
    }()
    var labelStackViewThree: UIStackView = {
        var stackViewThree = UIStackView()
        stackViewThree.translatesAutoresizingMaskIntoConstraints = false
        stackViewThree.distribution = UIStackViewDistribution.fillEqually
        stackViewThree.axis = UILayoutConstraintAxis.horizontal
        stackViewThree.alignment = UIStackViewAlignment.fill
        stackViewThree.spacing = 0
        return stackViewThree
    }()
    var labelStackViewFour: UIStackView = {
        var stackViewFour = UIStackView()
        stackViewFour.translatesAutoresizingMaskIntoConstraints = false
        stackViewFour.distribution = UIStackViewDistribution.fillEqually
        stackViewFour.axis = UILayoutConstraintAxis.horizontal
        stackViewFour.alignment = UIStackViewAlignment.fill
        stackViewFour.spacing = 0
        return stackViewFour
    }()
    
    var labelStackViewFive: UIStackView = {
        var stackViewFive = UIStackView()
        stackViewFive.translatesAutoresizingMaskIntoConstraints = false
        stackViewFive.distribution = UIStackViewDistribution.fillEqually
        stackViewFive.axis = UILayoutConstraintAxis.horizontal
        stackViewFive.alignment = UIStackViewAlignment.fill
        stackViewFive.spacing = 0
        return stackViewFive
    }()
    var characterNameLabel: UILabel{
        let cnLabel = UILabel()
        cnLabel.translatesAutoresizingMaskIntoConstraints = false
        cnLabel.backgroundColor = UIColor(white: 255/255, alpha: 0.1)
        cnLabel.textColor = .white
        cnLabel.font = UIFont.boldSystemFont(ofSize: 20)
        return cnLabel
    }
  
    
    let randumRollButton: UIButton = {
        let rollButton = UIButton(type: .system)
        let image = UIImage(named: "Roll the Dice")
        rollButton.translatesAutoresizingMaskIntoConstraints = false
        rollButton.setImage(image, for: UIControlState.normal)
        rollButton.setTitleColor(UIColor.gray, for: UIControlState.normal)
        rollButton.contentHorizontalAlignment = .center
        rollButton.imageView?.contentMode = UIViewContentMode.scaleAspectFit
        rollButton.tintColor = UIColor.white
        rollButton.backgroundColor = UIColor(red: 120/255, green: 125/255, blue: 20/255, alpha: 1)
        rollButton.layer.cornerRadius = 12
        return rollButton
    }()
 
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
        view.contentMode = .scaleToFill
        view.addSubview(mainImageview)
        view.addSubview(mainStackView)
        view.addSubview(randumRollButton)
        mainImageview.addSubview(characterNameLabel)
        mainImageViewConstraints()
        mainStackViewConstraints()
        randumRollButton.addTarget(self, action: #selector(fetch), for: UIControlEvents.touchUpInside)
        mainStackView.addArrangedSubview(labelStackViewOne)
        mainStackView.addArrangedSubview(labelStackViewTwo)
        mainStackView.addArrangedSubview(labelStackViewThree)
        mainStackView.addArrangedSubview(labelStackViewFour)
        mainStackView.addArrangedSubview(labelStackViewFive)
        labelStackViewOne.addArrangedSubview(labelLeftOne)
        labelStackViewOne.addArrangedSubview(labelRightOne)
        labelStackViewTwo.addArrangedSubview(labelLeftTwo)
        labelStackViewTwo.addArrangedSubview(labelRightTwo)
        labelStackViewThree.addArrangedSubview(labelLeftThree)
        labelStackViewThree.addArrangedSubview(labelRightThree)
        labelStackViewFour.addArrangedSubview(labelLeftFour)
        labelStackViewFour.addArrangedSubview(labelRightFour)
        labelStackViewFive.addArrangedSubview(labelLeftFive)
        labelStackViewFive.addArrangedSubview(labelRightFive)
        //characterNameLabelConstraints()
        randomRollButtonConstraints()
        fetch()
        
    }
    
    func mainImageViewConstraints(){
        mainImageview.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        mainImageview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        mainImageview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        mainImageview.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        mainImageview.backgroundColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)

    }
    
    func mainStackViewConstraints(){
        mainStackView.topAnchor.constraint(equalTo: mainImageview.bottomAnchor, constant: 0).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        
    }
    
    @objc func handleRollButtonTapped() -> URL {
        let diceRoll = Int(arc4random_uniform(6) + 1)
        return URL(string: "https://rickandmortyapi.com/api/character/\(diceRoll)")!

    }
    
    func randomRollButtonConstraints(){
        randumRollButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        randumRollButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100).isActive = true
        randumRollButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100).isActive = true
        randumRollButton.topAnchor.constraint(equalTo: mainStackView.bottomAnchor, constant: 0).isActive = true
    }
    func characterNameLabelConstraints(){
        characterNameLabel.bottomAnchor.constraint(equalTo: mainImageview.bottomAnchor).isActive = true
        characterNameLabel.leadingAnchor.constraint(equalTo: mainImageview.leadingAnchor).isActive = true
        characterNameLabel.trailingAnchor.constraint(equalTo: mainImageview.trailingAnchor).isActive = true
        characterNameLabel.heightAnchor.constraint(equalTo: mainImageview.heightAnchor, multiplier: 0.25).isActive = true
        
    }

    
    
    @objc func fetch(){
        print("fetched")
        actorFetcher.getActorInfo { (fetchedActor, error) in
            self.actor = fetchedActor
        }
    }

    func getDataFromUrl(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            completion(data, response, error)
            }.resume()
    }
    
    func downloadImage(url: URL) {
        print("Download Started")
        getDataFromUrl(url: url) { data, response, error in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished")
            DispatchQueue.main.async() {
                self.mainImageview.image = UIImage(data: data)
            }
        }
    }
    
    
}
