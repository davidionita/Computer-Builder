import SpriteKit

public class ComputerScene: SKScene{
    
    var leftChoiceNode: SKSpriteNode = SKSpriteNode()
    var rightChoiceNode:SKSpriteNode = SKSpriteNode()
    var centerChoiceNode:SKSpriteNode = SKSpriteNode()
    
    var caseNode:  SKSpriteNode = SKSpriteNode()
    var motherboardNode:  SKSpriteNode = SKSpriteNode()
    var coolerNode:  SKSpriteNode = SKSpriteNode()
    var ramNode:  SKSpriteNode = SKSpriteNode()
    var cardNode:  SKSpriteNode = SKSpriteNode()
    
    var computerStep : ComputerBuildingSteps = ComputerBuildingSteps.Case
    
    var selectedItemIndex = 1 {
        didSet{
            updateChoiceNodes()
        }
    }
    
    enum ComputerBuildingSteps {
        case Case
        case Motherboard
        case Cooler
        case RAM
        case Card
    }
    
    public override func sceneDidLoad() {
        
        scene?.scaleMode = .aspectFit
        scene?.backgroundColor = .clear
        scene?.size = CGSize(width: 734, height: 840)
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        leftChoiceNode.size = CGSize(width: 200, height: 200)
        leftChoiceNode.position = CGPoint(x: -400 , y:0)
        leftChoiceNode.setScale(0.6)
        
        rightChoiceNode.size = CGSize(width: 200, height: 200)
        rightChoiceNode.position = CGPoint(x: 400, y:0)
        rightChoiceNode.setScale(0.6)
        
        centerChoiceNode.size = CGSize(width: 200, height: 200)
        centerChoiceNode.position = CGPoint(x: 0, y:414)
        centerChoiceNode.zPosition = 10
        
        scene?.addChild(leftChoiceNode)
        scene?.addChild(rightChoiceNode)
        scene?.addChild(centerChoiceNode)
        
        updateChoiceNodes()
        
        let centerShift = SKAction.move(to: CGPoint(x: 0, y: 0), duration: 0.75)
        centerChoiceNode.run(centerShift)
        let leftShift = SKAction.move(to: CGPoint(x: -200, y: 0), duration: 0.75)
        leftChoiceNode.run(leftShift)
        let rightShift = SKAction.move(to: CGPoint(x: 200, y: 0), duration: 0.75)
        rightChoiceNode.run(rightShift)
    }
    
    func updateChoiceNodes(){
        switch computerStep {
            case .Case:
                let newChoices = getImages(for: "Computer/Case/", here: selectedItemIndex)
                updateChoiceNodeImages(for: newChoices)
            case .Motherboard:
                let newChoices = getImages(for: "Computer/Motherboard/", here: selectedItemIndex)
                updateChoiceNodeImages(for: newChoices)
            case .Cooler:
                let newChoices = getImages(for: "Computer/Cooler/", here: selectedItemIndex)
                updateChoiceNodeImages(for: newChoices)
            case .RAM:
                let newChoices = getImages(for: "Computer/RAM/", here: selectedItemIndex)
                updateChoiceNodeImages(for: newChoices)
            case .Card:
                let newChoices = getImages(for: "Computer/Card/", here: selectedItemIndex)
                updateChoiceNodeImages(for: newChoices)
        }
    }
    
    func getImages(for type:String,here index:Int)->[String] {
        var left = ""
        var center = ""
        var right = ""
        
        let cases = ["510-black", "510-red", "510-white", "evolv-black", "evolv-white"]
        let motherboards = ["aorus", "code", "prime", "tomahawk"]
        let coolers = ["212", "x42"]
        let rams = ["lpx-black", "lpx-white", "rgb"]
        let cards = ["asus", "evga", "msi"]
        
        let leftIndex = index-1
        let rightIndex = index+1
        
        if type == "Computer/Case/" {
            if leftIndex >= 0 && leftIndex < cases.count {
                left = type + cases[leftIndex]
            }
            if rightIndex < cases.count{
                right = type + cases[rightIndex]
            }
            
            center = type + cases[index]
        }
        else if type == "Computer/Motherboard/" {
            if leftIndex >= 0 && leftIndex < motherboards.count {
                left = type + motherboards[leftIndex]
            }
            if rightIndex < motherboards.count{
                right = type + motherboards[rightIndex]
            }
            
            center = type + motherboards[index]
        }
        else if type == "Computer/Cooler/" {
            if leftIndex >= 0 && leftIndex < coolers.count {
                left = type + coolers[leftIndex]
            }
            if rightIndex < coolers.count{
                right = type + coolers[rightIndex]
            }
            
            center = type + coolers[index]
        }
        else if type == "Computer/RAM/" {
            if leftIndex >= 0 && leftIndex < rams.count {
                left = type + rams[leftIndex]
            }
            if rightIndex < rams.count{
                right = type + rams[rightIndex]
            }
            
            center = type + rams[index]
        }
        else if type == "Computer/Card/" {
            if leftIndex >= 0 && leftIndex < cards.count {
                left = type + cards[leftIndex]
            }
            if rightIndex < cards.count{
                right = type + cards[rightIndex]
            }
            
            center  = type + cards[index]
        }
        
        return [left, center, right]
    }
    
    
    func next() {
        switch computerStep {
            case .Case:
                copyNodeHere(node: caseNode)
                computerStep = .Motherboard
                updateChoiceNode(imageWidth: 200, imageHeight: 200, centerViewXPosition: -6, centerViewYPostion: 5)

            case .Motherboard:
                copyNodeHere(node: motherboardNode)
                computerStep = .Cooler
                updateChoiceNode(imageWidth: 200, imageHeight: 200, centerViewXPosition: -6, centerViewYPostion: 5)

            case .Cooler:
                copyNodeHere(node: coolerNode)
                computerStep = .RAM
                updateChoiceNode(imageWidth: 200, imageHeight: 200, centerViewXPosition: -6, centerViewYPostion: 5)

            case .RAM:
                copyNodeHere(node: ramNode)
                computerStep = .Card
                updateChoiceNode(imageWidth: 200, imageHeight: 200, centerViewXPosition: -6, centerViewYPostion: 5)

            case .Card:
                copyNodeHere(node: cardNode)

                leftChoiceNode.removeFromParent()
                centerChoiceNode.removeFromParent()
                rightChoiceNode.removeFromParent()
            
        }
        
        selectedItemIndex = 1
    }
    
    func copyNodeHere(node:SKSpriteNode){
        
        node.size = centerChoiceNode.size
        node.position = centerChoiceNode.position
        node.anchorPoint = centerChoiceNode.anchorPoint
        let texture = centerChoiceNode.texture
        node.texture = texture
        self.addChild(node)
        
    }
    
    func updateChoiceNode(imageWidth:Double,imageHeight:Double,centerViewXPosition:Double,centerViewYPostion:Double,anchorPointX:Double?=nil,anchorPointY:Double?=nil){
        
        leftChoiceNode.size = CGSize(width: imageWidth, height: imageHeight)
        
        centerChoiceNode.position = CGPoint(x: centerViewXPosition, y: centerViewYPostion)
        centerChoiceNode.size = CGSize(width: imageWidth, height: imageHeight)
        
        rightChoiceNode.size = CGSize(width: imageWidth, height: imageHeight)
        
        if anchorPointX != nil && anchorPointY != nil {
            
            centerChoiceNode.anchorPoint = CGPoint(x: anchorPointX!, y: anchorPointY!)
            leftChoiceNode.anchorPoint = CGPoint(x: anchorPointX!, y: anchorPointY!)
            rightChoiceNode.anchorPoint = CGPoint(x: anchorPointX!, y: anchorPointY!)
            
        }
    }

    
    func updateChoiceNodeImages(for choices:[String]){
        
        let leftImageName = choices[0]
        let centerImageName = choices[1]
        let rightImageName = choices[2]
        
        if !leftImageName.isEmpty{
            leftChoiceNode.isHidden = false
            leftChoiceNode.texture = SKTexture(imageNamed: leftImageName)
        }
        else{
            leftChoiceNode.isHidden = true
        }
        
        if !centerImageName.isEmpty{
            centerChoiceNode.isHidden = false
            centerChoiceNode.texture = SKTexture(imageNamed: centerImageName)
        }
        else{
            centerChoiceNode.isHidden = true
        }
        
        if !rightImageName.isEmpty{
            rightChoiceNode.isHidden = false
            rightChoiceNode.texture = SKTexture(imageNamed: rightImageName)
        }
        else{
            rightChoiceNode.isHidden = true
        }
    }
    
}

