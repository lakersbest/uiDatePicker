import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lbMessage: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 設定datePicker文字顏色
        datePicker.setValue(UIColor.systemBlue, forKeyPath: "textColor")
        // 設定datePicker背景顏色
        datePicker.backgroundColor = UIColor.systemBackground
        
        /* 即使iPhone語言設為繁體中文，地區設為台灣，Locale.current仍為en_TW，導致date picker(Locale設為default)無法切換成中文日期。只好檢查Locale.current文字有包含TW者就將date picker的Locale設為zh_TW */
        print("Locale.current: \(Locale.current)")
        if Locale.current.description.contains("TW") {
            datePicker.locale = Locale(identifier: "zh_TW")
        }
    }
    
    @IBAction func datePickerValueChanged(_ datePicker: UIDatePicker) {
        /* 準備格式化物件(中日期、短時間格式) */
        let dateFormatter = DateFormatter()
        dateFormatter.locale = datePicker.locale
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        /* date屬性可以取得/設定datePicker目前的日期 */
        let dateStr = dateFormatter.string(from: datePicker.date)
        lbMessage.text = dateStr
    }
}

