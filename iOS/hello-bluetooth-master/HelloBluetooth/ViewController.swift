import UIKit

class ViewController: UIViewController {
    var simpleBluetoothIO: SimpleBluetoothIO!

    @IBOutlet weak var pinTextField: UITextField!
    @IBOutlet weak var pinEnterButton: UIButton!
    @IBOutlet weak var ledToggleButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        simpleBluetoothIO = SimpleBluetoothIO(serviceUUID: "19B10010-E8F2-537E-4F6C-D104768A1214", delegate: self)
    }
    
    func unlock(){
        simpleBluetoothIO.writeValue(value: 0)
    }
    
    func lock(){
        simpleBluetoothIO.writeValue(value: 1)
    }

    @IBAction func ledToggleButtonDown(_ sender: UIButton) {
        simpleBluetoothIO.writeValue(value: 1)
    }

    @IBAction func ledToggleButtonUp(_ sender: UIButton) {
        simpleBluetoothIO.writeValue(value: 0)
    }
    
    @IBAction func pinEntered(_ sender: Any) {
        pinTextField.resignFirstResponder()
        simpleBluetoothIO.writeValue(value: Int8(pinTextField.text!)!)
    }

}

extension ViewController: SimpleBluetoothIODelegate {
    func simpleBluetoothIO(simpleBluetoothIO: SimpleBluetoothIO, didReceiveValue value: Int8) {
        if value > 0 {
            view.backgroundColor = UIColor.yellow
        } else {
            view.backgroundColor = UIColor.black
        }
    }
}
