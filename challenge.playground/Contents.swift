import UIKit
import PlaygroundSupport
import AVFoundation

var player: AVAudioPlayer?

struct GlobalVars{
    static var timer: Timer = Timer()}

extension UILabel{
    func animatedWrite(write text: String){
        if GlobalVars.timer.isValid{
            GlobalVars.timer.invalidate()
        }
        self.text = ""
        var index = 0
        GlobalVars.timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: {(timer: Timer) in
            if index < text.count {
                self.text = (self.text ?? "") + String(text[text.index(text.startIndex,offsetBy: index)])
                index += 1
            }else{
                timer.invalidate()
            }
        })
    }
    
}

class MyViewController : UIViewController {
    var label = UILabel()
    var q1Button = UILabel()
    var q2Button = UILabel()
    var q3Button = UILabel()
    var currentQuestion = "start"
    var backgroundImage: UIImageView!
    var currentImage = "lab.jpeg"
    

    let questions = [
        "start": [
            "title": "1001, the inner part oh the country. You, an alchemist, are going to the town and has to choose the way:",
            
            "q1Text": "By the river",
            "q1Next": "q1",
            
            "q2Text": "By the pathway",
            "q2Next": "q2",
            
            "q3Text": "By the forest",
            "q3Next": "q3",
        ],
        "q1": [
            "title": "Long the river you meet a fisher how ask about the next hour weather. Taked a sort o barometer out, you tell him that from few hours will rain. The fisher thanks for the magic done.",
            
            "q1Text": "Not magic, just science.",
            "q1Next": "town",
            
            "q2Text": "It's a plesure!",
            "q2Next": "town",
            
            "q3Text": "Bye...",
            "q3Next": "town",
            
            "newImage": "river.jpg"
        ],
        "q2": [
            "title": "A merchant has problem about a rock that continue to hit to a sword and are near to destroy themselves. The rock is magnetite. You take a piece leather and put the rock in the leather, then you say to the merchant that the rock is attracted to metal an has to be taken in a wood box",
            
            "q1Text": "I's the power of magic!",
            "q1Next": "town",
            
            "q2Text": "It's the power of science!",
            "q2Next": "town",
            
            "q3Text": "You should pay me...",
            "q3Next": "town",
            
            "newImage": "merchant.jpg"
            
        ],
        "q3": [
            "title": "A hunter is bleeding and has an infected injury. You take some officinal herbs and some alcool and create a simple disinfectant.",
            
            "q1Text": "Good hunt!",
            "q1Next": "town",
            
            "q2Text": "Seriusly, it's a bad injury.",
            "q2Next": "town",
            
            "q3Text": "Don't die!",
            "q3Next": "town",
            
            "newImage": "forest2.jpg"
            
        ],
        
        "town": [
            "title": "You arrive in the town. Where you want to go now?",
            
            "q1Text": "To the pub",
            "q1Next": "q4",
            
            "q2Text": "To the herbalist",
            "q2Next": "q5",
            
            "q3Text": "To the market",
            "q3Next": "q6",
            
            "newImage": "medievalcity.jpg"
            
            
        ],
        
          "q4": [
                       "title": "You orders somethings and overheard that a person in the town is a magician and can cast flames. Arrived to the magician you realise that is a trap and get accused for witchcraft",
                       
                       "q1Text": "Oh no!",
                       "q1Next": "jail",
                       
                       "q2Text": "I'm just a person of science!",
                       "q2Next": "jail",
                       
                       "q3Text": "I'll burn you down!",
                       "q3Next": "jail",
                       
                       "newImage": "Tavern.jpg"
                       
                   ],
          
             "q5": [
                 "title": "You ask for some particular herbs and ingredients. The monk gives you the wrong herbs. You start to yell, the monk accuse you of witchcraft",
                 
                 "q1Text": "Oh no!",
                 "q1Next": "jail",
                 
                 "q2Text": "I'm just a person of science!",
                 "q2Next": "jail",
                 
                 "q3Text": "I'll burn you down!",
                 "q3Next": "jail",
                 
                 "newImage": "monk.jpg"
                 
                 
                 
             ],
             
             "q6": [
                 "title": "A child see your money bag and robs you. During the stealing a sort of firework start. You retake the bag, but two guard arrest you.",
                 
                 "q1Text": "Oh no!",
                 "q1Next": "jail",
            
                 "q2Text": "I'm just a person of science!",
                 "q2Next": "jail",
                 
                 "q3Text": "I'll burn you down!",
                 "q3Next": "jail",
                 
                 "newImage": "thief.jpg"
                 
             ],
             
             "jail": [
                 "title": "You're in prison! You need to go away!",
                 
                 "q1Text": "Use acid",
                 "q1Next": "q7",
                 
                 "q2Text": "Use explosive",
                 "q2Next": "q8",
                 
                 "q3Text": "Go to the judge",
                 "q3Next": "q9",
                 
                 "newImage": "jail.jpg"
                 
                 
                 
             ],
             
               "q7": [
                            "title": "Using you abilities you can craft an acid and you escape.",
                            
                            "q1Text": "YEEEEEEEEEEEEEEEEE!",
                            "q1Next": "end",
                            
                            "q2Text": "Thank you science!",
                            "q2Next": "end",
                            
                            "q3Text": "It's revange time...",
                            "q3Next": "end",
                            
                            "newImage": "greenpot.jpg"
                            
                        ],
               
                  "q8": [
                      "title": "Using you abilities you can craft an explosive and you escape.",
                      
                      "q1Text": "YEEEEEEEEEEEEEEEEE!",
                      "q1Next": "end",
                      
                      "q2Text": "Thank you science!",
                      "q2Next": "end",
                      
                      "q3Text": "It's revange time...",
                      "q3Next": "end",
                      
                      "newImage": "redpot.jpg"
                      
                  ],
                  
                  "q9": [
                      "title": "You try to convince the judge, but the hangman is ready for you",
                      
                      "q1Text": "Ehm...",
                      "q1Next": "end",
                 
                      "q2Text": "Ehm...",
                      "q2Next": "end",
                      
                      "q3Text": "Ehm...",
                      "q3Next": "end",
                      
                      "newImage": "boia.jpg"
                      
                  ],
             
                  
                  "end": [
                      "title": "THE END",
                      
                      "q1Text": "._.",
                      "q1Next": "end",
                      
                      "q2Text": "^.^",
                      "q2Next": "end",
                      
                      "q3Text": "restart",
                      "q3Next": "start",
                      
                      "newImage": "lab.jpeg"
                      
                  ],
                  
    ]
    
    @objc func clickQ1() {
        print("click 1")
        print(questions[currentQuestion]!["q1Next"] ?? "test")
        setUpNew(questions[currentQuestion]!["q1Next"]!)
    }
    
    @objc func clickQ2() {
        print("click 2")
        setUpNew(questions[currentQuestion]!["q2Next"]!)
    }
    
    @objc func clickQ3() {
        print("click 3")
        setUpNew(questions[currentQuestion]!["q3Next"]!)
    }
    
    func setUpNew(_ newQuestion: String) {
        let oldQuestion = currentQuestion
        currentQuestion = newQuestion
        
        let oldImage = currentImage
        let newImage = questions[currentQuestion]!["newImage"] ?? currentImage
        
        if (oldImage != newImage) {
            print("iamgeChange")
            currentImage = newImage
            backgroundImage.image = UIImage(named: currentImage)
        }
                
        print(oldQuestion, questions[currentQuestion]!)
        
        label.animatedWrite(write: questions[currentQuestion]!["title"]!)
        
//        label.text = questions[currentQuestion]!["title"]!
        q1Button.text = questions[currentQuestion]!["q1Text"]!
        q2Button.text = questions[currentQuestion]!["q2Text"]!
        q3Button.text = questions[currentQuestion]!["q3Text"]!
    }
    
    override func loadView() {
        playSound()
        let view = UIView()
        view.backgroundColor = .black

      
        
        label = UILabel()
        label.frame = CGRect(x: 10, y: 10, width: 355, height: 100)
        label.text = "Hello World!"
        label.textColor = .white
        label.backgroundColor = #colorLiteral(red: 0.2566586137, green: 0.2566586137, blue: 0.2566586137, alpha: 1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 100
        label.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.layer.borderWidth = 2
        label.layer.cornerRadius = 5
        label.layer.masksToBounds = true


        q1Button.frame = CGRect(x: 10, y: 517, width: 355, height: 41)
        q1Button.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        q1Button.layer.borderWidth = 2
        q1Button.layer.cornerRadius = 5
        q1Button.layer.masksToBounds = true
        q1Button.backgroundColor = #colorLiteral(red: 0.2566586137, green: 0.2566586137, blue: 0.2566586137, alpha: 1)
        q1Button.textColor = .white
        q1Button.lineBreakMode = .byWordWrapping
        q1Button.numberOfLines = 100
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(clickQ1))
        q1Button.isUserInteractionEnabled = true
        q1Button.addGestureRecognizer(tapGesture1)
        
        q2Button = UILabel()
        q2Button.frame = CGRect(x: 10, y: 567, width: 355, height: 41)
        q2Button.backgroundColor = #colorLiteral(red: 0.2566586137, green: 0.2566586137, blue: 0.2566586137, alpha: 1)
        q2Button.textColor = .white
        q2Button.lineBreakMode = .byWordWrapping
        q2Button.numberOfLines = 100
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(clickQ2))
        q2Button.isUserInteractionEnabled = true
        q2Button.addGestureRecognizer(tapGesture2)
        q2Button.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        q2Button.layer.borderWidth = 2
        q2Button.layer.cornerRadius = 5
        q2Button.layer.masksToBounds = true


        
        q3Button = UILabel()
        q3Button.frame = CGRect(x: 10, y: 617, width: 355, height: 41)
        q3Button.backgroundColor = #colorLiteral(red: 0.2566586137, green: 0.2566586137, blue: 0.2566586137, alpha: 1)
        q3Button.textColor = .white
        q3Button.lineBreakMode = .byWordWrapping
        q3Button.numberOfLines = 100
        let tapGesture3 = UITapGestureRecognizer(target: self, action: #selector(clickQ3))
        q3Button.isUserInteractionEnabled = true
        q3Button.addGestureRecognizer(tapGesture3)
        q3Button.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        q3Button.layer.borderWidth = 2
        q3Button.layer.cornerRadius = 5
        q3Button.layer.masksToBounds = true



        backgroundImage = UIImageView()
        backgroundImage.image = UIImage(named: currentImage)
        backgroundImage.frame = CGRect(x: 0, y: 0, width: 375, height: 667)
        view.addSubview(backgroundImage)

        view.addSubview(q1Button)
        view.addSubview(q2Button)
        view.addSubview(q3Button)
        view.addSubview(label)

        setUpNew("start")
            
        self.view = view
    }
    func playSound() {

        guard let url = Bundle.main.url(forResource: "videoplayback", withExtension: "mp4") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            /* iOS 10 and earlier require the following line:
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */

            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
    }


PlaygroundPage.current.liveView = MyViewController()
