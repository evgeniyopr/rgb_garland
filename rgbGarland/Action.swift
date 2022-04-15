//
//  Action.swift
//  rgbGarland
//
//  Created by Evgeniy Opryshko on 17.11.2021.
//

import Foundation

/*
    Протокол связи, посылка начинается с режима. Режимы:
    0 - отправка цвета $0 colorHEX;
    1 - отправка координат точки $1 X Y;
    2 - заливка - $2;
    3 - очистка - $3;
    4 - яркость - $4 value;
    5 - картинка $5 colorHEX X Y;
    6 - текст $6 some text
    7 - управление текстом: $7 1; пуск, $7 0; стоп
    8 - эффект
      - $8 0 номерЭффекта;
      - $8 1 старт/стоп;
    9 - игра
    10 - кнопка вверх
    11 - кнопка вправо
    12 - кнопка вниз
    13 - кнопка влево
    14 - пауза в игре
    15 - скорость $8 скорость;
  */

enum Action {
    
    case color(color: String) //HEX
    case point(x: String, y: String)
    case fill
    case clear
    case brightness(value: String)
    case image(color: String, x: String, y: String)
    case text(text: String)
    case textControl(act: Act)
    case effect //todo
    
    case game(name: String)
    case forward
    case right
    case back
    case left
    case pause
    
    case startRoutine
    case stopRoutine
    
    var msg: String {
        switch self {
        case .color(let color):
            return "$0 \(color);"
        case .point(let x, let y):
            return "$1 \(x) \(y);"
        case .fill:
            return "$2;"
        case .clear:
             return "$3;"
        case .brightness(let value):
            return "$4 \(value);"
        case .image(let color, let x, let y):
            return "$5 \(color) \(x) \(y);"
        case .text(let text):
            return "$6 \(text)"
        case .textControl(let act):
            return "$7 \(act.msg);"
        case .effect: //todo
            return ""
            
        case .game(let name):
            return "$9 \(name);"
        case .forward:
            return "$10;"
        case .right:
            return "$11;"
        case .back:
            return "$12;"
        case .left:
            return "$13;"
        case .pause:
            return "$14;"
            
        case .startRoutine:
            return "$20;"
        case .stopRoutine:
            return "$21;"
        }
    }
    
    enum Act {
        
        case start
        case stop
        
        var msg: String {
            switch self {
            case .start:
                return "1"
            case .stop:
                return "0"
            }
        }
    }
}
