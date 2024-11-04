struct Creature {
    
    var name: String
    var description: String
    var isGood: Bool
    var magicPower: Int
    
    init(name: String, description: String, isGood: Bool, magicPower: Int) {
        self.name = name
        self.description = description
        self.isGood = isGood
        self.magicPower = magicPower
    }
    var ability: String {
        let fibonacciValue = fibonacciAbility(n: magicPower)
        return "\(name) has a special ability related to Fibonacci: \(fibonacciValue)"
    }
    func fibonacciAbility(n: Int) -> Int {
        guard n >= 0 else { return 0 }
                guard n > 1 else { return n }
                return fibonacciAbility(n: n - 1) + fibonacciAbility(n: n - 2)
    }
    func interactWith(other: Creature) -> String {
            switch (self.isGood, other.isGood) {
            case (true, true):
                return "\(self.name) and \(other.name) join forces for good!"
            case (true, false):
                return "\(self.name) tries to convince \(other.name) to be good."
            case (false, true):
                return "\(self.name) attempts to deceive \(other.name)."
            case (false, false):
                return "\(self.name) and \(other.name) plot mischief together!"
            }
        }
   
}
var theHobbit = Creature(name: "The Hobbit", description: "Short and hairy feet", isGood: true, magicPower: 2)
var thumbelina = Creature(name: "Thumbelina", description: "Small and cute", isGood: true, magicPower: 10)
var witch = Creature(name: "Witch", description: "Scary and mean", isGood: false, magicPower: 10)

var creatureCatalog: [Creature]  = [theHobbit, thumbelina, witch]

func describeCreature(creatures: [Creature]) {
    for creature in creatures {
        print("Name: \(creature.name)")
        print("Description: \(creature.description)")
        print("Special Ability: \(creature.ability)")
        
        // Interactions with each other
        for otherCreature in creatures {
            if creature.name != otherCreature.name {
                let interactionResult = creature.interactWith(other: otherCreature)
                print(interactionResult)
            }
        }
        
        print("---")
    }
}
describeCreature(creatures: creatureCatalog)
