//
//  ChatGPTViewController.swift
//  MageApp
//
//  Created by TuanIOS_SU12 on 21/12/2022.
//

import UIKit
import OpenAISwift

class ChatGPTViewController: UIViewController {
    private var client:OpenAISwift?
    
    func setUpChatGPT() {
        client = OpenAISwift(authToken:"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")
    }
    
    func sendRequest(text:String , completion:@escaping (String) -> (Void)) {
        client?.sendCompletion(with: text,
                               maxTokens: 500,
                               completionHandler: { result in
            switch result {
            case .success(let model):
                let output = model.choices.first?.text ?? ""
                completion(output)
            case .failure(_):
                break
            }
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self .setUpChatGPT()
        self .sendRequest(text: "cách nuôi tinh thể") { string in
            print(string)
        }
        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
