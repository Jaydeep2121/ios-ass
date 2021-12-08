import UIKit

enum ValidationError:Error{
    case toshort
    case toolong
    case invalidCharacterFound(Character)
}
func validate(username:String) throws{
    guard username.count>3 else{
        throw ValidationError.toshort
    }
    guard username.count<15 else{
        throw ValidationError.toolong
    }
    for character in username{
        guard character.isLetter else{
            throw ValidationError.invalidCharacterFound(character)
        }
    }
}
func userDidPickname(_username:String){
    do{
        //print(_username)
        try validate(username: _username)
    }catch{
        print("error")
    }
}
extension ValidationError:LocalizedError{
    var errorDescription: String?{
        switch self {
            case .toshort:
                return NSLocalizedString("username too short", comment:"")
            case .toolong:
                return NSLocalizedString("username too long", comment: "")
        case .invalidCharacterFound(let character):
                let format = NSLocalizedString("invalid character", comment: "")
                return String(format:format,String(character))
        }
    }
}
userDidPickname(_username:"as")
