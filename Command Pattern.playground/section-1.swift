// Playground - noun: a place where people can play

import UIKit

protocol Command {

    func execute()
    func undo()

}

class Light {
    
    func on() {
        println("The light is on")
    }
    
    func off() {
        println("The light is off")
    }
    
}

class LightCommand: Command {
    
    let light: Light
    
    init(light: Light) {
        self.light = light
    }
    
    func execute() {
        light.on()
    }
    
    func undo() {
        light.off()
    }
    
}

class Heating {
    
    func turnUp(degrees: Int) {
        println("The heating is set to \(degrees)°C")
    }
    
    func turnOff() {
        println("The heating is off")
    }

}

class HeatingCommand: Command {
    
    let heating: Heating
    
    init(heating: Heating) {
        self.heating = heating
    }
    
    func execute() {
        heating.turnUp(23)
    }
    
    func undo() {
        heating.turnOff()
    }
    
}

class Stack<T> {
    
    var stack: [T] = [T]()
    
    func push(value: T) {
        stack.append(value)
    }
    
    func pop() -> T? {
        return stack.removeLast()
    }

}

let lightCommand = LightCommand(light: Light())

let commandStack = Stack<Command>()
lightCommand.execute()
commandStack.push(lightCommand)

if let undoCommand = commandStack.pop() {
    undoCommand.undo()
}

// MARK: Closures as commands

typealias CommandClosure = () -> Void

var commands = [CommandClosure]()

let heatingCommand = { () -> Void in
    let heating = Heating()
    heating.turnUp(23)
}

commands.append(heatingCommand)
commands[0]()

