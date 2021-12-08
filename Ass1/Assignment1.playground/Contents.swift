import UIKit
enum invalidError: Error{
    case neg
    var msg:String{
        switch self {
        case .neg :return ("Given Value Is Negative")
        }
    }
}
func checkNo (num : Int) throws
{
    if(num < 0)
    {
        throw invalidError.neg
    }
    else
    {
        if(num%2==0){
            print(num ,"is Even")
        }else{
            print(num ,"is Odd")
        }
    }
}
do {
    try checkNo(num: 10)
} catch {
    if let error = error as? invalidError{
        print(error.msg)
    }
}
